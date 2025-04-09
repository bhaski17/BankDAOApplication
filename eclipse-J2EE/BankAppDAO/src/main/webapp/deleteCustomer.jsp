<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.Bank.DTO.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bank User_page</title>
    <link rel="stylesheet" href="deleteCustomer.css">
    <!-- Google Fonts and Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Your CSS styles here */
         /* Your CSS styles here */
             * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-image: url("loginimage.png");
            background-size: cover;
            background-position: center;
            backdrop-filter: blur(10px);
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            position: relative;
        }

        header { 
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
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

        .logo .icon1 {
            margin-right: 10px;
            color: #ff6600;
        }

        .navigation {
            display: flex;
            align-items: center;
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

        .loginBtn {
            width: 100px;
            height: 40px;
            background: #ff0000; /* Red color */
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: 500;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .loginBtn:hover {
            background: #cc0000; /* Darker shade of red on hover */
        }

        .BackBtn{
            width: 100px;
            height: 40px;
            background:blue; /* Red color */
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: 500;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
            position: absolute;    
            margin-left: 10px;    

        }
        footer {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px 12.5%;
            text-align: center;
            border-top: 1px solid #ddd;
            margin-top: auto;
        }

        footer p {
            font-size: 14px;
            color: #555;
        }

        footer a {
            color: #ff6600;
            text-decoration: none;
        }

        /* Dropdown Styles */
        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: auto 100%; /* Position below the "Services" link */
            left: 0;
            background-color: rgba(255, 255, 255, 0.9);
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 6px;
            padding-right: 10px;
            width: auto;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            padding-right: 10px;
            text-decoration: none;
            display: block;
            font-size: 1em;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
            border-radius: 6px;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Side Panel Styles */
        .menu-icon {
            font-size: 24px;
            cursor: pointer;
            margin-right: 20px;
        }

        .side-panel {
            position: fixed;
            top: 0;
            left: -300px; /* Hidden by default */
            width: 300px;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            transition: left 0.3s ease;
            z-index: 1000;
        }

        .side-panel.open {
            left: 0; /* Show the side panel */
        }

        .side-panel ul {
            list-style: none;
            padding: 20px;
        }

        .side-panel ul li {
            margin-bottom: 15px;
        }

        .side-panel ul li a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .side-panel ul li a:hover {
            background-color: #ce5e13;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .overlay.active {
            display: block;
        }




        .container{
            margin-top: 500px;
            width: 350px;
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
            font-size: 2.3em;
            height: 40px;
            width: 30px;
             
      
         }
        .container .login-icon{
            background-color: rgb(240, 236, 236);
            width: 50px;
            border: none;
           box-shadow: 0px 5px 10px black; 
           border-radius: 10px;
           margin-bottom: 10px;
           padding:5px 
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
       
        .started:active{
            background-color: transparent;
            color: black;
            border: 2px solid black;
        }

        .inputbox{
            position: relative;
            margin-top: 10px;
            margin-left: 10px;

            

        }
        .inputbox .icon2{
            position: absolute;
            top: 50%;
            left: 0.9rem;
            pointer-events: none;
            transform: translateY(-50%);

        }

  
    </style>
</head>
<body>
    <header>
    <% Customer user = (Customer) session.getAttribute("Customer"); %>
    <% if (user != null) { %>
        <!-- Menu Icon -->
        <div class="menu-icon" onclick="toggleSidePanel()">
            <i class="fa-solid fa-bars"></i>
        </div>
        <div class="logo">
            <a href="admin.jsp"><i class="fa-solid fa-building-columns icon1"></i></a>My Bank
        </div>
        <nav class="navigation">
            <a href="admin.jsp">Home</a>
            <div class="dropdown">
                <a href="#">Services</a>
                <div class="dropdown-content">
                    <a href="deposit.html">Deposit</a>
                    <a href="tranferAmount.html">Transfer Amount</a>
                    <a href="update1.html">Update Profile</a>
                </div>
            </div>
            <a href="#">Contact Us</a>
            <a href="#">About</a>
        </nav>
        <form action="#" class="search">
            <input type="text" placeholder="Search...">
            <button type="submit" class="srchbtn"><span class="material-symbols-rounded icon1">search</span></button>
        </form>
        
        <form action="logout" method="post">
        <button type="submit" class="loginBtn">Logout</button>
        </form>
    </header>

    <!-- Side Panel -->
    <div class="side-panel" id="sidePanel">
        <ul>
            <li><a href="user.jsp">My Account</a></li>
            <li><a href="viewAllCustomers.jsp">View Customers</a></li>
            <li><a href="allTransaction.jsp">View All Transactions</a></li>
            <li><a href="deleteCustomer.jsp">Delete Customer</a></li>
            <li><a href="#">Loans</a></li>
            <li><a href="#">Insurance</a></li>
        </ul>
    </div>

    <!-- Overlay -->
    <div class="overlay" id="overlay" onclick="toggleSidePanel()"></div>

    <form action="deleteCustomer" method="post" id="mainForm">
        <div class="container">
            <!-- First Page -->
            <div class="delPage1" id="first">
                <button class="login-icon" onclick="window.location.href='admin.jsp'"><i class="fa-solid fa-building-columns icon1"></i></button>
                <h2>Delete Page</h2>
                <p>Enter the Account Number you want to delete!!..</p>
                <div class="inputbox">
                    <input type="text" id="account" name="account" placeholder="Account Number" inputmode="numeric" pattern="[0-9]*" minlength="10" maxlength="20" required>
                    <i class="fa-solid fa-user-minus icon2"></i>
                </div>
                <button class="started" type="button" onclick="nextPage()">Next</button>
            </div>

            <!-- Second Page -->
            <div class="delPage2" id="second" style="display: none;">
                <button class="login-icon" onclick="window.location.href='admin.jsp'"><i class="fa-solid fa-building-columns icon1"></i></button>
                <br>
                <h2>Delete Page</h2>
                <p>Select whom you want to send balance!!..</p>
                <input type="hidden" id="hiddenAccount" name="account">
                <input type="hidden" id="hiddenActionAdmin" name="action" value="2">
                <button class="admin" type="submit" id="adminBtn">Admin</button>
                <button class="nomine" type="button" id="nomineeBtn" onclick="goToNomineePage()">Nominee</button>
                
            </div>

            <!-- Third Page -->
            <div class="delPage3" id="third" style="display: none;">
                <button class="login-icon" onclick="window.location.href='admin.jsp'"><i class="fa-solid fa-building-columns icon1"></i></button>
                <br>
                <h2>Delete Page</h2>
                <p>Enter the Nominee Account Number you want to send the amount!!..</p>
                <input type="hidden" id="hiddenAccount2" name="account">
                <input type="hidden" id="hiddenActionNominee" name="action" value="1">
                <div class="inputbox">
                    <input type="text" id="nomibeeaccount" name="nomibeeaccount" placeholder="Nominee Account Number" inputmode="numeric" pattern="[0-9]*" minlength="10" maxlength="20" required>
                    <i class="fa-solid fa-user icon2"></i>
                </div>
                <button class="final" type="submit">Transfer</button>
            </div>
        </div>
    </form>

    <footer>
        <p>Contact Us: info@vbbank.com | Follow us on <a href="#">Social Media</a></p>
        <p>&copy; 2023 VB Bank. All rights reserved.</p>
    </footer>

    <script>
        // Function to toggle the side panel
        function toggleSidePanel() {
            const sidePanel = document.getElementById('sidePanel');
            const overlay = document.getElementById('overlay');
            sidePanel.classList.toggle('open');
            overlay.classList.toggle('active');
        }

        function nextPage() {
            const accountNumber = document.getElementById('account').value;
            if (accountNumber) {
                // Set the hidden account number for both pages
                document.getElementById('hiddenAccount').value = accountNumber;
                document.getElementById('hiddenAccount2').value = accountNumber;
                // Navigate to the second page
                document.getElementById('first').style.display = 'none';
                document.getElementById('second').style.display = 'block';
            } else {
                alert("Please enter a valid account number.");
            }
        }

        function goToNomineePage() {
            // Navigate to the third page
            document.getElementById('second').style.display = 'none';
            document.getElementById('third').style.display = 'block';
        }
    </script>

    <% } else { %>
        <% request.setAttribute("fail", "Session Expired!.."); %>
        <% RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); %>
        <% rd.forward(request, response); %>
    <% } %>
</body>
</html>