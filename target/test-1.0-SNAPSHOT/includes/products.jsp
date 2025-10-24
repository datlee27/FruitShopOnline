<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <style>
        .card-text {
            white-space: nowrap; /* Ngăn không cho văn bản xuống dòng */
            overflow: hidden; /* Ẩn phần văn bản bị thừa */
            text-overflow: ellipsis; /* Hiển thị dấu "..." cho phần bị ẩn */
            height: 1.5em; /* Giới hạn chiều cao tương đương một dòng */
            line-height: 1.5em; /* Căn giữa văn bản theo chiều dọc */
            margin-bottom: 1rem; /* Thêm khoảng cách dưới mô tả */
        }
    </style>
</head>
<body>
<section class="products">
    <div class="container">
        <div class="section-header">
            <div class="badge" style="margin: 0 auto 1rem;">Our Products</div>
            <h2>Featured Fruits</h2>
            <p>Handpicked from the finest farms. Quality you can taste, freshness you can see.</p>
        </div>

        <c:if test="${empty listallP}">
            <p>No products found.</p>
        </c:if>

        <div class="products-grid">
            <c:forEach var="a" items="${listallP}">
                <div class="product-card">
                    <div class="product-image">
                        <img src="image/${a.img}" alt="${a.nameProduct}">
                        <button class="wishlist-btn" aria-label="Add to wishlist">❤️</button>
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">${a.nameProduct}</h3>
                        <div class="rating">
                            <span class="stars">★★★★★</span>
                            <span class="rating-count">(4.5)</span>
                        </div>
                      
                        <p class="card-text">${a.description}</p>

                        <div class="price-group">
                            <span class="price">$${a.price}</span>
                            <span class="unit">/ kg</span>
                        </div>
                        <a href="cart?aid=${a.id}" class="add-to-cart">
                            🛒 Add to Cart
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
</body>
</html>
