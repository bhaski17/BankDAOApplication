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
import jakarta.servlet.http.HttpSession;
@WebServlet("/updateAccount")
public class UpdateAccount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao=new CustomerDAOImpL();
		HttpSession session=req.getSession(false);
		 Customer user=(Customer)session.getAttribute("Customer");
		 if(user!=null) {
			 user.setName(req.getParameter("name"));
			 user.setPhone(Long.parseLong(req.getParameter("phone")));
			 user.setMail(req.getParameter("email")); 
			 int currentpass=Integer.parseInt(req.getParameter("currentpassword"));
			 int pass=Integer.parseInt(req.getParameter("password"));
			 int confirmpass=Integer.parseInt(req.getParameter("confirmpassword"));
			 
			 if(user.getPin()==currentpass) {
				 user.setPin(confirmpass);
			 }
			 
			 boolean res=cdao.updateCustomer(user);
			 
			 if(res) {
				 req.setAttribute("success", "update successfully!!");
					RequestDispatcher rd=req.getRequestDispatcher("user.jsp");
					rd.forward(req, resp);
			 }
			 else {
				 req.setAttribute("fail", " update is failed!!");
					RequestDispatcher rd=req.getRequestDispatcher("updateAccount.jsp");
					rd.forward(req, resp);
			 }
			 
		 }else {
			 req.setAttribute("fail", " Session Expired!!");
				RequestDispatcher rd=req.getRequestDispatcher("updateAccount.jsp");
				rd.forward(req, resp);
		 }
		 
	 
			
		}
		 
	}


