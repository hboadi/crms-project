import sqlite3
from datetime import datetime

class CRMS_CLI:
    def __init__(self, db_path):
        self.db_path = db_path
        
    def connect(self):
        """Connect to the SQLite database"""
        try:
            self.conn = sqlite3.connect(self.db_path)
            self.cursor = self.conn.cursor()
            print("Connected to CRMS database successfully!")
            return True
        except sqlite3.Error as e:
            print(f"Error connecting to database: {e}")
            return False
    
    def close(self):
        """Close database connection"""
        if self.conn:
            self.conn.close()
    
    def view_all_students(self):
        """Display all students"""
        print("\n=== ALL STUDENTS ===")
        query = "SELECT case_id, first_name, last_name, email FROM student"
        
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        if results:
            print(f"{'Case ID':<10} {'Name':<20} {'Email':<30}")
            print("-" * 60)
            for row in results:
                print(f"{row[0]:<10} {row[1]} {row[2]:<20} {row[3]:<30}")
        else:
            print("No students found.")
    
    def view_active_rentals(self):
        """Display all active rentals"""
        print("\n=== ACTIVE RENTALS ===")
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
            END as status
        FROM rental r
        JOIN student s ON r.renter_case_id = s.case_id
        WHERE r.status = 'active'
        ORDER BY r.due_date
        """
        
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        if results:
            print(f"{'Rental ID':<10} {'Renter':<20} {'Item':<20} {'Due Date':<12} {'Status':<10}")
            print("-" * 80)
            for row in results:
                print(f"{row[0]:<10} {row[1]:<20} {row[2]:<20} {row[4]:<12} {row[5]:<10}")
        else:
            print("No active rentals found.")

def main():
    # Create CLI instance
    crms = CRMS_CLI('/Users/hboadi/Desktop/crms-project/sql/crms.db')
    
    if not crms.connect():
        return
    
    while True:
        print("\n" + "="*50)
        print("CRMS - Command Line Interface")
        print("="*50)
        print("1. View All Students")
        print("2. View Active Rentals")
        print("3. Exit")
        
        choice = input("\nEnter your choice (1-3): ")
        
        if choice == '1':
            crms.view_all_students()
        elif choice == '2':
            crms.view_active_rentals()
        elif choice == '3':
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")
    
    crms.close()

if __name__ == "__main__":
    main()