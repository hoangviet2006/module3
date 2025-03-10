<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<c:import url="../navbar.jsp"></c:import>
<body>
<table id="tableProduct" class="table table-primary">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>PRICE</th>
        <th>INFORMATION</th>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    </thead>
<tbody>
<c:forEach items="${list}" var="electronics" varStatus="status">
    <tr>
        <td>${electronics.getId()}</td>
        <td>${electronics.getName()}</td>
        <td>${electronics.getPrice()}</td>
        <td>${electronics.getInformation()}</td>
        <td>
            <a href="/product?action=edit&id=${electronics.getId()}">
                <button class="btn btn-primary">Edit</button>
            </a>
        </td>
        <td>
            <a href="/product?action=delete&id=${electronics.getId()}">
                <button class="btn btn-primary">delete</button>
            </a>
        </td>
    </tr>
</c:forEach>
</tbody>
</table>
</body>

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
</html>
