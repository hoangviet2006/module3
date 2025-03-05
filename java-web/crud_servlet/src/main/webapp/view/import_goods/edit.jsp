<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../../layout.jsp"></c:import>
</head>
<body>
<c:import url="../../navbar.jsp"></c:import>
<form action="/import" method="post">
    <input hidden="hidden" name="action" value="edit">
    <input name="id"  hidden="hidden" value="${importedGoods.getId()}" >
    <input name="name" value="${importedGoods.getName()}" placeholder="Nhập tên mới">
    <input name="price" value="${importedGoods.getPrice()}" placeholder="Nhập giá mơi">
    <button>Chỉnh sửa</button>
</form>
</body>
</html>
