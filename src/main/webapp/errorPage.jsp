<%@ page isErrorPage="true" %>
<html>
<head><title>Error</title></head>
<body>
    <h2>Something went wrong!</h2>
    <p>Error: <%= exception.getMessage() %></p>
</body>
</html>
