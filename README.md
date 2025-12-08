# CRMS - Campus Rental Management System

A comprehensive database management system for tracking equipment rentals at Case Western Reserve University.

## 📋 Project Overview

The Campus Rental Management System (CRMS) is a SQLite-based database application designed to manage equipment rentals for college students. The system tracks items, item copies, student rentals, employee management, and return processes.

## 🏗️ Database Schema

### Core Entities
- **Students**: Campus users who can rent items
- **Employees**: Staff members who process rentals and returns
- **Items**: Equipment types available for rental (laptops, calculators, sports equipment, etc.)
- **ItemCopy**: Individual physical copies of items
- **Rentals**: Active and historical rental transactions
- **Returns**: Return processing and condition tracking

### Key Relationships
- Students can make multiple rentals
- Employees process multiple rentals and returns
- Items have multiple physical copies
- Rentals result in returns
- Employees can also be students (student workers)

## 📁 Project Structure

```
crms-project/
├── README.md                 # This file
├── app.py                   # Flask backend server
├── crms_client.py           # Python command-line interface
├── index.html               # Frontend web interface
├── script.js                # Frontend JavaScript logic
├── styles.css               # Frontend styling
└── sql/
    ├── schema.sql           # Database table definitions
    ├── sample_data.sql      # Sample data for testing
    ├── test_queries.sql     # Test queries and analytics
    └── crms.db             # SQLite database file (generated)
```

## 🚀 Setup Instructions

### Prerequisites
- Python 3.x
- SQLite3 (usually comes with Python)
- Flask and Flask-CORS (for web interface)
- Terminal/Command Line access
- Web browser (for frontend interface)

### Database Setup

1. **Clone the project**
   ```bash
   git clone https://github.com/hboadi/crms-project.git
   cd crms-project
   ```

2. **Create the database**
   ```bash
   cd sql
   sqlite3 crms.db < schema.sql
   ```

3. **Load sample data**
   ```bash
   sqlite3 crms.db < sample_data.sql
   ```

4. **Run test queries** (optional)
   ```bash
   sqlite3 crms.db < test_queries.sql
   ```

### Flask Web Interface Setup

1. **Install Flask dependencies**
   ```bash
   pip install flask flask-cors
   ```

2. **Run the Flask server**
   ```bash
   python app.py
   ```

3. **Open the web interface**
   - Open `index.html` in your web browser
   - The frontend will connect to the Flask backend automatically

### Python CLI Setup

1. **Run the command-line interface**
   ```bash
   python crms_cli.py
   ```

## 💻 Usage

### Database Operations

**Direct SQLite Access:**
```bash
cd sql
sqlite3 crms.db
sqlite> SELECT * FROM student;
sqlite> .quit
```

**Flask Web Interface:**
```bash
python app.py
# Then open index.html in your browser
```

**Python CLI Interface:**
```bash
python crms_cli.py
# Follow the menu prompts
```

## 📊 Sample Data

The system includes realistic sample data:
- **Students**: 12 campus students with varying majors
- **Employees**: 5 staff members (some are also students)
- **Items**: 16 different item types across categories:
  - Electronics (laptops, tablets, calculators)
  - Cleaning supplies (vacuums, swiffers)
  - Kitchen equipment (pots, blenders, air fryers)
  - Games (board games)
  - Sports equipment (soccer balls, tennis rackets)
- **Item Copies**: 66+ individual trackable items
- **Active Rentals**: Sample rental transactions
- **Returns**: Return processing examples

## 🔍 Key Features

### Business Logic
- **Automatic due dates**: 7 days from checkout
- **Status tracking**: Available, rented, maintenance, returned
- **Referential integrity**: Foreign key constraints prevent invalid data
- **Employee-student relationship**: Student workers can be both

### Analytics Capabilities
- Rental frequency analysis
- Overdue item tracking
- Employee workload monitoring
- Item popularity reporting
- Revenue analysis potential

### Data Integrity
- Primary key constraints on all entities
- Foreign key relationships maintain consistency
- Unique constraints on emails and IDs
- NOT NULL constraints on required fields

## 🛠️ Technical Implementation

### Database Design
- **Normalization**: Follows 3NF principles
- **ER Model**: Comprehensive entity-relationship design
- **Foreign Keys**: Proper relationship implementation
- **Denormalization**: Strategic inclusion of item_name in rentals for performance

### File Organization
- **Schema separation**: Clean DDL in schema.sql
- **Data separation**: Sample data in dedicated file
- **Test queries**: Organized testing and analytics queries
- **CLI interface**: Python application for user interaction


## 👥 Authors

- **Humphrey Boadi** 
- **Chiebuka Onyejesi** 
- **Wayzaro Taylor** 

**Course**: Database Systems  
**Institution**: Case Western Reserve University



