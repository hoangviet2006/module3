<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2025
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<form action="/product?action=edit" method="post">
    <div class="d-flex justify-content-between my-0 px-0">
        <input class="form-control form-control-sm w-75 mb-2" name="id" hidden="hidden" value="${product.getId()}">
        <input class="form-control form-control-sm w-75 mb-2" name="name" value="${product.getName()}" required>
        <input class="form-control form-control-sm w-75 mb-2" name="price" value="${product.getPrice()}" required>
        <input class="form-control form-control-sm w-75 mb-2" name="quantity" value="${product.getQuantity()}" required>
        <input class="form-control form-control-sm w-75 mb-2" name="description" value="${product.getDescription()}" required>
        <button class="btn btn-primary btn-sm mx-3">Chỉnh Sửa</button>
    </div>

</form>
</body>
</html>