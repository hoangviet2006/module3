<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/5/2025
  Time: 2:48 PM
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
<form action="/phone?action=create" method="post">
  <input class="form-control mb-3" name="id" placeholder="Input Id">
  <input class="form-control mb-3" name="name" placeholder="Input Name">
  <input class="form-control mb-3" name="price" placeholder="Input price">
  <input  class="form-control mb-3" name="type" placeholder="Input Type">
  <div class="d-flex justify-content-center">
  <button>Create</button>
  </div>
</form>
</body>
</html>
