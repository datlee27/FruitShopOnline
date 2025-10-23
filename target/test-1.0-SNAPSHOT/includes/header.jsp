<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruit Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<!-- Welcome Message -->
<c:if test="${not empty sessionScope.fine}">
    <div id="welcomeMessage" style="color: green; font-weight: bold; text-align: center;">
        ${sessionScope.fine}
    </div>
    
    <script>
        setTimeout(function () {
            var msg = document.getElementById("welcomeMessage");
            if (msg) {
                msg.style.display = "none";
            }
        }, 2000);
    </script>
    <c:remove var="fine" scope="session"/>
</c:if>

<!-- Header -->
<header>
    <div class="container">
        <div class="header-content">
            <a href="<%= application.getContextPath() %>/fruit" class="logo">
                <span class="logo-icon">🍎</span>
                <span>FreshFruit</span>
            </a>

            <nav>
                <a href="<%= application.getContextPath() %>/fruit">Home</a>
                <a href="<%= application.getContextPath() %>/cart.jsp">Cart</a>
                <a href="<%= application.getContextPath() %>/contact.jsp">Contact</a>
            </nav>

            <div class="search-bar">
                <span>🔍</span>
                <input type="text" placeholder="Search for fruits...">
            </div>

            <div class="header-actions">
                <c:if test="${sessionScope.acc == null}">
                    <a href="<%= application.getContextPath() %>/login.jsp" class="icon-button" aria-label="User account">
                        <span>👤</span>
                    </a>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                     <a href="<%= application.getContextPath() %>/user.jsp" class="icon-button" aria-label="User account">
                        <span>Hello ${sessionScope.acc.username}</span>
                    </a>
                </c:if>
                <a href="<%= application.getContextPath() %>/cart.jsp" class="icon-button" aria-label="Shopping cart">
                    <span>🛒</span>
                    <span class="cart-badge">3</span>
                </a>
                <button class="icon-button" aria-label="Menu">
                    <span>☰</span>
                </button>
            </div>
        </div>
    </div>
</header>

</body>
</html>
