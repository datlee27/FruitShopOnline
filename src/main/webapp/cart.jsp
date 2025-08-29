<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@page import="java.util.Map, java.util.HashMap"%>
<%@page import="entity.CartItem"%>
<%@page import="entity.Account" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruit Shop</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="<%= application.getContextPath()%>/fruit">Back</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>

<div class="container mt-4">
<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    Account acc = (Account) session.getAttribute("acc");
    Boolean checkoutSuccess = (Boolean) session.getAttribute("checkoutSuccess");
    double total = 0;

    if (checkoutSuccess != null && checkoutSuccess) {
%>
    <div class="alert alert-success text-center">Cảm ơn bạn đã thanh toán!</div>
    <div class="text-center mt-4">
        <a href="fruit" class="btn btn-primary">Trở về trang chủ</a>
    </div>
<%
        session.removeAttribute("checkoutSuccess");
    } else if (cart == null || cart.isEmpty()) {
%>
    <h3 class="text-center">Giỏ hàng trống!</h3>
<%
    } else {
%>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr>
                <th>Name Product</th>
                <th>Image</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (CartItem ci : cart.values()) {
                total += ci.getSubTotal();
        %>
        <tr>
            <td><%= ci.getProduct().getNameProduct() %></td>
            <td><img src="image/<%= ci.getProduct().getImg() %>" width="60"></td>
            <td><%= ci.getQuantity() %></td>
            <td>$<%= ci.getProduct().getPrice() %></td>
            <td>$<%= ci.getSubTotal() %></td>
            <td>
                <a href="updateCart?action=dec&id=<%= ci.getProduct().getId() %>" class="btn btn-sm" style="background-color: #99ccff"> - </a>
                <a href="updateCart?action=inc&id=<%= ci.getProduct().getId() %>" class="btn btn-sm" style="background-color: #99ccff"> + </a>
                <a href="updateCart?action=del&id=<%= ci.getProduct().getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="4" align="right"><strong>Total:</strong></td>
            <td colspan="2">$<%= total %></td>
        </tr>
        </tbody>
    </table>

    <% if (acc == null) { %>
    <!-- Hiện form nếu chưa đăng nhập -->
    <div class="mt-4">
        <h4>Thông tin giao hàng</h4>
        <form action="checkout" method="post" class="form-unaccount">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="text" name="phone" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Xác nhận thanh toán</button>
        </form>
    </div>
    <% } else { %>
    <div class="text-right">
        <form action="checkout" method="post">
            <button type="submit" class="btn btn-success">Thanh toán</button>
        </form>
    </div>
    <% } %>
<% } %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
