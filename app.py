from flask import Flask, jsonify, request
from flask_cors import CORS
import sqlite3
from datetime import datetime

app = Flask(__name__)
CORS(app, supports_credentials=True, resources={r"/*": {
    "origins": "*",
    "allow_headers": "*",
    "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"]
}})


DB_PATH = "sql/crms.db"    # Adjust if located elsewhere


# ------------------------------
# DATABASE CONNECTION
# ------------------------------
def get_conn():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


# ------------------------------
# GET ALL STUDENTS
# ------------------------------
@app.route("/students")
def students():
    conn = get_conn()
    cursor = conn.cursor()

    cursor.execute("SELECT case_id, first_name, last_name, email FROM student")
    data = [dict(row) for row in cursor.fetchall()]

    conn.close()
    return jsonify(data)


# ------------------------------
# GET ACTIVE RENTALS
# ------------------------------
@app.route("/active_rentals")
def active_rentals():
    conn = get_conn()
    cursor = conn.cursor()

    query = """
    SELECT 
        r.rental_id,
        r.item_name,
        s.first_name || ' ' || s.last_name AS renter_name,
        r.checkout_date,
        r.due_date,
        CASE 
            WHEN r.due_date < date('now') THEN 'OVERDUE'
            WHEN r.due_date = date('now') THEN 'DUE TODAY'
            ELSE 'OK'
        END AS status
    FROM rental r
    JOIN student s ON r.renter_case_id = s.case_id
    WHERE r.status = 'active'
    ORDER BY r.due_date
    """

    cursor.execute(query)
    data = [dict(row) for row in cursor.fetchall()]
    conn.close()
    return jsonify(data)



# ------------------------------
# CHECK OUT AN ITEM
# ------------------------------
@app.route("/checkout", methods=["POST"])
def checkout_item():
    data = request.json

    renter_case_id = data.get("case_id")
    student_name = data.get("student_name")   # not used for DB, only UI
    item_name = data.get("item_name")
    checkout_date = data.get("checkout_date")
    due_date = data.get("due_date")

    if not renter_case_id or not item_name or not checkout_date or not due_date:
        return jsonify({"error": "Missing required fields"}), 400

    conn = get_conn()
    cursor = conn.cursor()

    # 1. Check student exists
    cursor.execute("SELECT case_id FROM student WHERE case_id = ?", (renter_case_id,))
    student = cursor.fetchone()
    if not student:
        conn.close()
        return jsonify({"error": "Student with that Case ID does not exist"}), 400

    # 2. Get ITEM ID (this is the missing piece!)
    cursor.execute("SELECT item_id FROM item WHERE item_name = ?", (item_name,))
    item = cursor.fetchone()
    if not item:
        conn.close()
        return jsonify({"error": "Item name not found in database"}), 400

    item_id = item[0]

    # 3. Generate rental ID
    cursor.execute("SELECT COUNT(*) FROM rental")
    count = cursor.fetchone()[0]
    rental_id = f"RNT{count + 1:03d}"

    # 4. Insert rental
    cursor.execute("""
        INSERT INTO rental (rental_id, item_id, item_name, renter_case_id, employee_id, checkout_date, due_date, status)
        VALUES (?, ?, ?, ?, ?, ?, ?, 'active')
    """, (rental_id, item_id, item_name, renter_case_id, 1, checkout_date, due_date))

    conn.commit()
    conn.close()

    return jsonify({
        "message": "Item successfully checked out!",
        "rental_id": rental_id,
        "renter_case_id": renter_case_id,
        "item_name": item_name,
        "checkout_date": checkout_date,
        "due_date": due_date
    }), 200



# ------------------------------
# RETURN AN ITEM
# ------------------------------
@app.route("/return/<rental_id>", methods=["POST"])
def return_item(rental_id):
    conn = get_conn()
    cursor = conn.cursor()

    # Update rental as returned
    cursor.execute("""
        UPDATE rental
        SET status = 'returned'
        WHERE rental_id = ?
    """, (rental_id,))

    if cursor.rowcount == 0:
        conn.close()
        return jsonify({"error": "Rental ID not found"}), 404

    conn.commit()
    conn.close()

    return jsonify({"message": "Item successfully returned!"})

# ------------------------------
# RUN THE APP
# ------------------------------
if __name__ == "__main__":
    app.run(debug=True)
