package com.Bank.Servlets;

import java.io.IOException;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpL;
import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/createAccount")
public class CreateAccount extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer c= new Customer();
		 CustomerDAO cdao= new  CustomerDAOImpL();
		 c.setName(req.getParameter("name"));
		 c.setPhone(Long.parseLong(req.getParameter("phone")));
		 c.setMail(req.getParameter("email"));
		 
		 int pass=Integer.parseInt(req.getParameter("password"));
		 int confirmpass=Integer.parseInt(req.getParameter("confirmpassword"));
		
		 if(pass==confirmpass) {
			 c.setPin(confirmpass);
			 
			 if(cdao.insertCustomer(c)) {
				 c=cdao.getCustomer(c.getPhone(),c.getMail());
				 req.setAttribute("success", "Account created successfully!! and your Account no is :" +c.getAcc_no() +" ");
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
			 }
			 else {
				 req.setAttribute("fail", " Failed to create Account!!");
					RequestDispatcher rd=req.getRequestDispatcher("createAccount.jsp");
					rd.forward(req, resp);
			 }
		 }
		 else {
			 req.setAttribute("fail", "Password does not matched!!");
				RequestDispatcher rd=req.getRequestDispatcher("createAccount.jsp");
				rd.forward(req, resp);
		 }
	}

}
