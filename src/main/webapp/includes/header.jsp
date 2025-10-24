<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshFruit Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        /* Reset & Base */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9fb;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Header */
        header {
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.5rem;
            color: #3ce096;
        }

        .logo-icon {
            font-size: 1.8rem;
        }

        .desktop-nav {
            display: flex;
            gap: 2rem;
        }

        .desktop-nav a {
            text-decoration: none;
            color: #555;
            font-weight: 500;
            transition: color 0.2s;
        }

        .desktop-nav a:hover {
            color: #3ce096;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .icon-button {
            background: none;
            border: none;
            font-size: 1.4rem;
            cursor: pointer;
            color: #555;
            transition: color 0.2s;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .icon-button:hover {
            color: #3ce096;
        }

        .username {
            font-size: 0.95rem;
            font-weight: 600;
            color: #3ce096;
        }

        /* Dropdown Menu */
        .dropdown-menu {
            position: relative;
            display: inline-block;
        }

        .menu-button {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            padding: 8px;
            color: #555;
            transition: color 0.2s;
        }

        .menu-button:hover {
            color: #3ce096;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            top: 100%;
            background: white;
            min-width: 210px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
            overflow: hidden;
            margin-top: 10px;
            opacity: 0;
            transform: translateY(-10px);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .dropdown-content.show {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        .dropdown-content a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 18px;
            color: #444;
            text-decoration: none;
            font-size: 14.5px;
            transition: all 0.2s;
            border-bottom: 1px solid #f0f0f0;
        }

        .dropdown-content a:last-child {
            border-bottom: none;
        }

        .dropdown-content a:hover {
            background: #f8fff8;
            color: #3ce096;
            padding-left: 22px;
        }

        .dropdown-content i {
            width: 18px;
            font-size: 15px;
            color: #3ce096;
        }

        /* Welcome Message */
        #welcomeMessage {
            text-align: center;
            padding: 12px;
            background: #e6f7ee;
            color: #2e8b57;
            font-weight: 600;
            animation: fadeOut 0.5s forwards 2s;
        }

        @keyframes fadeOut {
            to { opacity: 0; height: 0; padding: 0; margin: 0; }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .desktop-nav {
                display: none;
            }
            .header-actions .username {
                display: none;
            }
            .logo span:not(.logo-icon) {
                font-size: 1.3rem;
            }
        }

        @media (min-width: 769px) {
            .dropdown-menu {
                display: inline-block !important;
            }
        }

        /* Content (demo) */
        .content {
            padding: 3rem 0;
            text-align: center;
            color: #666;
        }

        .content h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #3ce096;
        }
    </style>
</head>
<body>

<!-- Welcome Message (Demo) -->
<div id="welcomeMessage" style="display: none;">
    Đăng nhập thành công! Chào mừng bạn trở lại.
</div>

<!-- Header -->
<header>
    <div class="container">
        <div class="header-content">
            <!-- Logo -->
            <a href="<%= application.getContextPath() %>/fruit" class="logo">
                <span class="logo-icon">🍎</span>
                <span>FreshFruit</span>
            </a>

            <!-- Desktop Nav -->
            <nav class="desktop-nav">
                <a href="<%= application.getContextPath() %>/fruit">Home</a>
                <a href="<%= application.getContextPath() %>/cart.jsp">Cart</a>
                <a href="<%= application.getContextPath() %>/contact.jsp">Contact</a>
            </nav>

            <!-- Actions -->
            <div class="header-actions">
                <!-- User (Login or Greeting) -->
                <!-- User Greeting -->
                <c:choose>
                    <c:when test="${sessionScope.acc == null}">
                        <a href="<%= application.getContextPath() %>/login.jsp" class="icon-button" aria-label="Login">
                            <span>Login</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<%= application.getContextPath() %>/user.jsp" class="icon-button username" aria-label="User profile">
                            <span>Hi, ${sessionScope.acc.username}</span>
                        </a>
                    </c:otherwise>
                </c:choose>



                <!-- Dropdown Menu (3 gạch) - Chỉ hiện khi login -->
                <c:if test="${sessionScope.acc != null}">
                    <div class="dropdown-menu">
                        <button id="menu-toggle" class="icon-button menu-button" aria-label="User Menu">
                            <i class="fas fa-bars"></i>
                        </button>

                        <div id="dropdown-content" class="dropdown-content">
                            <c:if test="${sessionScope.acc.isSell == 1}">
                                <a href="<%= application.getContextPath() %>/product">
                                    <i class="fas fa-box"></i> Product
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                                <a href="<%= application.getContextPath() %>/account">
                                    <i class="fas fa-users-cog"></i> Manager Account
                                </a>
                            </c:if>
                            <a href="<%= application.getContextPath() %>/logout.jsp">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </div>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</header>



<!-- JavaScript -->
<script>
    // Simulate login với role
    function simulateLogin(type, isSell, isAdmin) {
        // Ẩn login, hiện user
        document.getElementById('login-btn').style.display = 'none';
        document.getElementById('user-greeting').style.display = 'flex';
        document.getElementById('user-menu').style.display = 'inline-block';

        // Cập nhật tên
        const names = { user: 'User', seller: 'Seller', admin: 'Admin', both: 'Super' };
        document.querySelector('#user-greeting span').textContent = `Hi, ${names[type]}`;

        // Hiển thị role
        document.querySelector('.role-sell').style.display = isSell ? 'flex' : 'none';
        document.querySelector('.role-admin').style.display = isAdmin ? 'flex' : 'none';

        // Welcome message
        const msg = document.getElementById('welcomeMessage');
        msg.style.display = 'block';
        msg.textContent = `Đăng nhập thành công! Chào ${names[type]}.`;
        setTimeout(() => {
            msg.style.display = 'none';
        }, 2500);

        // Đóng dropdown nếu mở
        document.getElementById('dropdown-content').classList.remove('show');
    }

    // Dropdown toggle
    document.addEventListener('DOMContentLoaded', function () {
        const menuBtn = document.getElementById('menu-toggle');
        const dropdown = document.getElementById('dropdown-content');

        if (menuBtn && dropdown) {
            menuBtn.addEventListener('click', function (e) {
                e.stopPropagation();
                dropdown.classList.toggle('show');
            });

            // Đóng khi click ngoài
            document.addEventListener('click', function (e) {
                if (!menuBtn.contains(e.target) && !dropdown.contains(e.target)) {
                    dropdown.classList.remove('show');
                }
            });

            // Đóng khi nhấn ESC
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    dropdown.classList.remove('show');
                }
            });
        }

        // Logout demo
        document.getElementById('logout-btn')?.addEventListener('click', function (e) {
            e.preventDefault();
            location.reload(); // Reset trang
        });
    });
</script>
</body>
</html>