<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<H1 style="text-align: center">Danh Sách Orders</H1>
<table id="tableProduct" class="table table-primary">
    <thead>
    <tr>
        <th>ID</th>
        <th>userName</th>
        <th>orderDate</th>
        <th>totalPrice</th>
        <th>status</th>
        <th>UPDATE</th>
        <th>DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${order}" var="order" varStatus="satus">
        <tr>
            <td>${order.getId()}</td>
            <td>${order.getUserName()}</td>
            <td>${order.getOrderDate()}</td>
            <td>${order.getTotalPrice()}</td>
            <td>${order.getStatus()}</td>
            <td>
                <a href="/order?action=update&id=${order.getId()}">
                    <button class="btn btn-primary btn-sm btn-lg px-4">UPDATE</button>
                </a>
            </td>
            <td>
                <button type="button" onclick="deleteId('${order.getId()}')" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    DELETE
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/order" method="get">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xác Nhận Xóa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="id" id="deleteId">
                    <input hidden="hidden" name="action" value="delete">
                    <p>Bạn có muốn xóa sản phẩm này không</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">DELETE</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function deleteId(id) {
        document.getElementById("deleteId").value = id;
    }
</script>
</html>
