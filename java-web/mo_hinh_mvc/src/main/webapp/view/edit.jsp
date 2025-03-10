<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2025
  Time: 7:45 PM
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
<c:import url="../navbar.jsp"></c:import>
<form action="/product?action=edit" method="post">
    <input class="form-control form-control-sm w-25" name="id" hidden="hidden" value="${product.getId()}">
    <input class="form-control form-control-sm w-25" name="code" placeholder="Nhập code " value="${product.getCode()}">
    <input class="form-control form-control-sm w-25" name="name" placeholder="Nhập tên" value="${product.getName()}">
    <input class="form-control form-control-sm w-25" name="price" placeholder="Nhập giá " value="${product.getPrice()}">
    <input class="form-control form-control-sm w-25" name="amount" placeholder="Nhập số lương" value="${product.getAmount()}">
    <input class="form-control form-control-sm w-25" name="description" placeholder="Nhập đánh giá" value="${product.getDescription()}">
    <input class="form-control form-control-sm w-25" name="status" placeholder="Nhập trạng thái" value="${product.getStatus()}">
    <button class="btn btn-primary btn-sm btn-lg px-4">Lưu</button>
</form>
</body>
</html>
