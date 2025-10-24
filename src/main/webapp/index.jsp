<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.DAO, entity.Account, entity.Product, entity.Category, java.util.List" %>
<%@ page errorPage="errorPage.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshFruit - Fresh Organic Fruits Delivered</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

    <%@include file="../includes/header.jsp" %>
    <%@include file="../includes/banner.jsp" %>

    <!-- Categories -->
    <section class="categories">
        <div class="container">
            <div class="section-header">
                <h2>Shop by Category</h2>
                <p>Explore our wide range of fresh fruit categories</p>
            </div>

            <div class="categories-grid">
                <div class="category-card orange">
                    <div class="category-icon">🍊</div>
                    <h3>Citrus</h3>
<%--                    <p>25 items</p>--%>
                </div>
                <div class="category-card red">
                    <div class="category-icon">🍓</div>
                    <h3>Berries</h3>
<%--                    <p>18 items</p>--%>
                </div>
                <div class="category-card yellow">
                    <div class="category-icon">🥭</div>
                    <h3>Tropical</h3>
<%--                    <p>32 items</p>--%>
                </div>
                <div class="category-card pink">
                    <div class="category-icon">🍑</div>
                    <h3>Stone Fruits</h3>
<%--                    <p>15 items</p>--%>
                </div>
                <div class="category-card green">
                    <div class="category-icon">🍉</div>
                    <h3>Melons</h3>
<%--                    <p>12 items</p>--%>
                </div>
                <div class="category-card red-light">
                    <div class="category-icon">🍎</div>
                    <h3>Apples & Pears</h3>
<%--                    <p>28 items</p>--%>
                </div>
            </div>
        </div>
    </section>

    <%@include file="../includes/products.jsp" %>

    <!-- Features -->
    <section class="features">
        <div class="container">
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">🚚</div>
                    <h3>Free Delivery</h3>
                    <p>On all orders over $50</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">✨</div>
                    <h3>Quality Guarantee</h3>
                    <p>100% fresh or money back</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🕐</div>
                    <h3>Same Day Delivery</h3>
                    <p>Order before 2pm</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🌿</div>
                    <h3>Organic Options</h3>
                    <p>Certified organic produce</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Newsletter -->
    <section class="newsletter">
        <div class="container">
            <div class="newsletter-content">

                <h2>Subscribe to Our Newsletter</h2>
                <p>Get exclusive deals, recipes, and the latest updates on new fruit arrivals!</p>
                
                <form class="newsletter-form">
                    <input type="email" class="newsletter-input" placeholder="Enter your email address" required>
                    <button type="submit" class="newsletter-btn">Subscribe</button>
                </form>

                <p class="newsletter-disclaimer">
                    We respect your privacy. Unsubscribe at any time.
                </p>
            </div>
        </div>
    </section>

    <%@include file="../includes/footer.jsp" %>
</body>
</html>
