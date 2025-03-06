<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2025
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        /* Đặt font chữ chung */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Khung chứa form */
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }

        /* Tiêu đề */
        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        /* Ô nhập liệu */
        .input-field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* Nút đăng nhập */
        .login-btn {
            width: 100%;
            padding: 12px;
            background: #4facfe;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .login-btn:hover {
            background: #00c6ff;
        }

        /* Liên kết quên mật khẩu */
        .forgot-password {
            display: block;
            margin-top: 10px;
            color: #555;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }
        input-field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 2px solid #4facfe; /* Viền màu xanh */
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
            transition: 0.3s;
        }

        /* Khi focus vào ô nhập liệu */
        .input-field:focus {
            border-color: #00c6ff;
            box-shadow: 0 0 8px rgba(0, 198, 255, 0.5);
        }

        /* Placeholder màu nhẹ hơn */
        .input-field::placeholder {
            color: #888;
        }

    </style>
</head>
<body>
<div class="login-container">
    <h2>Đăng Nhập</h2>
    <form action="/product" method="post">
        <input name="username" type="text" class="input-field" placeholder="Tên đăng nhập">
        <input name="password" type="password" class="input-field" placeholder="Mật khẩu">
        <button class="login-btn">Đăng Nhập</button>
    </form>
</div>
</body>
</html>
