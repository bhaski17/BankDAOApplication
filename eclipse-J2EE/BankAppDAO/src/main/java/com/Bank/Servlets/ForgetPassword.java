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
@WebServlet("/forget")
public class ForgetPassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer c= new Customer();
		 CustomerDAO cdao= new  CustomerDAOImpL();
		 c=cdao.getCustomer(Long.parseLong(req.getParameter("phone")),req.getParameter("email"));
		 if(c!=null) {
			 int pass=Integer.parseInt(req.getParameter("password"));
			 int confirmpass=Integer.parseInt(req.getParameter("confirmpassword"));
			 
			 if(pass==confirmpass) {
				 c.setPin(confirmpass);
				 
				 if(cdao.updateCustomer(c)) {
					 req.setAttribute("success", " Password updated successfully!!");
						RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
						rd.forward(req, resp);
				 }
				 else {
					 req.setAttribute("fail", " Failed to  update the Password!!");
						RequestDispatcher rd=req.getRequestDispatcher("forgetPassword.jsp");
						rd.forward(req, resp);
				 }
				 
			 }
			 else {
				 req.setAttribute("fail", "Password does not matched!!");
					RequestDispatcher rd=req.getRequestDispatcher("forgetPassword.jsp");
					rd.forward(req, resp);
			 }
		 }
		 else {
			 req.setAttribute("fail", "Customer not found!!");
				RequestDispatcher rd=req.getRequestDispatcher("forgetPassword.jsp");
				rd.forward(req, resp);
		 }
		 
	}

}
