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
@WebServlet("/updateName")
public class UpdateName extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CustomerDAO cdao=new CustomerDAOImpL();
		HttpSession session=req.getSession(false);
		 Customer user=(Customer)session.getAttribute("Customer");
		 if(user!=null) {
			 user.setName(req.getParameter("name"));
			 boolean res=cdao.updateCustomer(user);
			 if(res) {
				 req.setAttribute("success", "Name update successfully!!");
					RequestDispatcher rd=req.getRequestDispatcher("user.jsp");
					rd.forward(req, resp);
			 }
			 else {
				 req.setAttribute("fail", " Name update is failed!!");
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
