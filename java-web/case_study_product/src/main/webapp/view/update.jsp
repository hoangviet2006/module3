<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <c:import url="../layout.jsp"></c:import>
    <style>
        input.is-invalid, select.is-invalid {
            border: 2px solid red;
        }

        small {
            color: red;
        }

    </style>
</head>
<body>
<c:import url="../navbar.jsp"></c:import>
<div class="container d-flex justify-content-center align-items-start mt-5" style="height: 90vh;">
    <div class="card p-4 shadow-lg" style="width: 400px;">
        <h3 class="text-center mb-3">Chỉnh Sửa Sản Phẩm</h3>
        <form action="/admin?action=update" method="post">
            <input type="hidden" class="form-control mb-2" name="id" value="${product.getId()}">
            <input class="form-control mb-2" onblur="checkCode()" id="code" name="code" value="${product.getCode()}" placeholder="Nhập code">
            <small id="errorCode"></small>
            <input class="form-control mb-2" onblur="checkBrand()" id="brand" name="brand" value="${product.getBrand()}" placeholder="Nhập brand">
            <small id="errorBrand"></small>
            <input class="form-control mb-2" onblur="checkModel()" id="model" name="model" value="${product.getModel()}" placeholder="Nhập model">
            <small id="errorModel"></small>
            <input class="form-control mb-2" onblur="checkPrice()"  id="price"  name="price" value="${product.getPrice()}" placeholder="Nhập price">
            <small id="errorPrice"></small>
            <input class="form-control mb-2" onblur="checkRelease_date()" id="release_date" name="release_date" value="${product.getReleaseDate()}" placeholder="Nhập release_date">
            <small id="errorRelease_date"></small>
            <input class="form-control mb-2" onblur="checkDescription()" id="description" name="description" value="${product.getDescription()}" placeholder="Nhập description">
            <small id="errorDescription"></small>
            <input class="form-control mb-2" onblur="checkId_accessory()" id="id_accessory" name="id_accessory" value="${product.getId_accessory()}" placeholder="Nhập id_accessory">
            <small id="errorId_accessory"></small>
            <button class="btn btn-primary w-100">Lưu</button>
        </form>
    </div>
</div>
<script>
    function checkCode() {
        const regex = /^[A-Z]{2}-\d{3}$/;
        let code = document.getElementById("code").value;
        if (regex.test(code)) {
            document.getElementById("errorCode").innerText = "";
        } else {
            document.getElementById("errorCode").innerText = "Vui lòng nhập đúng theo định dạng XX-nnn (với XX: 2 kí tự hoa; nnn: 3 số)";
        }
    }

    function checkBrand() {
        let code = document.getElementById("brand").value;
        if (code === "") {
            document.getElementById("errorBrand").innerText = "Không được để trống";
        } else {
            document.getElementById("errorBrand").innerText = "";
        }
    }

    function checkModel() {
        let code = document.getElementById("model").value;
        if (code === "") {
            document.getElementById("errorModel").innerText = "Không được để trống";
        } else {
            document.getElementById("errorModel").innerText = "";
        }
    }

    function checkPrice() {
        let code = document.getElementById("price").value;
        if (code<0 || code==="") {
            document.getElementById("errorPrice").innerText = "Vui lòng nhập giá hợp lý";
        } else {
            document.getElementById("errorPrice").innerText = "";
        }
    }

    function checkRelease_date() {
        const regex = /^\d{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[12]\d|3[01])$/;
        let code = document.getElementById("release_date").value;
        if (regex.test(code)) {
            document.getElementById("errorRelease_date").innerText = "";
        } else {
            document.getElementById("errorRelease_date").innerText = "Vui lòng nhập đúng theo định dạng YYYY/mm/dd";
        }
    }

    function checkDescription() {
        let code = document.getElementById("description").value;
        if (code === "") {
            document.getElementById("errorDescription").innerText = "Không được để trống";
        } else {
            document.getElementById("errorDescription").innerText = "";
        }
    }

    function checkId_accessory() {
        let code = document.getElementById("id_accessory").value;
        if (code === "") {
            document.getElementById("errorId_accessory").innerText = "Không được để trống";
        } else {
            document.getElementById("errorId_accessory").innerText = "";
        }
    }
</script>
</body>
</html>
