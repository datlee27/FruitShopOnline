<%-- 
    Document   : manageraccount
    Created on : 21 thg 5, 2025, 17:45:12
    Author     : mac
--%>
 <%@ page import="listener.OnlineUserListener" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AccountList</title>
       
        <style>   table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        } 
        img {
            max-width: 100px;
            height: auto;
        }
        
.modal {
    display: none;
    position: fixed;
    z-index: 999;
    left: 0; top: 0;
    width: 100%; height: 100%;
    background-color: rgba(0,0,0,0.6);
    justify-content: center;
    align-items: center;
}
.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;

    max-width: 30%;
    position: relative;
    
  
}
.close-btn {
    position: absolute;
    right: 15px;
    top: 10px;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
}</style>
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
      
        <p>🟢 Online: <%= OnlineUserListener.getUserCount() %></p>
       <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Sell</th>
            <th>Admin</th>
            <th>Action</th> 
        </tr>
    </thead>
    <tbody>

        <c:forEach var="a" items="${listAcc}">
            <tr class="formAccount">
                <td>${a.id}</td>
                <td>${a.username}</td>
                
                <td>${a.password}</td>
                <td>${a.isSell}</td>
                <td>${a.isAdmin}</td>
                <td>
               <a href="loadproduct?aid=${a.id}" class="btn btn-warning btn-sm"  >Edit</a>
                   <a href="delete?aid=${a.id}" class="btn btn-danger btn-sm"
             onclick="return confirm('Are you sure you want to delete this account (ID: ${a.id})?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    </body>
</html>
