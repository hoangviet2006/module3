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
<h1 style="text-align: center; ">Danh Sách Sản Phẩm</h1>
<div class="d-flex justify-content-between my-3 px-5">
    <a class="btn btn-success btn-sm" href="/phone?action=create">Create</a>
    <form action="/phone?action=search" method="post" class="d-flex">
        <input class="form-control form-control-sm w-75" name="id" placeholder="input name phone" value="${param.id}">
        <button class="btn btn-primary btn-sm mx-3">Search</button>
    </form>
</div>

<table class="table table-primary" border="1px">
    <tr>
        <th>ID Phone</th>
        <th>Name Phone</th>
        <th>Price</th>
        <th>Type</th>
        <th>Operation</th>
        <th>Operation</th>
    </tr>
    <c:forEach items="${list}" var="phone" varStatus="status">
        <tr>
            <td>${phone.getId()}</td>
            <td>${phone.getName()}</td>
            <td><fmt:formatNumber value="${phone.getPrice()}" pattern="#,###VND"/></td>
            <td>${phone.getType()}</td>
            <td>
                <button  type="button" onclick="deletePhone(${phone.getId()})" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Delete
                </button>
            </td>
            <td>
                <a href="/phone?action=edit&id=${phone.getId()}">
                    <button class="btn btn-primary btn-sm">Edit</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/phone" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="id" id="deleteId">
                    <input hidden="hidden" name="action" value="delete">
                    Bạn có muốn xóa sản phẩm này không
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deletePhone(id) {
        document.getElementById("deleteId").value = id;
    }
</script>
</html>
