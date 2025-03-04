<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/4/2025
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="2px">
    <tr>
        <th>ID Sản Phẩm</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá Sản Phẩm</th>   
    </tr>
    <c:forEach items="${getAll}" var="importgoods" varStatus="status">
        <tr>
            <td>${importgoods.getId()}</td>
            <td>${importgoods.getName()}</td>
            <td>${importgoods.getPrice()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
