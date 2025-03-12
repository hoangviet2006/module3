<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/10/2025
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/order?action=update" method="post">
  <input name="id" hidden="hidden" value="${findOrder.getId()}">
  <input name="user_name" value="${findOrder.getUserName()}">
  <input name="orders_date" value="${findOrder.getOrderDate()}">
  <input name="total_price" value="${findOrder.getTotalPrice()}">
  <input name="status" value="${findOrder.getStatus()}">
  <button>Lưu</button>
</form>
</body>
</html>
