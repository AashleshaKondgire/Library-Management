<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.revature.model.Author" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Edit Author</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            color: #343a40;
        }
        .navbar {
            background-color: #6c757d;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ffffff !important;
        }
        .container {
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        h2 {
            color: #495057;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-custom {
            background-color: #28a745;
            color: #ffffff;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        footer {
            background-color: #6c757d;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2 class="text-center"><%= (request.getAttribute("author") == null ? "Add" : "Edit") %> Author</h2>
    
    <form action="<%= request.getAttribute("formAction") %>" method="post">
        <div class="form-group">
            <label for="name">Author Name:</label>

            <!-- Checking if the 'author' object exists and casting only if it's not null -->
            <%
                Author author = (Author) request.getAttribute("author");
                String authorName = author != null ? author.getName() : "";
            %>
            
            <input type="text" class="form-control" id="name" name="name" value="<%= authorName %>" required>
        </div>

        <button type="submit" class="btn btn-custom">Save</button>
    </form>
</div>

<footer>
    <p>&copy; 2024 Library Management System. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
