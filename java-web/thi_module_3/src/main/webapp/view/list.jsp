<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<div class="d-flex justify-content-between my-3 px-5">
    <a class="btn btn-success btn-sm" href="/phone?action=create">Thêm Mới</a>
    <form action="/phone?action=search" method="post" class="d-flex">
        <input class="form-control form-control-sm w-75" name="id" placeholder="input name phone" value="${param.id}">
        <button class="btn btn-primary btn-sm mx-3">Tìm Kiếm</button>
    </form>
</div>
<table id="tableProduct" class="table table-striped table-hover table-bordered">
    <thead class="table-primary">
    <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${}" var="product">
        <tr>
            <td>${}</td>
            <td><fmt:formatNumber value="${getPrice()}" pattern="#,###VND"/></td>
            <td>
                <a href="/admin?action=update&id=${product.getId()}" class="btn btn-primary btn-sm">
                    Cập Nhật</a>
            </td>
            <td>
                <button type="button" class="btn btn-primary btn-sm" onclick="deleteId('${product.getId()}')" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                    Xóa</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<!-- Modal Xác Nhận Xóa -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="............." method="get">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="confirmDeleteLabel">Xác Nhận Xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="deleteId">
                    <input type="hidden" name="action" value="delete">
                    <p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableProduct').DataTable({
            "lengthChange": false,
            "autoWidth": false, // Tắt tự động điều chỉnh chiều rộng
            "info": false,// tắt info
            "pageLength": 5,
            "searching": false,
            "language": {
                "paginate": {
                    "previous": "Trước",
                    "next": "Tiếp"
                },
            },
            "scrollX": false, // tắt thanh lăn
        });
    });

    function deleteId(id) {
        document.getElementById("deleteId").value = id;
    }
</script>
</html>
