<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/5/2025
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/phone" method="post">
  <input hidden="hidden" name="action" value="add">
  <input name="id" placeholder="Input Id">
  <input name="name" placeholder="Input Name">
  <input name="price" placeholder="Input Price">
  <input name="type" placeholder="Input Type">
  <button>Add Phone</button>
</form>
</body>
</html>
