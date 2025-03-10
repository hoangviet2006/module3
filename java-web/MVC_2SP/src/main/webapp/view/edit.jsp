<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<form action="/product?action=edit" method="post">
  <input name="id" hidden="hidden" value="${electronics.getId()}">
  <input name="name" placeholder="Nhập tên mới" value="${electronics.getName()}">
  <input name="price" placeholder="Nhập tên mới" value="${electronics.getPrice()}">
  <button>Lưu</button>
</form>
</body>
</html>
