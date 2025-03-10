<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<form action="/student?action=update" method="post">
    <input name="stt" hidden="hidden" value="${studentClass.getStt()}">
    <input name="id"  placeholder="Nhập id" value="${studentClass.getId()}">
    <input name="name" placeholder="Nhập tên mới" value="${studentClass.getName()}">
    <button>Lưu</button>
</form>
</body>
</html>
