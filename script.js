const API_URL = "http://127.0.0.1:5000";

// Build table helper
function buildTable(data, columns) {
    let table = "<table><tr>";

    columns.forEach(col => {
        table += `<th>${col.header}</th>`;
    });
    table += "</tr>";

    data.forEach(row => {
        table += "<tr>";
        columns.forEach(col => {
            let value = row[col.key] || "";

            // Color-coded statuses
            if (col.key === "status") {
                if (value === "OK") value = `<span class="status-ok">OK</span>`;
                if (value === "OVERDUE") value = `<span class="status-overdue">OVERDUE</span>`;
                if (value === "DUE TODAY") value = `<span class="status-today">DUE TODAY</span>`;
            }

            table += `<td>${value}</td>`;
        });
        table += "</tr>";
    });

    table += "</table>";
    return table;
}

//
// LOAD STUDENTS
//
async function loadStudents() {
    document.getElementById("checkout-form").style.display = "none";

    const res = await fetch(`${API_URL}/students`);
    const data = await res.json();

    const columns = [
        { header: "Case ID", key: "case_id" },
        { header: "First Name", key: "first_name" },
        { header: "Last Name", key: "last_name" },
        { header: "Email", key: "email" }
    ];

    document.getElementById("section-title").innerText = "All Students";
    document.getElementById("table-container").innerHTML = buildTable(data, columns);
}

//
// LOAD ACTIVE RENTALS
//
async function loadRentals() {
    document.getElementById("checkout-form").style.display = "none";

    const res = await fetch(`${API_URL}/active_rentals`);
    const data = await res.json();

    // Add return buttons
    data.forEach(row => {
        row.action = `<button class="return-btn" onclick="returnItem('${row.rental_id}')">Return</button>`;
    });

    const columns = [
        { header: "Rental ID", key: "rental_id" },
        { header: "Item", key: "item_name" },
        { header: "Renter", key: "renter_name" },
        { header: "Checkout Date", key: "checkout_date" },
        { header: "Due Date", key: "due_date" },
        { header: "Status", key: "status" },
        { header: "Action", key: "action" }
    ];

    document.getElementById("section-title").innerText = "Active Rentals";
    document.getElementById("table-container").innerHTML = buildTable(data, columns);
}

//
// RETURN ITEM
//
async function returnItem(rental_id) {
    if (!confirm("Return this item?")) return;

    const res = await fetch(`${API_URL}/return/${rental_id}`, {
        method: "POST"
    });

    const data = await res.json();

    if (res.ok) {
        alert("✔ " + data.message);
        loadRentals();
    } else {
        alert("❌ Error: " + data.error);
    }
}

//
// SHOW CHECKOUT FORM
//
function showCheckoutForm() {
    document.getElementById("section-title").innerText = "Checkout an Item";
    document.getElementById("table-container").innerHTML = "";
    document.getElementById("checkout-form").style.display = "block";
}

//
// SUBMIT CHECKOUT
//
async function submitCheckout() {
    const payload = {
        case_id: document.getElementById("case_id").value,
        student_name: document.getElementById("student_name").value,
        item_name: document.getElementById("item_name").value,
        checkout_date: document.getElementById("checkout_date").value,
        due_date: document.getElementById("due_date").value
    };

    const res = await fetch(`${API_URL}/checkout`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
    });

    const data = await res.json();

    if (res.ok) {
        alert("✔ " + data.message + "\nRental ID: " + data.rental_id);
        showCheckoutForm();
    } else {
        alert("❌ Error: " + data.error);
    }
}
