<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/4/2025
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../../layout.jsp"></c:import>
</head>
<body>
<c:import url="../../navbar.jsp"></c:import>
<h1>Quản Lý Sản Phẩm</h1>
<table class="table table-primary" border="1px">
    <tr>
        <th>ID Sản Phẩm</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá Sản Phẩm</th>
        <td>Thao Tác</td>
    </tr>
    <c:forEach items="${list}" var="importgoods" varStatus="status">
        <tr>
            <td>${importgoods.getId()}</td>
            <td>${importgoods.getName()}</td>
            <td>
                <fmt:formatNumber value="${importgoods.getPrice()}"  pattern="#,###VND"/>
            </td>
            <td>
                <button type="button"  onclick="deleteInfo(${importgoods.getId()},'${importgoods.getName()}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                   Delete
                </button>
                <a href="import?action=edit&id=${importgoods.getId()}"><button>Chỉnh Sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <a href="import?action=create">
        <button>Thêm mới</button>
    </a>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/import" method="get">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input hidden="hidden" name="id" id="deleteId">
                <input hidden="hidden" name="action" value="delete">
                <span>Bạn có muốn xóa sản phẩm có tên :  </span>
                <span id="deleteName"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        </form>
    </div>
</div>
<script>
    function deleteInfo(id,name){
        document.getElementById("deleteName").innerHTML = name
        document.getElementById("deleteId").value = id
    }
</script>
</body>
</html>
