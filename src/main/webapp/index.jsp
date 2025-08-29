<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.DAO, entity.Account, entity.Product, entity.Category, java.util.List" %>
<%@ page errorPage="errorPage.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruit Shop</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
      <link rel="stylesheet" href="js/app.js">
</head>
<body>

    <%@include file="../includes/header.jsp" %>
    <%@include file="../includes/banner.jsp" %>
    <%@include file="../includes/products.jsp" %>
    <%@include file="../includes/footer.jsp" %>
</body>
</html>
