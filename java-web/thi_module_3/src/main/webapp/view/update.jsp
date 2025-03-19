<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/14/2025
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<c:import url="../navbar.jsp"></c:import>
<body>
<form action="" method="post">
    <input class="form-control mb-3" type="hidden" name="id">
    <input class="form-control mb-3"  name="" placeholder="" value="${}">
    <input class="form-control mb-3"  name="" placeholder="" value="${}">
    <input class="form-control mb-3"  name="" placeholder="" value="${}">
    <input class="form-control mb-3"  name="" placeholder="" value="${}">
    <input class="form-control mb-3"  name="" placeholder="" value="${}">
    <div class="d-flex justify-content-center">
    <button class="btn btn-primary">Lưu</button>
    </div>
</form>
</body>
</html>
