<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DAO.TransactionDAOImpL"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@page import="com.Bank.DAO.TransactionDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bank User_page</title>
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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

        main {
            flex: 1;
            padding-top: 100px; /* To account for the fixed header */
            display: flex;
            flex-direction: column;
            padding: 100px 12.5% 0;
        }

        .card-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .welcome-card, .balance-card, .transactions-card {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-card, .balance-card {
            width: 48%; /* Adjusted to fit side by side with a small gap */
            height: 100px;
        }

        .transactions-card {
            width: 100%;
        }

        .welcome-card h2, .balance-card h2, .transactions-card h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }

        .welcome-card p, .balance-card p {
            font-size: 18px;
            color: #ff6600;
        }

        .welcome-card p {
            font-weight: bolder;
            font-size: 25px;
        }

        .balance-card p {
            color: green;
        }

        /* Table Styles */
        .transactions-card table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .transactions-card th,
        .transactions-card td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .transactions-card th {
            background-color: #ff6600;
            color: white;
        }

        .transactions-card tr:hover {
            background-color: #f5f5f5;
        }

        .transactions-card tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Pagination Styles */
        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination-button {
            padding: 10px 20px;
            background-color: #ff6600;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 5px;
            transition: background-color 0.3s ease;
        }

        .pagination-button:hover {
            background-color: #cc5500;
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
        #credited{
        	color:green;
        }
        #debited{
        	color:red;
        }
    </style>
</head>
<body>

<% Customer user = (Customer) session.getAttribute("Customer"); %>
<% if (user != null) { %>
    <header>
        <% if (user.getAcc_no() == 1100110012) { %>
            <!-- Menu Icon -->
            <div class="menu-icon" onclick="toggleSidePanel()">
                <i class="fa-solid fa-bars"></i>
            </div>
        <% } %>
        <div class="logo">
            <a href="admin.jsp"><i class="fa-solid fa-building-columns icon1"></i></a>My Bank
        </div>
        <form >
            <nav class="navigation">
                <a href="admin.jsp">Home</a>
                <div class="dropdown">
                    <a href="#">Services</a>
                    <div class="dropdown-content">
                        <a href="deposit.jsp">Deposit</a>
                        <a href="transferAmount.jsp">Transfer Amount</a>
                        <a href="updateAccount.jsp">Update Profile</a>
                    </div>
                </div>
                <a href="#">Contact Us</a>
                <a href="#">About</a>
            </nav>
        </form>

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
            <li><a href="admin.jsp">Admin View</a></li>
            <li><a href="viewAllCustomers.jsp">View Customers</a></li>
            <li><a href="#">View All Transactions</a></li>
            <li><a href="deleteCustomer.jsp">Delete Customer</a></li>
            <li><a href="#">Loans</a></li>
            <li><a href="#">Insurance</a></li>
        </ul>
    </div>
    <!-- Overlay -->
    <div class="overlay" id="overlay" onclick="toggleSidePanel()"></div>

    <main>
        <!-- Transactions Card -->
        <div class="transactions-card">
            <h2 style="text-align: center;">Transactions</h2>
            <table>
                <thead>
                    <tr>
                        <th>Tran_id</th>
                        <th>User Account</th>
                        <th>Receiver Account</th>
                        <th>Transaction Date</th>
                        <th>Transaction Type</th>
                        <th>Amount</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    TransactionDAO tdao = new TransactionDAOImpL();
                     ArrayList<Transaction> passbooks=tdao.getTransaction();

                    // Pagination Logic
                    int pageNumber = 1; // Default page number
                    String pageParam = request.getParameter("page");
                    if (pageParam != null && !pageParam.isEmpty()) {
                        pageNumber = Integer.parseInt(pageParam);
                    }

                    int rowsPerPage = 10; // Number of rows per page
                    int start = (pageNumber - 1) * rowsPerPage;
                    int end = Math.min(start + rowsPerPage, passbooks.size());

                    for (int i = start; i < end; i++) {
                        Transaction t = passbooks.get(i);
                    %>
                        <tr>
                            <td><%= t.getTran_id() %></td>
                            <td><%= t.getUser_acc() %></td>
                            <td><%= t.getRec_acc() %></td>
                            <td><%= t.getDate() %></td>
                            <td><%= t.getTran_type() %></td>
                            <% if (t.getTran_type().equals("CREDITED")) { %>
                                <td id="credited"><i class="fa-solid fa-indian-rupee-sign"></i>+<%= t.getAmount() %></td>
                            <% } else { %>
                                <td id="debited"><i class="fa-solid fa-indian-rupee-sign"></i>-<%= t.getAmount() %></td>
                            <% } %>
                            <td><i class="fa-solid fa-indian-rupee-sign"></i><%= t.getBalance() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Pagination Buttons -->
            <div class="pagination">
                <% 
                int totalPages = (int) Math.ceil((double) passbooks.size() / rowsPerPage);
                if (pageNumber > 1) { 
                %>
                    <a href="?page=<%= pageNumber - 1 %>" class="pagination-button">Previous</a>
                <% } %>
                <% if (pageNumber < totalPages) { %>
                    <a href="?page=<%= pageNumber + 1 %>" class="pagination-button">Next</a>
                <% } %>
            </div>
        </div>
    </main>

    <!-- Your existing modal and footer content -->
      <% String successMessage = (String) request.getAttribute("success"); %>
    <%String successMess = (String) session.getAttribute("success"); %>
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
            <% if (successMess != null) { %>
                <h3 class="success"><%= successMess%></h3>
                <button class="su" onclick="closeModal()">OK</button>
                <%session.removeAttribute("success") ;%>
            <% } %>
        </div>
    </div>

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
        <% if (successMessage != null || failMessage != null || successMess != null)  { %>
            window.onload = showModal;
        <% } %>
    </script>

<% } else { %>
    <% request.setAttribute("fail", "Session Expired!.."); %>
    <% RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); %>
    <% rd.forward(request, response); %>
<% } %>
</body>
</html>