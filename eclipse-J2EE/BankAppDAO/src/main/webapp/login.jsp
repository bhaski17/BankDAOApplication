<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Google Fonts and Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-image: url("loginimage.png");
            background-size: cover;
            background-position: center;
            backdrop-filter: blur(10px);
            color: #333;
            padding-top: 80px;
            justify-content: center;
            align-items: center;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 75%;
            padding: 20px 12.5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 10;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 2em;
            color: #333;
            display: flex;
            align-items: center;
        }

        .logo .icon12 {
            margin-right: 10px;
            color: #ff6600;
        }

        .navigation a {
            position: relative;
            font-size: 1.1em;
            text-decoration: none;
            font-weight: 500;
            margin-left: 30px;
            color: #333;
        }

        .navigation a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 100%;
            height: 2px;
            background: #ff6600;
            border-radius: 5px;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .navigation a:hover::after {
            transform: scaleX(1);
        }

        .search {
            width: 250px;
            height: 40px;
            background: transparent;
            border: 2px solid #333;
            border-radius: 6px;
            display: flex;
            align-items: center;
            margin-right: 20px;
        }

        .search input {
            width: 100%;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #333;
            padding-left: 10px;
        }

        .search input::placeholder {
            color: #999;
        }

        .search .srchbtn {
            width: 40px;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .search .srchbtn .icon1 {
            font-size: 22px;
            color: #333;
        }

        .backBtn {
            width: 100px;
            height: 40px;
            background: #1e90ff;
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: 500;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .backBtn:hover {
            background: #0077cc;
        }

        footer {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px 12.5%;
            text-align: center;
            margin-top: 50px;
            border-top: 1px solid #ddd;
        }

        footer p {
            font-size: 14px;
            color: #555;
        }

        footer a {
            color: #ff6600;
            text-decoration: none;
        }

        .container {
            width: 300px;
            height: auto;
            padding: 30px;
            box-shadow: 0px 0px 10px black;
            margin: 100px auto;
            border-radius: 10px;
            justify-content: center;
            text-align: center;
            background-color: white;
        }

        .container .icon1 {
            font-size: 2em;
            height: 40px;
            width: 30px;
            align-items: center;
            justify-content: center;
        }

        .container .login-icon {
            background-color: rgb(240, 236, 236);
            width: 50px;
            border: none;
            box-shadow: 0px 5px 10px black;
            border-radius: 10px;
            margin-bottom: 10px;
            padding-top: 10px;
        }

        .container .login-icon:hover {
            filter: drop-shadow(2px 2px 2px blue);
        }

        .container h2 {
            margin-top: 10px;
            margin-bottom: 20px;
            font-size: 18px;
            color: #ff6600;
        }

        .inputbox input {
            padding: 10px;
            display: block;
            width: 260px;
            border: none;
            outline: none;
            margin: 5px;
            background-color: rgb(207, 203, 203);
            border-radius: 10px;
            text-indent: 20px;
        }

        .inputbox input:focus {
            box-shadow: 0px 0px 10px rgb(28, 171, 228);
        }

        .container .started {
            width: 270px;
            padding: 10px;
            border: none;
            border-radius: 20px;
            background: black;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin: 20px auto;
        }

        .started:active {
            background-color: transparent;
            color: black;
            border: 2px solid black;
        }

        .inputbox {
            position: relative;
            margin-top: 10px;
        }

        .inputbox .icon2 {
            position: absolute;
            top: 50%;
            left: 0.9rem;
            pointer-events: none;
            transform: translateY(-50%);
        }

        .container .forgot-password {
            text-align: right;
            margin-bottom: 10px;
        }

        .forgot-password a {
            text-decoration: none;
            color: black;
        }

        .forgot-password a:hover {
            color: red;
        }

        .container h1 {
            color: blue;
            text-decoration: underline;
        }

        .container .next {
            color: blue;
        }

        .container .next:active {
            color: red;
        }

       /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
            max-width: 300px;
        }

        .modal-content h3.success {
            color: green;
        }

        .modal-content h3.fail {
            color: red;
        }

        .modal-content button.su {
            padding: 10px 20px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button.fa {
            padding: 10px 20px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button.su:hover {
            background-color: darkgreen;
        }

        .modal-content button.fa:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <i class="fa-solid fa-building-columns icon12"></i>My Bank
        </div>
        <nav class="navigation">
            <a href="home.jsp">Home</a>
            <a href="#">Services</a>
            <a href="#">Contact Us</a>
            <a href="#">About</a>
        </nav>
        <form action="#" class="search">
            <input type="text" placeholder="Search...">
            <button type="submit" class="srchbtn"><span class="material-symbols-rounded icon12">search</span></button>
        </form>
        <button class="backBtn" onclick="window.location.href='home.jsp'">Back</button>
    </header>

    <!-- Main Content -->
    <div class="container">
        <button class="login-icon"><i class="fa-solid fa-building-columns icon1"></i></button>
        <h2>Login Page</h2>
        <% String successMessage = (String) request.getAttribute("success"); %>
        <% String failMessage = (String) request.getAttribute("fail"); %>
        <p>Welcome to My Bank. Please fill the credentials!!.</p>
        <form action="login" method="post">
            <div class="inputbox">
                <input type="text" name="account" placeholder="Account Number" inputmode="numeric" pattern="[0-9]*" maxlength="20" required>
                <i class="fa-solid fa-user icon2"></i>
            </div>
            <div class="inputbox">
                <input type="password" name="password" placeholder="Password" inputmode="numeric" pattern="[0-9]*" maxlength="8" required>
                <i class="fa-solid fa-lock icon2"></i>
            </div>
            <div class="forgot-password">
                <a href="forgetPassword.jsp">Forgot password?</a>
            </div>
            <button class="started" type="submit">Login Account</button>
            <p>Don't have account &nbsp;<a href="createAccount.jsp" class="next">click here</a> for signup</p>
        </form>
    </div>

    <!-- Modal for success/fail messages -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <% if (successMessage != null) { %>
                <h3 class="success"><%= successMessage %></h3>
                <button class="su" onclick="closeModal()">OK</button>
            <% } %>
            <% if (failMessage != null) { %>
                <h3 class="fail"><%= failMessage %></h3>
                <button class="fa" onclick="closeModal()">OK</button>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Contact Us: info@vbbank.com | Follow us on <a href="#">Social Media</a></p>
        <p>&copy; 2023 VB Bank. All rights reserved.</p>
    </footer>

    <script type="text/javascript">
        // Function to show the modal
        function showModal() {
            const modal = document.getElementById("successModal");
            modal.style.display = "flex";
        }

        // Function to close the modal
        function closeModal() {
            const modal = document.getElementById("successModal");
            modal.style.display = "none";
        }

        // Check if there's a success or fail message and show the modal
        <% if (successMessage != null || failMessage != null) { %>
            window.onload = showModal;
        <% } %>
    </script>
</body>
</html>