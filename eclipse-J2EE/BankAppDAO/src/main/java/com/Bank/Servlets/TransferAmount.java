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
@WebServlet("/transferAmount")
public class TransferAmount extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerDAO cdao=new CustomerDAOImpL();
		 TransactionDAO tdao=new TransactionDAOImpL();
		 Transaction t1=null; //sender transaction details 
		 Transaction t2=null;
		 HttpSession session=req.getSession(false);
		 Customer sender=(Customer)session.getAttribute("Customer");
		 if(sender!=null) {
			 double amount= (Double.parseDouble(req.getParameter("amount")));
			 long receiver_accno=Long.parseLong(req.getParameter("account"));
			 int pass=Integer.parseInt(req.getParameter("password"));
			 
				 Customer receiver=cdao.getCustomer(receiver_accno);
				 if(receiver!=null) {
					 if(sender.getAcc_no()!=receiver.getAcc_no()) {
						 if( sender.getBal()>0) {
							 if(sender.getBal()>=amount) {
								 if(amount>0) {

									 
					 
									 if(sender.getPin()==pass) {
										 
										 //
										 sender.setBal(sender.getBal()-amount);
										 boolean sender_res=cdao.updateCustomer(sender);
										 
										 if(sender_res) {
											 t1=new Transaction();t1.setTran_id(TransactionID.generateTransactionId());
											 t1.setUser_acc(sender.getAcc_no());
											 t1.setRec_acc(receiver.getAcc_no());
											 t1.setTran_type("DEBITED");
											 t1.setAmount(amount);
											 t1.setBalance(sender.getBal());
											 boolean res1=tdao.insertTransaction(t1);
										 }
										 
										 //
										 receiver.setBal(receiver.getBal()+amount);
										 boolean receiver_res=cdao.updateCustomer(receiver);
										 
										 if(receiver_res) {
											 {
												t2=new Transaction();
												t2.setTran_id(t1.getTran_id());
												t2.setUser_acc(receiver.getAcc_no());
												t2.setRec_acc(sender.getAcc_no());
												t2.setTran_type("CREDITED");
												t2.setAmount(amount);
												t2.setBalance(receiver.getBal());
												boolean res1=tdao.insertTransaction(t2);
												 }
											 }
										 
										 if(sender_res&&receiver_res) {
											 session.setAttribute("success", "amount "+amount+" transfer successfully!!");
												resp.sendRedirect("user.jsp");
												
										 }
										 else {
											 req.setAttribute("fail", " Failed to transfer!!");
											 resp.sendRedirect("transferAmount.jsp");
										 }
								 }else{
									 req.setAttribute("fail", " password unmatched!!");
										RequestDispatcher rd=req.getRequestDispatcher("transferAmount.jsp");
										rd.forward(req, resp);
								 }
							 
								 }else {
									 req.setAttribute("fail", " Amount should not be negative and should be grater than zero!!");
										RequestDispatcher rd=req.getRequestDispatcher("transferAmount.jsp");
										rd.forward(req, resp);
									 
								 }
								 
							 }else {
							 req.setAttribute("fail", " Insufficient Balance!!");
								RequestDispatcher rd=req.getRequestDispatcher("transferAmount.jsp");
								rd.forward(req, resp);
						 }
							 
					 }else {
						 req.setAttribute("fail", " Insufficient Balance!!");
							RequestDispatcher rd=req.getRequestDispatcher("transferAmount.jsp");
							rd.forward(req, resp);
					 }
						
				 }else {
					 req.setAttribute("fail", "Self Transfer is no allowed!!");
						RequestDispatcher rd=req.getRequestDispatcher("transferAmount.jsp");
						rd.forward(req, resp);
				 }
				 }else {
					 req.setAttribute("fail", "Customer not found!!");
					 RequestDispatcher rd=req.getRequestDispatcher("transferAmount.jsp");
						rd.forward(req, resp);
					 
				 }
		 }else {
			 req.setAttribute("fail", " Session Expired!!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
		 }
	}

}
