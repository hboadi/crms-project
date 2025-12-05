from flask import Flask, jsonify, request
from flask_cors import CORS
import sqlite3

app = Flask(__name__)
CORS(app, supports_credentials=True, resources={r"/*": {
    "origins": "*",
    "allow_headers": "*",
    "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"]
}})

DB_PATH = "sql/crms.db"


# ----------------------------------------
# DATABASE CONNECTION
# ----------------------------------------
def get_conn():
    # Timeout prevents "database is locked"
    conn = sqlite3.connect(DB_PATH, timeout=5)
    conn.row_factory = sqlite3.Row
    return conn


# ----------------------------------------
# GET ALL STUDENTS
# ----------------------------------------
@app.route("/students")
def students():
    conn = get_conn()
    cursor = conn.cursor()

    cursor.execute("SELECT case_id, first_name, last_name, email FROM student")
    data = [dict(row) for row in cursor.fetchall()]

    conn.close()
    return jsonify(data)


# ----------------------------------------
# GET ACTIVE RENTALS
# ----------------------------------------
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


# ----------------------------------------
# CHECK OUT ITEM
# ----------------------------------------
@app.route("/checkout", methods=["POST"])
def checkout_item():
    data = request.json

    renter_case_id = data.get("case_id")
    item_name = data.get("item_name")
    checkout_date =_
