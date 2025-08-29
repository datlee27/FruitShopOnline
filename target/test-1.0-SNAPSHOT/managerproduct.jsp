<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.DAO, entity.Account, entity.Product, entity.Category, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Manager</title>
    <style>
     

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="<%= application.getContextPath()%>/fruit">Back</a>
     <a class="navbar-brand" href="">Product Management</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
            <a href="#" class="btn btn-success" onclick="openAddModal()">Add Product</a>
            </li>
        </ul>
    </div>
</nav>
     
     
     
  <!-- Add Product Modal -->
<div id="addProductModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close-btn" onclick="closeAddModal()">&times;</span>
        <form action="addproduct" method="post">
            <h4 style="text-align: center;">Add New Product</h4>
            <div class="form-group">
                <input type="text" class="form-control" name="nameProduct" placeholder="Product Name" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="img" placeholder="Image URL" required>
            </div>
            <div class="form-group">
                <input type="number" step="0.01" class="form-control" name="price" placeholder="Price" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="title" placeholder="Title" required>
            </div>
            <div class="form-group">
                <textarea class="form-control" name="description" placeholder="Description" rows="2" required></textarea>
            </div>
            <div class="form-group">
                <label>Category</label>
                <select name="category" class="form-select" > 
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
  
  
  <div id="editProductModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close-btn" onclick="window.location.href='product'">&times;</span>
        <form action="edit" method="post">
             <input type="hidden" name="id" value="${detail.id}">
            <h4 style="text-align: center;">Edit Product</h4>
            <div class="form-group">
                <input value="${detail.nameProduct}" type="text" class="form-control" name="nameProduct" placeholder="Product Name" required>
            </div>
            <div class="form-group">
                <input  value="${detail.img}" type="text" class="form-control" name="img" placeholder="Image URL" required>
            </div>
            <div class="form-group">
                <input value="${detail.price}" type="number" step="0.01" class="form-control" name="price" placeholder="Price" required>
            </div>
            <div class="form-group">
                <input value="${detail.title}" type="text" class="form-control" name="title" placeholder="Title" required>
            </div>
            <div class="form-group">
                <textarea class="form-control" name="description" placeholder="Description" rows="2" required>${detail.description}</textarea>
            </div>
            <div class="form-group">
              <label>Category</label>
<select name="category" class="form-select"> 
    <c:forEach items="${listCc}" var="c">
         <option value="${c.cid}">${c.cname}</option>
    </c:forEach>
</select>
             
            </div>
            
            <div class="text-right">
                <button type="button" class="btn btn-secondary" onclick="window.location.href='product'">Cancel</button>
                <button type="submit" class="btn btn-success">Edit Product</button>
            </div>
        </form>
    </div>
</div>

     
     
     

 
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
                <td><img src="image/${p.img}"alt="${p.nameProduct}"/></td>
                <td>${p.price}</td>
                <td>${p.title}</td>
                <td>${p.description}</td>
                <td>
                    <a href="loadproduct?pid=${p.id}" class="btn btn-warning btn-sm"  >Edit</a>
                    <a href="delete?pid=${p.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

    <script>
          
    function openAddModal() {
        document.getElementById("addProductModal").style.display = "flex";
    }

    function closeAddModal() {
        document.getElementById("addProductModal").style.display = "none";
    }

  
window.onclick = function(event) {
    var addModal = document.getElementById("addProductModal");
    var editModal = document.getElementById("editProductModal");
    
    if (event.target === addModal) {
        addModal.style.display = "none";
    }
    if (event.target === editModal) {
        editModal.style.display = "none";
    }
};
    
            
    function openEditModal() {
        document.getElementById("editProductModal").style.display = "flex";
    }

    function closeEditModal() {
        document.getElementById("editProductModal").style.display = "none";
    }

  
    </script>
       
   <c:if test="${not empty detail}">
    <script>
        // Gọi hàm mở modal khi có dữ liệu sản phẩm cần edit
        openEditModal();
    </script>
</c:if>
</body>
</html>
