<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bank</title>
    <!-- Google Fonts and Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=search" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
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
            padding-top: 80px; /* Added padding to prevent content from being hidden behind the fixed header */
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
            /* background-color:#004a99; */
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
            background: #4CAF50; /* Light green color */
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: 500;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .loginBtn:hover {
            background: #45a049; /* Darker shade of green on hover */
        }

        .hero {
            margin-top: 100px;
            padding: 100px 12.5%;
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            margin: 150px 12.5% 50px;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #333;
        }

        .hero p {
            font-size: 18px;
            margin-bottom: 40px;
            color: #555;
        }

        .hero button {
            background: #ff6600;
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .hero button:hover {
            background: #e65c00;
        }

        .services, .features {
            padding: 50px 12.5%;
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            margin: 20px 12.5%;
            border-radius: 10px;
        }

        .services h2, .features h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #333;
        }

        .service-cards, .feature-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .service-card, .feature-card {
            width: 30%;
            margin: 10px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .service-card:hover, .feature-card:hover {
            transform: translateY(-10px);
        }

        .service-card h3, .feature-card h3 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .service-card p, .feature-card p {
            font-size: 16px;
            color: #555;
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
    <header>
        <div class="logo">
             <a href="home.jsp"><i class="fa-solid fa-building-columns icon1"></i></a>My Bank
        </div>
        <nav class="navigation">
            <a href="#">Home</a>
            <a href="#">Services</a>
            <a href="#">Contact Us</a>
            <a href="#">About</a>
        </nav>
        <form action="#" class="search">
            <input type="text" placeholder="Search...">
            <button type="submit" class="srchbtn"><span class="material-symbols-rounded icon1">search</span></button>
        </form>
        
            <button type="submit" class="loginBtn" onclick="window.location.href='login.jsp'">Login</button>
        
        
    </header>
    
          <% String successMessage = (String) request.getAttribute("success"); %>
    <% String failMessage = (String) request.getAttribute("fail"); %>

    <!-- Modal for success/fail messages -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <% if (successMessage != null) { %>
                <h3 class="success"><%= successMessage %></h3>
                <button class="su" onclick="closeModal()">OK</button>
                 <%request.removeAttribute("success"); %>
            <% } %>
            <% if (failMessage != null) { %>
                <h3 class="fail"><%= failMessage %></h3>
                <button class="fa" onclick="closeModal()">OK</button>
                <%request.removeAttribute("fail"); %>
            <% } %>
           
        </div>
    </div>

    <div class="hero">
        <h1>Welcome to My Bank</h1>
        <p>Your trusted partner in financial services. Explore our wide range of banking solutions tailored to meet your needs.</p>
       
        <button type="submit"  onclick="window.location.href='createAccount.jsp'">Open an Account</button>
        
         
        
        
    </div>

    <section class="services">
        <h2>Our Services</h2>
        <div class="service-cards">
            <div class="service-card">
                <h3>Open an Account</h3>
                <p>Start your journey with us by opening a new account.</p>
            </div>
            <div class="service-card">
                <h3>Apply for a Loan</h3>
                <p>Get a loan with competitive interest rates.</p>
            </div>
            <div class="service-card">
                <h3>Credit Cards</h3>
                <p>Explore our range of credit cards.</p>
            </div>
        </div>
    </section>

    <section class="features">
        <h2>Why Choose Us?</h2>
        <div class="feature-cards">
            <div class="feature-card">
                <h3>24/7 Customer Support</h3>
                <p>We are always here to help you.</p>
            </div>
            <div class="feature-card">
                <h3>Mobile Banking</h3>
                <p>Bank on the go with our mobile app.</p>
            </div>
            <div class="feature-card">
                <h3>Secure Transactions</h3>
                <p>Your security is our top priority.</p>
            </div>
        </div>
    </section>
    

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
    <% if (successMessage != null || failMessage != null )  { %>
        window.onload = showModal;
    <% } %>
	
	</script>
    <footer>
        <p>Contact Us: info@vbbank.com | Follow us on <a href="#">Social Media</a></p>
        <p>&copy; 2023 VB Bank. All rights reserved.</p>
    </footer>
</body>
</html>






    