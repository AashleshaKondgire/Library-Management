<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.revature.model.BorrowRecord" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Records</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #eef1f5;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #5c6bc0;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.8rem;
        }
        .container {
            margin-top: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
        }
        .btn {
            border-radius: 25px;
        }
        .btn-success {
            background-color: #4caf50;
            border: none;
        }
        .btn-success:hover {
            background-color: #388e3c;
        }
        .alert {
            margin-top: 15px;
        }
        .table {
            margin-top: 20px;
        }
        .table thead th {
            background-color: #3f51b5;
            color: white;
            text-align: center;
        }
        .table tbody td {
            text-align: center;
            vertical-align: middle;
        }
        .text-muted {
            font-style: italic;
        }
        .btn-warning, .btn-primary {
            border-radius: 20px;
            padding: 5px 10px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2>Borrow Records</h2>

    <a href="/borrowRecords/borrow" class="btn btn-success mb-3"><i class="fas fa-book"></i> Borrow a Book</a>

    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success" role="alert">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Borrower Name</th>
                <th>Book Title</th>
                <th>Borrow Date</th>
                <th>Due Date</th>
                <th>Return Date</th>
                <th>Fine (if applicable)</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<BorrowRecord> recordList = (List<BorrowRecord>) request.getAttribute("records");
            for (BorrowRecord record : recordList) {
                // Calculate the fine
                double fine = 0;
                if (record.getReturnDate() != null && record.getReturnDate().isAfter(record.getDueDate())) {
                    long daysLate = record.getReturnDate().toEpochDay() - record.getDueDate().toEpochDay();
                    fine = daysLate * 5.0; // Assuming fine is 5 per day late
                }
            %>
            <tr>
                <td><%= record.getBorrower().getName() %></td>
                <td><%= record.getBook().getTitle() %></td>
                <td><%= record.getBorrowDate() %></td>
                <td><%= record.getDueDate() %></td>
                <td><%= record.getReturnDate() != null ? record.getReturnDate() : "Not Returned" %></td>
                <td><%= fine > 0 ? "$" + fine : "No Fine" %></td>
                <td>
                    <% if (record.getReturnDate() == null) { %>
                    <a href="/borrowRecords/return/<%= record.getId() %>" class="btn btn-warning btn-sm">Return</a>
                    <a href="/borrowRecords/renew/<%= record.getId() %>" class="btn btn-primary btn-sm">Renew</a>
                    <% } else { %>
                    <span class="text-muted">Returned</span>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    window.setTimeout(function() {
        $(".alert").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove(); 
        });
    }, 10000); // 10 seconds
</script>

</body>
</html>
