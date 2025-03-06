<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/5/2025
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/phone?action=edit" method="post">
  <input hidden="hidden" name="action" value="edit">
  <input name="id" hidden="hidden" value="${phones.getId()}">
  <input name="name" value="${phones.getName()}">
  <input name="price" value="${phones.getPrice()}">
  <input name="type" value="${phones.getType()}">
  <button>Edit</button>
</form>
</body>
</html>
