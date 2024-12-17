<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.revature.model.Borrower, com.revature.model.BorrowRecord" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrower List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #eef2f3;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .container {
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
        }
        .alert {
            margin-bottom: 20px;
        }
        .table {
            margin-top: 20px;
        }
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table td {
            vertical-align: middle;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            border-radius: 50px;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .modal-footer {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2>Borrower List</h2>

    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success" role="alert">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th>Borrower Name</th>
                <th>Email</th>
                <th>Book Title</th>
                <th>Borrow Date</th>
                <th>Due Date</th>
                <th>Return Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<Borrower> borrowerList = (List<Borrower>) request.getAttribute("borrowers");
            for (Borrower borrower : borrowerList) {
                List<BorrowRecord> borrowRecords = borrower.getBorrowRecords(); // Get all borrow records
                for (BorrowRecord record : borrowRecords) {
            %>
            <tr>
                <td><%= borrower.getName() %></td>
                <td><%= borrower.getEmail() %></td>
                <td><%= record.getBook().getTitle() %></td>
                <td><%= record.getBorrowDate() %></td>
                <td><%= record.getDueDate() %></td>
                <td><%= record.getReturnDate() != null ? record.getReturnDate() : "Not Returned" %></td>
            </tr>
            <% } } %>
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
