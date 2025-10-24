<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.DAO, entity.Account, entity.Product, entity.Category, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Reset & Base from header.jsp */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9fb; /* Consistent with header.jsp */
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Management Header (mimicking main header style) */
        .management-header {
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 1rem 0;
            margin-bottom: 30px; /* Space below the header */
        }

        .management-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .management-header-content .back-link {
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            font-weight: 500;
            color: #555;
            transition: color 0.2s;
            font-size: 1rem;
        }

        .management-header-content .back-link:hover {
            color: #3ce096;
        }

        .management-header-content .page-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #3ce096;
        }

        /* Modals */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1001; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        .modal.show {
            display: flex; /* Show as flex to center content */
        }

        .modal-content {
            background-color: #fff;
            margin: auto; /* Centered */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
            position: relative;
            min-width: 300px;
            max-width: 550px; /* Slightly wider for forms */
            width: 90%;
            transform: translateY(-20px); /* Initial state for animation */
            opacity: 0; /* Initial state for animation */
            transition: all 0.3s ease-out;
        }

        .modal.show .modal-content {
            transform: translateY(0);
            opacity: 1;
        }

        .close-btn {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 20px;
            cursor: pointer;
            transition: color 0.2s;
        }

        .close-btn:hover,
        .close-btn:focus {
            color: #3ce096;
            text-decoration: none;
        }

        .modal-content h4 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control, .form-select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            color: #333;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .form-control:focus, .form-select:focus {
            border-color: #3ce096;
            box-shadow: 0 0 0 0.2rem rgba(60, 224, 150, 0.25);
            outline: none;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #555;
        }

        .text-right {
            text-align: right;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            display: inline-flex; /* For icon alignment */
            align-items: center;
            gap: 8px;
        }

        .btn-success {
            background-color: #3ce096;
            color: #fff;
        }

        .btn-success:hover {
            background-color: #2ecb85;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #212529;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        /* Table styles */
        .product-table-container {
            margin-top: 30px;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
        }

        th {
            background-color: #f8f8f8;
            font-weight: 600;
            color: #555;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background-color: #f8fff8;
        }

        td img {
            max-width: 70px;
            height: auto;
            border-radius: 4px;
            display: block; /* Remove extra space below image */
        }
    </style>
    <%-- Font Awesome is used for icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

<!-- Management Header -->
<div class="management-header">
    <div class="container management-header-content">
        <a class="back-link" href="<%= application.getContextPath()%>/fruit">
            <i class="fas fa-arrow-left"></i> Back to Shop
        </a>
        <span class="page-title">Product Management</span>
        <a href="#" class="btn btn-success" onclick="openAddModal()">
            <i class="fas fa-plus"></i> Add Product
        </a>
    </div>
</div>

<main class="container">
  <!-- Add Product Modal -->
<div id="addProductModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeAddModal()">&times;</span>
        <form action="addproduct" method="post">
            <h4 style="text-align: center;">Add New Product</h4>
            <div class="form-group">
                <label for="addProductName">Product Name</label>
                <input type="text" class="form-control" id="addProductName" name="nameProduct" placeholder="Product Name" required>
            </div>
            <div class="form-group">
                <label for="addImageUrl">Image URL</label>
                <input type="text" class="form-control" id="addImageUrl" name="img" placeholder="Image URL" required>
            </div>
            <div class="form-group">
                <label for="addProductPrice">Price</label>
                <input type="number" step="0.01" class="form-control" id="addProductPrice" name="price" placeholder="Price" required>
            </div>
            <div class="form-group">
                <label for="addProductTitle">Title</label>
                <input type="text" class="form-control" id="addProductTitle" name="title" placeholder="Title" required>
            </div>
            <div class="form-group">
                <label for="addProductDescription">Description</label>
                <textarea class="form-control" id="addProductDescription" name="description" placeholder="Description" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label>Category</label>
                <select name="category" id="addProductCategory" class="form-select" >
                   <c:forEach items="${listC}" var="c">
                        <option value="${c.cid}">${c.cname}</option>
                    </c:forEach>
                </select>

            </div>

            <div class="text-right">
                <button type="button" class="btn btn-secondary" onclick="closeAddModal()">Cancel</button>
                <button type="submit" class="btn btn-success">Add Product</button>
            </div>
        </form>
    </div>
</div>

<!-- Product Table -->
<div class="product-table-container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name Product</th>
                <th>Image</th>
                <th>Price</th>
                <th>Title</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${listP}">
                <tr class="formProduct">
                    <td>${p.id}</td>
                    <td>${p.nameProduct}</td>
                    <td><img src="image/${p.img}" alt="${p.nameProduct}"/></td>
                    <td>$${p.price}</td>
                    <td>${p.title}</td>
                    <td>${p.description}</td>
                    <td>
                        <a href="loadproduct?pid=${p.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="delete?pid=${p.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete product ID ${p.id} - ${p.nameProduct}?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</main>
    <script>
    function openAddModal() {
        document.getElementById("addProductModal").classList.add("show");
    }

    function closeAddModal() {
        document.getElementById("addProductModal").classList.remove("show");
    }

window.onclick = function(event) {
    var addModal = document.getElementById("addProductModal");

    if (event.target === addModal) {
        closeAddModal();
    }
};

    </script>

</body>
</html>
