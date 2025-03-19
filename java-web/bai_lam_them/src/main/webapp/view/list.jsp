<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/14/2025
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<form action="/pig?action=searchCode" method="post" class="mx-0 my-0 d-flex align-items-center ">
    <input class="form-control form-control-sm w-75  me-2" name="code" placeholder="code lợn cần tìm"
           value="${param.name}">
    <button class="btn btn-primary btn-sm justify-content-between">SearchCode</button>
</form>
<form action="/pig?action=seachName" method="post" class="mx-0 my-0 d-flex align-items-center ">
    <select name="name" id="name">
        <c:forEach items="${nameOrigin}" var="origin">
            <option value="${origin.getId()}">${origin.getname()}</option>
        </c:forEach>
    </select>
    <button class="btn btn-primary btn-sm justify-content-between">Search</button>
</form>
<table id="tableProduct" class="table table-primary">
    <thead>
    <tr>
        <th>Id</th>
        <th>Code</th>
        <th>importedDate</th>
        <th>importedWeight</th>
        <th>exportedDate</th>
        <th>exportedWeight</th>
        <th>status</th>
        <th>origin</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="pig" varStatus="status">
        <tr>
            <td>${pig.getId()}</td>
            <td>${pig.codePig}</td>
            <td>${pig.importedDate}</td>
            <td>${pig.importedWeight}</td>
            <td>${pig.exportedDate}</td>
            <td>${pig.exportedWeight}</td>
            <td>${pig.status}</td>
            <td>${pig.name}</td>
            <td>
                <a href="/pig?action=update&id=${pig.getId()}">
                    <button class="btn btn-primary">Detail</button>
                </a>
            </td>
            <td>
                <button type="button" class="btn btn-primary btn-sm" onclick="deleteId('${pig.getId()}')"
                        data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/pig" method="get">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="confirmDeleteLabel">Xác Nhận Xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="deleteId">
                    <input type="hidden" name="action" value="delete">
                    <p>Bạn có chắc chắn muốn xóa chú heo này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function deleteId(id) {
        document.getElementById("deleteId").value = id;
    }
</script>

</html>
