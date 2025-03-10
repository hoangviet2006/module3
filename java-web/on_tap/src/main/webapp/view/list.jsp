<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<c:import url="../navbar.jsp"></c:import>
<body>
<a href="admin?action=create"><button class="btn btn-primary btn-sm btn-lg px-4">CREATE</button></a>
<table id="tableProduct" class="table table-primary">
    <thead>
    <tr>
        <th>ID</th>
        <th>CODE</th>
        <th>BRAND</th>
        <th>MODEL</th>
        <th>PRICE</th>
        <th>RELEASE_DATE</th>
        <th>DESCRIPTION</th>
        <th>ACCESSORY</th>
        <th>UPDATE</th>
        <th>DELETE</th>
    </tr>
    </thead>
   <tbody>
   <c:forEach items="${list}" var="product" varStatus="satus">

       <tr>
           <td>${product.getId()}</td>
           <td>${product.getCode()}</td>
           <td>${product.getBrand()}</td>
           <td>${product.getModel()}</td>
           <td>${product.getPrice()}</td>
           <td>${product.getReleaseDate()}</td>
           <td>${product.getDescription()}</td>
           <td>${product.getNameAccessory()}</td>
           <td>
               <a href="/admin?action=update&id=${product.getId()}">
                   <button class="btn btn-primary btn-sm btn-lg px-4">UPDATE</button>
               </a>
           </td>
           <td>
               <button type="button" onclick="deleteId('${product.getId()}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                   DELETE
               </button>
           </td>
       </tr>
   </c:forEach>
   </tbody>
</table>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableProduct').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/admin" method="get">
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
<script>
    function deleteId(id){
        document.getElementById("deleteId").value=id;
    }
</script>
</body>
</html>
