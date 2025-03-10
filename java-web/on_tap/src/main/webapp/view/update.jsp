<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<div class="container d-flex justify-content-center align-items-start mt-5" style="height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px;">
        <h3 class="text-center mb-3">Chỉnh Sửa Sản Phẩm</h3>
        <form action="/admin?action=update" method="post">
            <input type="hidden" class="form-control mb-2" name="id" value="${product.getId()}">
            <input class="form-control mb-2" name="code" value="${product.getCode()}" placeholder="Nhập code">
            <input class="form-control mb-2" name="brand" value="${product.getBrand()}" placeholder="Nhập brand">
            <input class="form-control mb-2" name="model" value="${product.getModel()}" placeholder="Nhập model">
            <input class="form-control mb-2" name="price" value="${product.getPrice()}" placeholder="Nhập price">
            <input class="form-control mb-2" name="release_date" value="${product.getReleaseDate()}" placeholder="Nhập release_date">
            <input class="form-control mb-2" name="description" value="${product.getDescription()}" placeholder="Nhập description">
            <input class="form-control mb-2" name="id_accessory" value="${product.getId_accessory()}" placeholder="Nhập id_accessory">
            <button class="btn btn-primary w-100">Lưu</button>
        </form>
    </div>
</div>
</body>
</html>
