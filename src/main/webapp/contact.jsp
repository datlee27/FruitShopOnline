<%-- 
    Document   : products
    Created on : 16 thg 5, 2025, 11:21:50
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title >Fruit Shop</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <!-- nav bar-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="<%= application.getContextPath()%>/fruit">Back</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
            </nav>
                <!<!-- banner -->
                <main class="container my-4">
                    <h1>Contact to me !</h1>
                      <p> Phone:123123123</p>
                      <p> Facebook:FruitShopPage</p>
                      <p> Gmail:fruitshop@gmail.com</p>
                      <p> Instagram:FruitShop_</p>
                      
                      
                 
                </main>
       
        
        <!-- footer-->
         <footer class="bg-light text-center mt-auto py-3  ">
             
        <p>&copy; 2025 Fruit Shop  </p>
    </footer>
        <%--<%@include file="menu.jsp" %> để dòng code này nếu muốn thêm menu.jsp vào trang của bạn  --%>
       
      

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
    </body>
</html>
