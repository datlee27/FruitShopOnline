<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
    <c:if test="${empty listallP}">
        <p>Không có product nào.</p>
    </c:if>

    <div class="container mt-4">
        <div class="row">
            <c:forEach var="a" items="${listallP}">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <img src="image/${a.img}" class="card-img-top" alt="${a.nameProduct}">
                        <div class="card-body">
                            <h5 class="card-title">${a.nameProduct}</h5>
                            <p class="card-text">${a.description}</p>
                            <p class="card-text">Price: $${a.price}</p>
                            <a href="cart?aid=${a.id}" class="btn btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
