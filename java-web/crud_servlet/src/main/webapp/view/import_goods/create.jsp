
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
    <input hidden="hidden" name="action" value="create">
    <input name="id" placeholder="Nhập id">
    <input name="name" placeholder="Nhập tên">
    <input name="price" placeholder="Nhập giá">
    <button>Thêm mới</button>
</form>
</body>
</html>
