<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@page import="java.util.Map, java.util.HashMap"%>
<%@page import="entity.CartItem"%>
<%@page import="entity.Account" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - FreshFruit</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<%@include file="../includes/header.jsp" %>

<main class="container" style="padding-top: 2rem; padding-bottom: 2rem;">
    <div class="section-header">
        <h2>Your Shopping Cart</h2>
    </div>

<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    Account acc = (Account) session.getAttribute("acc");
    Boolean checkoutSuccess = (Boolean) session.getAttribute("checkoutSuccess");
    double total = 0;

    if (checkoutSuccess != null && checkoutSuccess) {
%>
    <div class="alert alert-success text-center">Thank you for your payment!</div>
    <div class="text-center mt-4">
        <a href="fruit" class="btn btn-primary">Back to Home</a>
    </div>
<%
        session.removeAttribute("checkoutSuccess");
    } else if (cart == null || cart.isEmpty()) {
%>
    <h3 class="text-center">Your cart is empty!</h3>
<%
    } else {
%>
    <div class="products-grid" style="grid-template-columns: 1fr;">
        <table class="table" style="background: white; border-radius: 1rem; overflow: hidden; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);">
            <thead style="background: #f9fafb;">
                <tr>
                    <th style="padding: 1.25rem;">Product</th>
                    <th style="padding: 1.25rem;">Quantity</th>
                    <th style="padding: 1.25rem;">Price</th>
                    <th style="padding: 1.25rem;">Total</th>
                    <th style="padding: 1.25rem;">Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (CartItem ci : cart.values()) {
                    total += ci.getSubTotal();
            %>
            <tr style="border-bottom: 1px solid #e5e7eb;">
                <td style="padding: 1.25rem;">
                    <div style="display: flex; align-items: center; gap: 1rem;">
                        <img src="image/<%= ci.getProduct().getImg() %>" width="80" style="border-radius: 0.5rem;">
                        <div>
                            <h3 class="product-title" style="margin-bottom: 0;"><%= ci.getProduct().getNameProduct() %></h3>
                        </div>
                    </div>
                </td>
                <td style="padding: 1.25rem; vertical-align: middle;"><%= ci.getQuantity() %></td>
                <td style="padding: 1.25rem; vertical-align: middle;">$<%= ci.getProduct().getPrice() %></td>
                <td style="padding: 1.25rem; vertical-align: middle;">$<%= ci.getSubTotal() %></td>
                <td style="padding: 1.25rem; vertical-align: middle;">
                    <a href="updateCart?action=dec&id=<%= ci.getProduct().getId() %>" class="btn btn-outline" style="padding: 0.5rem;">-</a>
                    <a href="updateCart?action=inc&id=<%= ci.getProduct().getId() %>" class="btn btn-outline" style="padding: 0.5rem;">+</a>
                    <a href="updateCart?action=del&id=<%= ci.getProduct().getId() %>" class="btn btn-outline" style="padding: 0.5rem; border-color: #ff6b6b; color: #ff6b6b;" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div style="display: flex; justify-content: flex-end; margin-top: 2rem;">
        <div style="background: white; border-radius: 1rem; padding: 2rem; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1); width: 100%; max-width: 400px;">
            <div style="display: flex; justify-content: space-between; font-size: 1.25rem; font-weight: 600; margin-bottom: 1rem;">
                <span>Total:</span>
                <span>$<%= total %></span>
            </div>

            <% if (acc == null) { %>
            <div class="mt-4">
                <h4>Shipping Information</h4>
                <form action="checkout" method="post" class="newsletter-form" style="flex-direction: column; gap: 1rem;">
                    <input type="text" name="name" class="newsletter-input" placeholder="Full Name" required>
                    <input type="email" name="email" class="newsletter-input" placeholder="Email" required>
                    <input type="text" name="address" class="newsletter-input" placeholder="Address" required>
                    <input type="text" name="phone" class="newsletter-input" placeholder="Phone" required>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Confirm Payment</button>
                </form>
            </div>
            <% } else { %>
            <div class="text-right">
                <form action="checkout" method="post">
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Checkout</button>
                </form>
            </div>
            <% } %>
        </div>
    </div>
<% } %>
</main>

<%@include file="../includes/footer.jsp" %>

</body>
</html>
