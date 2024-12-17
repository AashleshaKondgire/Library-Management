<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .navbar {
            background-color: #CC5500;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #f9f7f7 !important;
        }
        .nav-link {
            color: #f9f7f7 !important;
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: #ff6f61 !important;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .card-title {
            color: #4a4e69;
        }
        .quote {
            font-style: italic;
            font-size: 1.2rem;
            color: #666;
            text-align: center;
            margin-top: 30px;
        }
        footer {
            background-color: #4a4e69;
            color: #f9f7f7;
            text-align: center;
            padding: 15px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="/books/list">Books</a></li>
            <li class="nav-item"><a class="nav-link" href="/authors/list">Authors</a></li>
            <li class="nav-item"><a class="nav-link" href="/borrowers/list">Borrowers</a></li>
            <li class="nav-item"><a class="nav-link" href="/borrowRecords/list">Borrow Records</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h2 class="text-center mb-4">Welcome</h2>
    
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Books</h5>
                    <p class="card-text">Add, edit, and manage</p>
                    <a href="/books/list" class="btn btn-danger">Go to Books</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Authors</h5>
                    <p class="card-text">Add new authors and manage </p>
                    <a href="/authors/list" class="btn btn-danger">Go to Authors</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Borrowers</h5>
                    <p class="card-text">View and manage borrowers</p>
                    <a href="/borrowers/list" class="btn btn-danger">Go to Borrowers</a>
                </div>
            </div>
        </div>
    </div>

    
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
