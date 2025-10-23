<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FreshFruit</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

    <%@include file="../includes/header.jsp" %>

    <main class="container" style="padding-top: 2rem; padding-bottom: 2rem; display: flex; justify-content: center; align-items: center;">
        <div style="background: white; border-radius: 1rem; padding: 2rem; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1); max-width: 400px; width: 100%;">
            <form action="LoginServlet" method="post" class="newsletter-form" style="flex-direction: column; gap: 1rem;">
                <h2 class="section-header" style="margin-bottom: 1rem;">Login</h2>
                <c:if test="${not empty error}">
                    <div style="color: red; font-weight: bold; text-align: center;">${error}</div>
                </c:if>
                <div style="position: relative;">
                    <i class="fa-regular fa-user" style="position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); color: #9ca3af;"></i>
                    <input type="text" class="newsletter-input" name="username" placeholder="Username" required>
                </div>
                <div style="position: relative;">
                    <i class="fa-solid fa-key" style="position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); color: #9ca3af;"></i>
                    <input type="password" class="newsletter-input" name="password" id="passwordField" placeholder="Password" required>
                    <span id="eye" style="position:absolute; right:1rem; top:50%; transform:translateY(-50%); cursor:pointer; color: #9ca3af;">
                        <i class="fa-regular fa-eye"></i>
                    </span>
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>
            </form>
        </div>
    </main>

    <%@include file="../includes/footer.jsp" %>

    <script>
        document.getElementById("eye").addEventListener("click", function () {
            const passInput = document.getElementById("passwordField");
            const icon = this.querySelector("i");
            if (passInput.type === "password") {
                passInput.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                passInput.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        });
    </script>

</body>
</html>
