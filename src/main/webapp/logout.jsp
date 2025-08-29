<%-- 
    Document   : logout
    Created on : 21 thg 5, 2025, 15:26:36
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    session.invalidate();  // Xoá toàn bộ session
    response.sendRedirect("upload");
        %>  
    </body>
</html>
