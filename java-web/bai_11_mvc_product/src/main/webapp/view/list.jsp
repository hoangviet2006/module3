<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="/navbar.jsp"></c:import>
<h1 style="text-align: center">Danh Sách Sản Phẩm</h1>
<div class="d-flex justify-content-between my-3 px-5">
    <form action="/product?action=search" method="post">
        <div class="d-flex  justify-content-between my-0 px-0 ">
            <input class="form-control form-control-sm w-50 mb-1" name="nameSearch" placeholder="Nhập tên">
            <button class="btn btn-primary btn-sm mx-3">Tìm Kiếm</button>
        </div>
    </form>
    <a href="/product?action=create">
        <button class="btn btn-primary btn-sm mx-3">Thêm Mới</button>
    </a>
</div>
<table class="table table-primary" border="1px">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Mô tả</th>
        <th>Thao tác</th>
        <th>Thao tác</th>
    </tr>
    <c:forEach items="${list}" var="product" varStatus="status">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td><fmt:formatNumber value="${product.getPrice()}" pattern="#,###VND"/></td>
            <td>${product.getQuantity()}</td>
            <td>${product.getDescription()}</td>
            <td>
                <button type="button" onclick="deleteProduct(${product.getId()})" class="btn btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td>
                <a href="/product?action=edit&id=${product.getId()}">
                    <button class="btn btn-primary btn-sm">
                        Edit
                    </button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/product" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="id" id="deleteId">
                    <input hidden="hidden" name="action" value="delete">
                </div>
                 <p style="text-align: center">Bạn Có Muốn Xóa Sản Phầm Này Không </p>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deleteProduct(id) {
        document.getElementById("deleteId").value = id;
    }
</script>
</html>
