<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/7/2025
  Time: 9:26 AM
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
<div>
    <form action="/view/create.jsp" method="post" class="mb-2 d-flex">
        <button class="btn btn-primary btn-sm btn-lg px-4">Create</button>
    </form>
</div>
<table id="tableStudent" class="table table-primary">
    <thead>
    <tr>
        <th>ID</th>
        <th>CODE</th>
        <th>Name</th>
        <th>PRICE</th>
        <th>AMOUNT</th>
        <th>DESCRIPTION</th>
        <th>STATUS</th>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="product" varStatus="status">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getCode()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getAmount()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getStatus()}</td>
            <td>
                <a href="/product?action=edit&id=${product.getId()}">
                    <button class="btn btn-primary">Edit</button>
                </a>
            </td>
            <td>
                <button type="button" onclick="deleteId(${product.getId()})" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
<%--                                    <a href="/product?action=delete&id=${product.getId()}">--%>
<%--                                        <button class="btn btn-primary">delete</button>--%>
<%--                                    </a>--%>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

</body>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/product" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="id" id="deleteId">
                    <input hidden="hidden" name="action" value="delete">
                    <p>Bạn có muốn xóa sản phẩm này</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Xác Nhận Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deleteId(id){
        document.getElementById("deleteId").value=id;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</html>
