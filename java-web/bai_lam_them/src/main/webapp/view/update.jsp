<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/14/2025
  Time: 1:51 PM
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
<form action="/pig?action=update" method="post">
    <input name="id" hidden="hidden" value="${pigDto.id}">
    <input name="code_pig" value="${pigDto.codePig}">
    <input name="imported_date" value="${pigDto.importedDate}">
    <input name="imported_weight" value="${pigDto.importedWeight}">
    <input name="exported_date" value="${pigDto.exportedDate}">
    <input name="exported_weight" value="${pigDto.exportedWeight}">
    <input name="status" value="${pigDto.status}">
    <input name="id_origin" value="${pigDto.idOrigin}">
    <button>lưu</button>
</form>
</body>
</html>
