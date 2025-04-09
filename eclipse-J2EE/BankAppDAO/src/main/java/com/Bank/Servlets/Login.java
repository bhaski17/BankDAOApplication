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
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 CustomerDAO cdao= new  CustomerDAOImpL();
		 
		 HttpSession session=req.getSession(true);
		
		 long account=Long.parseLong(req.getParameter("account"));
		 int pass=Integer.parseInt(req.getParameter("password"));
		 
		 Customer c=cdao.getCustomer(account, pass);
		 
		 if(c!=null) {
			 session.setAttribute("Customer", c);
			 if(c.getAcc_no()==1100110012) {
				 req.setAttribute("success","Login successfullyy!!");
				 resp.sendRedirect("admin.jsp? success=Login Successfully!!");
//				 RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
//				 rd.forward(req, resp);
				 
				 
			 }else {
				 req.setAttribute("success","Login successfullyy!!");
				 resp.sendRedirect("user.jsp");
				RequestDispatcher rd=req.getRequestDispatcher("user.jsp");
					rd.forward(req, resp);
				 
			 }
				
		 }
		 else {
			 req.setAttribute("fail"," failed to login!!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
		 }
	
	}

}
