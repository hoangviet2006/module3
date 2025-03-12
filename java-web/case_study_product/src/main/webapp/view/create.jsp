<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <h3 class="text-center mb-3">Thêm Sản Phẩm</h3>
        <form action="/admin?action=create" method="post">
            <input class="form-control mb-2" onblur="checkCode()" name="code" id="code" placeholder="Nhập code">
            <small id="errorCode"></small>
            <input class="form-control mb-2" onblur="checkBrand()" name="brand" id="brand" placeholder="Nhập brand">
            <small id="errorBrand"></small>
            <input class="form-control mb-2" onblur="checkModel()" name="model" id="model" placeholder="Nhập model">
            <small id="errorModel"></small>
            <input class="form-control mb-2" onblur="checkPrice()" name="price" id="price" placeholder="Nhập price">
            <small id="errorPrice"></small>
            <input class="form-control mb-2" onblur="checkRelease_date()" name="release_date" id="release_date" placeholder="Nhập release_date">
            <small id="errorRelease_date"></small>
            <input class="form-control mb-2" onblur="checkDescription()" name="description" id="description" placeholder="Nhập description">
            <small id="errorDescription"></small>
            <label for="id_accessory" class="form-label"></label>
            <select name="id_accessory" id="id_accessory" class="form-select mb-2" onblur="checkSelect()">
                <option value="">-- Chọn phụ kiện --</option>
                <c:forEach items="${accessoryList}" var="accessory">
                    <option value="${accessory.getId()}">${accessory.getName()}</option>
                </c:forEach>
            </select>
            <small id="errorSelect"></small>
            <button id="btn-save" class="btn btn-primary w-100">Lưu</button>
        </form>
    </div>
</div>
<script>
    let inputCode=false;
    let inputBrand=false;
    let btnCheck = inputCode&&inputBrand
    document.getElementById("btn-save").disabled = true;
    function checkCode() {
        const regex = /^[A-Z]{2}-\d{3}$/;
        let code = document.getElementById("code").value;
        if (regex.test(code)) {
            inputCode=true;
            document.getElementById("errorCode").innerText = "";
        } else {
            inputCode=false;
            document.getElementById("errorCode").innerText = "Vui lòng nhập đúng theo định dạng XX-nnn (với XX: 2 kí tự hoa; nnn: 3 số)";
        }
        btnCheck = inputCode&&inputBrand
        if (btnCheck){
             alert("ok")
            document.getElementById("btn-save").disabled = false;
        }else {
            document.getElementById("btn-save").disabled = true;
        }
    }

    function checkBrand() {
        let code = document.getElementById("brand").value;
        if (code === "") {
            inputBrand=false;
            document.getElementById("errorBrand").innerText = "Không được để trống";
        } else {
            inputBrand=true;
            document.getElementById("errorBrand").innerText = "";
        }
        btnCheck = inputCode&&inputBrand
        if (btnCheck){
            document.getElementById("btn-save").disabled = false;
        }else {
            document.getElementById("btn-save").disabled = true;
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

    function checkSelect() {
        let code = document.getElementById("id_accessory").value;
        if (code === "") {
            document.getElementById("errorSelect").innerText = "Không được để trống";
        } else {
            document.getElementById("errorSelect").innerText = "";
        }
    }


</script>
</body>
</html>
