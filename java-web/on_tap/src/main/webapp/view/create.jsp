<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<div class="container d-flex justify-content-center align-items-start mt-5" style="height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px;">
        <h3 class="text-center mb-3">Thêm Sản Phẩm</h3>
        <form action="/admin?action=create" method="post">
            <input class="form-control mb-2" name="code" placeholder="Nhập code">
            <input class="form-control mb-2" name="brand" placeholder="Nhập brand">
            <input class="form-control mb-2" name="model" placeholder="Nhập model">
            <input class="form-control mb-2" name="price" placeholder="Nhập price">
            <input class="form-control mb-2" name="release_date" placeholder="Nhập release_date">
            <input class="form-control mb-2" name="description" placeholder="Nhập description">
            <input class="form-control mb-2" name="id_accessory" placeholder="Nhập id_accessory">
            <button class="btn btn-primary w-100">Lưu</button>
        </form>
    </div>
</div>
</body>
</html>
