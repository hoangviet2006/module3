<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<form action="/student?action=create" method="post">
    <input name="id" placeholder="nhập id">
    <input name="name" placeholder="nhập tên">
    <button>Lưu</button>
</form>
</body>
</html>
