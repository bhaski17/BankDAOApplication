<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password Page</title>
    <!-- Google Fonts and Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * {
            margin: 0;
            padding: 0;
            /* box-sizing: border-box; */
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-image: url("loginimage.png");
            background-size: cover;
            background-position: center;
            backdrop-filter: blur(10px);
            color: #333;
          
            padding-top: 80px; /* Added padding to prevent content from being hidden behind the fixed header */
            justify-content: center;
            align-items: center;
    



        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width:  75%;
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
            background: #1e90ff; /* Light blue color */
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: 500;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .backBtn:hover {
            background: #0077cc; /* Darker shade of blue on hover */
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

        /* login */
        .container{
            width: 300px;
           
            height: auto;
            padding: 30px;
            box-shadow: 0px 0px 10px black;
            margin: 100px auto;
            border-radius: 10px;
            justify-content: center;
            text-align: center;
            justify-content: space-between;
            opacity: 5;
            background-color:white ;
            /* backdrop-filter: blur(10px); */
        }
         .container .icon1{
            font-size: 2em;
            height: 40px;
            width: 30px;
             align-items: center;
             justify-content: center;
      
         }
        .container .login-icon{
            background-color: rgb(240, 236, 236);
            width: 50px;
            border: none;
           box-shadow: 0px 5px 10px black; 
           border-radius: 10px;
           margin-bottom: 10px;
           padding-top: 10px;
        }  
        .container .login-icon:hover {
    /* opacity: 0.4; */
    filter: drop-shadow(2px 2px 2px blue);
}
        .container h2{
            margin-top: 10px;
            margin-bottom: 20px;
            font-size: 18px;
            color: #ff6600;
        }
        .inputbox input{
            padding: 10px;
            display: block;
            width: 260px;
            border: none;
            outline: none;
            margin: 5px;
            background-color: rgb(207, 203, 203);
            border-radius: 10px;
            text-indent: 20px;
            /* transition: box-shadow 0.3s ease-in-out; */
        }
        .inputbox input:focus{
           box-shadow: 0px 0px 10px rgb(28, 171, 228);
           border: 50px black;
            
        }
        .container .started{
            width: 270px;
            padding: 10px;
            border: none;
            border-radius: 20px;
            background:black;
            color:white;
            font-size: 16px;
            cursor: pointer;
            margin: 20px auto;
        }
        .started:active{
            background-color: transparent;
            color: black;
            border: 2px solid black;
        }

        .inputbox{
            position: relative;
            margin-top: 10px;

        }
        .inputbox .icon2{
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
       .forgot-password a:hover{
            color: red;
        }
        .container h1{
            color: blue;
            text-decoration: underline;
        }

        .container .next{
            text-decoration: none;
            color: blue;
        }
        .container .next:active{
            color: red;
        }
        
      
        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
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

        .modal-content h3 {
            margin-bottom: 10px;
            color: red;
        }

        .modal-content button {
            padding: 10px 20px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
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
            <a href="#">Home</a>
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

    <!-- Main Content (Cleared) -->
    <div class="container">
        <!-- <h1>VB BANK</h1> -->
        <!-- <h2>Sign in with email</h2> -->
        <button class="login-icon"><i class="fa-solid fa-building-columns icon1"></i> </button>
        
        <h2>Reset Password  Page</h2>
        
           <% String failMessage = (String) request.getAttribute("fail"); %>
        
        <p>To Rest the password.Please fill the credentials!!. </p>
        
        <form action="forget" method="post">
            <div class="inputbox">
                <input type="tel" name="phone" placeholder="Enter Phone" inputmode="numeric" pattern="[0-9]*" maxlength="10" required>
                <!-- <span class="material-symbols-rounded">lock</span> -->
                <i class="fa-solid fa-phone icon2"></i>
            </div>
            <div class="inputbox">
                <input type="email" name="email" placeholder="Enter Email" required>
                <!-- <span class="material-symbols-rounded">lock</span> -->
                <i class="fa-solid fa-envelope icon2"></i>
            </div>
            <div class="inputbox">
                <input type="password" name="password" placeholder="Set New Password" inputmode="numeric" pattern="[0-9]*" maxlength="8" required>
                <!-- <span class="material-symbols-rounded">mail</span> -->
                <i class="fa-solid fa-lock icon2"></i>
            </div>
            <div class="inputbox">
                <input type="password" name="confirmpassword" placeholder="Confirm Password" inputmode="numeric" pattern="[0-9]*" maxlength="8" required>
                <!-- <span class="material-symbols-rounded">mail</span> -->
                <i class="fa-solid fa-lock icon2"></i>
            </div>
            
            
            <button class="started" type="submit">Reset Password</button>

            <p>Back to <a href="login.jsp"  class="next"> login </a>Page</p>
        </form>
    </div>
    
    
       <!-- Modal for success messages -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <% if (failMessage != null) { %>
                <h3><%= failMessage %></h3>
            <% } %>
            <button onclick="closeModal()">OK</button>
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

        <% if (failMessage != null) { %>
            window.onload = showModal;
        <% } %>
    </script>
    
</body>
</html>