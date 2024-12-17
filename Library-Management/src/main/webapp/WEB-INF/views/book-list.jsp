<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.revature.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .container {
            margin-top: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            font-weight: bold;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            font-weight: bold;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .modal-footer {
            background-color: #f4f4f4;
        }
        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
</nav>

<div class="container">
    <h2>Book List</h2>
    <a href="/books/add" class="btn btn-success mb-3">Add New Book</a>
    
    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success" role="alert">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<Book> bookList = (List<Book>) request.getAttribute("books");
            for (Book book : bookList) { 
            %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getIsbn() %></td>
                <td><%= book.getAuthor().getName() %></td>
                <td>
                    <a href="/books/edit/<%= book.getId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                    <a href="/books/delete/<%= book.getId() %>" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Delete</a>
                    <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#borrowModal<%= book.getId() %>"><i class="fas fa-book"></i> Borrow</button>
                </td>
            </tr>

            <!-- Borrow Modal -->
            <div class="modal fade" id="borrowModal<%= book.getId() %>" tabindex="-1" role="dialog" aria-labelledby="borrowModalLabel<%= book.getId() %>" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="/borrowRecords/borrow" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="borrowModalLabel<%= book.getId() %>">Borrow Book: <%= book.getTitle() %></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="borrowerName">Borrower Name</label>
                                    <input type="text" class="form-control" id="borrowerName" name="borrowerName" required>
                                </div>
                                <div class="form-group">
                                    <label for="borrowerEmail">Borrower Email</label>
                                    <input type="email" class="form-control" id="borrowerEmail" name="borrowerEmail" required>
                                </div>
                                <input type="hidden" name="bookId" value="<%= book.getId() %>">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Borrow</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

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
