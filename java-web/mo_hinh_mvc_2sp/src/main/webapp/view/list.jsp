<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout.jsp"></c:import>
</head>
<c:import url="../navbar.jsp"></c:import>
<body>
<div>
    <form action="/view/create.jsp" method="post" class="mb-2 d-flex">
        <button class="btn btn-primary btn-sm btn-lg px-4">Create</button>
    </form>
</div>
<table id="tableProduct" class="table table-primary">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>NAME</th>
        <th>CLASS_ID</th>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="student" varStatus="status">
        <tr>
            <td>${student.getStt()}</td>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getClass_name()}</td>
            <td>
                <a href="/student?action=update&stt=${student.getStt()}">
                    <button class="btn btn-primary">Edit</button>
                </a>
            </td>
            <td>
                <a href="/student?action=delete&stt=${student.getStt()}">
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
