<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9fb;
            color: #333;
            line-height: 1.6;
        }
        .container {
            max-width: 700px;
            margin-top: 50px;
        }
        .edit-form-container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .edit-form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #3ce096;
            font-weight: 700;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control, .form-select {
            border-radius: 6px;
            padding: 10px 12px;
        }
        .form-control:focus, .form-select:focus {
            border-color: #3ce096;
            box-shadow: 0 0 0 0.2rem rgba(60, 224, 150, 0.25);
        }
        .form-group label {
            font-weight: 500;
            color: #555;
        }
        .btn-container {
            text-align: right;
            margin-top: 30px;
        }
        .btn {
            padding: 10px 25px;
            border-radius: 6px;
            font-weight: 500;
        }
        .btn-success {
            background-color: #3ce096;
            border-color: #3ce096;
        }
        .btn-success:hover {
            background-color: #2ecb85;
            border-color: #2ecb85;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="edit-form-container">
            <h2>Edit Product</h2>
            <form action="edit" method="post">
                <%-- Input ẩn để gửi ID sản phẩm đi --%>
                <input type="hidden" name="id" value="${detail.id}">

                <div class="form-group">
                    <label for="nameProduct">Product Name</label>
                    <input id="nameProduct" value="${detail.nameProduct}" type="text" class="form-control" name="nameProduct" required>
                </div>
                <div class="form-group">
                    <label for="img">Image URL</label>
                    <input id="img" value="${detail.img}" type="text" class="form-control" name="img" required>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input id="price" value="${detail.price}" type="number" step="0.01" class="form-control" name="price" required>
                </div>
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" value="${detail.title}" type="text" class="form-control" name="title" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" class="form-control" name="description" rows="3" required>${detail.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category" class="form-control">
                        <c:forEach items="${listCc}" var="c">
                            <%-- So sánh category của sản phẩm với danh sách category để chọn đúng --%>
                            <option value="${c.cid}" ${c.cid == detail.cateID ? 'selected' : ''}>
                                ${c.cname}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="btn-container">
                    <a href="product" class="btn btn-secondary">Cancel</a>
                    <button type="submit" class="btn btn-success">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>