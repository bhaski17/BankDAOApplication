package com.Bank.Servlets;

import java.io.IOException;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpL;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpL;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import com.Bank.DTO.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deposit")
public class Deposit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao=new CustomerDAOImpL();
		 TransactionDAO tdao=new TransactionDAOImpL();
		 
		 HttpSession session=req.getSession(false);
		 
		 Customer c=(Customer)session.getAttribute("Customer");
		 if(c!=null) {
			double amount= (Double.parseDouble(req.getParameter("amount")));
			if(amount>0) {

				 int pass=Integer.parseInt(req.getParameter("password"));
				 if(c.getPin()==pass) {
					 c.setBal(c.getBal()+amount);
					 if(cdao.updateCustomer(c)) {
						 Transaction t=new Transaction();
						 t.setTran_id(TransactionID.generateTransactionId());
						 t.setUser_acc(c.getAcc_no());
						 t.setRec_acc(c.getAcc_no());
						 t.setTran_type("CREDITED");
						 t.setAmount(amount);
						 t.setBalance(c.getBal());
						 
						 if(tdao.insertTransaction(t)) {
							 session.setAttribute("success", "amount "+amount+" deposit successfully!!");
								resp.sendRedirect("user.jsp");
						 }
						 else {
							 req.setAttribute("fail", " Failed to deposit!!");
								RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
								rd.forward(req, resp);
						 }
					 }
					 else {
						 req.setAttribute("fail", " Failed to deposit!!");
							RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
							rd.forward(req, resp);
					 }
					 
				 } else {
					 req.setAttribute("fail", " password unmatched!!");
						RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
						rd.forward(req, resp);
				 }
			}else {
				req.setAttribute("fail", "Enter amount cannot be zero and less than zero!!");
				RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
				rd.forward(req, resp);
			}
		 }
		 else {
			 req.setAttribute("fail", " Session Expired!!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
		 }
	}

}
