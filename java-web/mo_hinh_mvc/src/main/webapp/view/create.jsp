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
<form action="/product?action=create" method="post">
    <input class="form-control form-control-sm w-25" name="id" hidden="hidden">
    <input class="form-control form-control-sm w-25" name="code" placeholder="nhập code">
    <input class="form-control form-control-sm w-25" name="name" placeholder="nhập tên">
    <input class="form-control form-control-sm w-25" name="price" placeholder="Nhập giá">
    <input class="form-control form-control-sm w-25" name="amount" placeholder="nhập số lượng">
    <select class="form-control form-control-sm w-25" name="description" placeholder="nhập đánh giá">
        <option>1 Sao</option>
        <option>2 Sao</option>
        <option>3 Sao</option>
        <option>4 Sao</option>
        <option>5 Sao</option>
    </select>
    <select  class="form-control form-control-sm w-25" name="status" placeholder="nhập trạng thái">
        <option>Còn Hàng</option>
        <option>Hết Hàng</option>
    </select>
    <button class="btn btn-primary btn-sm btn-lg px-4">SAVE</button>
</form>
</body>
</html>
