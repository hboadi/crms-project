from flask import Flask, jsonify
import sqlite3
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

DB_PATH = "sql/crms.db"   # <-- make sure your DB is actually in the sql folder

def get_conn():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

@app.route("/")
def home():
    return {"message": "CRMS API is running!"}

@app.route("/students")
def students():
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT case_id, first_name, last_name, email FROM student")
    data = [dict(row) for row in cursor.fetchall()]
    return jsonify(data)

@app.route("/active_rentals")
def active_rentals():
    conn = get_conn()
    cursor = conn.cursor()
    query = """
    SELECT 
        r.rental_id,
        s.first_name || ' ' || s.last_name AS renter_name,
        r.item_name,
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
    return jsonify(data)

if __name__ == "__main__":
    app.run(debug=True)
