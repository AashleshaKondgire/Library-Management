<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.revature.model.Author" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Author List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f8;
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .navbar {
            background-color: #4b79a1;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff !important;
        }
        .container {
            margin-top: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        h2 {
            color: #495057;
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-success {
            background-color: #5cb85c;
            border-color: #5cb85c;
            margin-bottom: 20px;
        }
        .btn-success:hover {
            background-color: #4cae4c;
            border-color: #4cae4c;
        }
        .table {
            border-collapse: separate;
            border-spacing: 0 10px;
        }
        .table th, .table td {
            background-color: #ffffff;
            border: none;
            border-radius: 5px;
        }
        .table th {
            background-color: #e9ecef;
        }
        .alert {
            border-radius: 5px;
        }
        footer {
            margin-top: 30px;
            text-align: center;
            font-size: 0.9rem;
            color: #ffffff;
            background-color: #4b79a1;
            padding: 10px 0;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2>Author List</h2>
    <a href="/authors/add" class="btn btn-success"><i class="fas fa-plus"></i> Add New Author</a>

    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success" role="alert">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Author Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<Author> authorList = (List<Author>) request.getAttribute("authors");
            for (Author author : authorList) { 
            %>
            <tr>
                <td><%= author.getName() %></td>
                <td>
                    <a href="/authors/edit/<%= author.getId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                    <a href="/authors/delete/<%= author.getId() %>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<footer>
    <p>&copy; 2024 Library Management System. All rights reserved.</p>
</footer>

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
