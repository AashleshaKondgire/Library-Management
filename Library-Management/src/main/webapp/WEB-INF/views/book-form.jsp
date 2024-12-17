<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.revature.model.Book" %>
<%@ page import="java.util.List, com.revature.model.Author" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Edit Book</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffffff !important;
        }
        .container {
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }
        h2 {
            color: #495057;
            margin-bottom: 30px;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
            color: #495057;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .alert {
            border-radius: 5px;
            margin-top: 20px;
        }
        footer {
            margin-top: 30px;
            text-align: center;
            font-size: 0.9rem;
            color: #ffffff;
            background-color: #343a40;
            padding: 10px 0;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2><%= (request.getAttribute("book") == null ? "Add" : "Edit") %> Book</h2>

    <form action="<%= request.getAttribute("formAction") %>" method="post">
        <div class="form-group">
            <label for="title">Book Title:</label>
            <%
                Book book = (Book) request.getAttribute("book");
                String bookTitle = book != null && book.getTitle() != null ? book.getTitle() : "";
                String bookIsbn = book != null && book.getIsbn() != null ? book.getIsbn() : "";
                Author selectedAuthor = book != null ? book.getAuthor() : null;
            %>
            <input type="text" class="form-control" id="title" name="title" value="<%= bookTitle %>" required>
        </div>

        <div class="form-group">
            <label for="isbn">ISBN:</label>
            <input type="text" class="form-control" id="isbn" name="isbn" value="<%= bookIsbn %>" required>
        </div>

        <div class="form-group">
            <label for="author">Author:</label>
            <select class="form-control" id="author" name="authorId" required>
                <option value="">Select Author</option>
                <% 
                    List<Author> authorList = (List<Author>) request.getAttribute("authors");
                    if (authorList != null) {
                        for (Author author : authorList) {
                            String selected = selectedAuthor != null && selectedAuthor.getId().equals(author.getId()) ? "selected" : "";
                %>
                <option value="<%= author.getId() %>" <%= selected %>><%= author.getName() %></option>
                <% 
                        }
                    }
                %>
            </select>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Save</button>
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
