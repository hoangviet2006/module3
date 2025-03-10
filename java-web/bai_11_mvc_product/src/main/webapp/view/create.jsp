<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2025
  Time: 8:24 AM
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
<c:import url="/navbar.jsp"></c:import>
<form action="/product?action=create" method="post">
    <div class="d-flex justify-content-between my-1 px-0">
        <input class="form-control form-control-sm w-50 mb-2" hidden="hidden" name="id" placeholder="Nhập id">
        <input class="form-control form-control-sm w-50 mb-2" name="name" placeholder="Nhập tên">
        <input class="form-control form-control-sm w-50 mb-2" name="price" placeholder="Nhập giá">
        <input class="form-control form-control-sm w-50 mb-2" name="quantity" placeholder="Nhập số lượng">
        <input class="form-control form-control-sm w-50 mb-2" name="description" placeholder="Nhập mô tả">
        <button class="btn btn-primary btn-sm mx-3">Thêm Mới</button>
    </div>
</form>
</body>
</html>