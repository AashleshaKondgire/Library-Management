<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.revature.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow a Book</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
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
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 40px;
        }
        h2 {
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2>Borrow a Book</h2>

    <form action="/borrowRecords/borrow" method="post">
        <div class="form-group">
            <label for="borrowerName">Borrower Name:</label>
            <input type="text" class="form-control" id="borrowerName" name="borrowerName" required>
        </div>

        <div class="form-group">
            <label for="borrowerEmail">Borrower Email:</label>
            <input type="email" class="form-control" id="borrowerEmail" name="borrowerEmail" required>
        </div>

        <div class="form-group">
            <label for="book">Select Book:</label>
            <select class="form-control" id="book" name="bookId" required>
                <option value="">Select Book</option>
                <% 
                List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
                %>
                <option value="<%= book.getId() %>"><%= book.getTitle() %></option>
                <% } %>
            </select>
        </div>

        <button type="submit" class="btn btn-primary"><i class="fas fa-book"></i> Borrow</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
