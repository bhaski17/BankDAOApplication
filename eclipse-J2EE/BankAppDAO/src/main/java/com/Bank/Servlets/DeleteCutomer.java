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

@WebServlet("/deleteCustomer")
public class DeleteCutomer extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO cdao = new CustomerDAOImpL();
        TransactionDAO tdao = new TransactionDAOImpL();
        HttpSession session = req.getSession(false);
        Customer admin = (Customer) session.getAttribute("Customer");
        if (admin != null) {
            long accno = Long.parseLong(req.getParameter("account"));
            Customer cd = cdao.getCustomer(accno);
            if(cd!=null) {
            	Double deleBal = cd.getBal();
                int action=Integer.parseInt(req.getParameter("action"));
                
                System.out.println(action);
                 
                 switch (action) {
                     case 1:
                         long Nomineaccno = Long.parseLong(req.getParameter("nomibeeaccount"));
                         Customer nomine = cdao.getCustomer(Nomineaccno);

                         if (admin.getAcc_no() != nomine.getAcc_no() && cd.getAcc_no() != nomine.getAcc_no()) {
                             nomine.setBal(nomine.getBal() + deleBal);
                             boolean result1 = cdao.updateCustomer(nomine);

                             if (result1) {
                                 Transaction t1 = new Transaction();
                                 t1.setTran_id(TransactionID.generateTransactionId());
                                 t1.setUser_acc(cd.getAcc_no());
                                 t1.setRec_acc(nomine.getAcc_no());
                                 t1.setTran_type("CREDITED");
                                 t1.setAmount(cd.getBal());
                                 t1.setBalance(nomine.getBal());
                                 boolean tranres = tdao.insertTransaction(t1);
                                 if (tranres) {
                                     if (cdao.deleteCustomer(cd)) {
                                         req.setAttribute("success", "Customer deleted successfully!!");
                                         RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
                                         rd.forward(req, resp);
                                     } else {
                                         req.setAttribute("fail", "Failed to delete!!");
                                         RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                                         rd.forward(req, resp);
                                     }
                                 } else {
                                     req.setAttribute("fail", "Failed to delete!!");
                                     RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                                     rd.forward(req, resp);
                                 }
                             } else {
                                 req.setAttribute("fail", "Failed to delete!!");
                                 RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                                 rd.forward(req, resp);
                             }
                         } else {
                             req.setAttribute("fail", "Failed to delete!! Nominee not found");
                             RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                             rd.forward(req, resp);
                         }
                         break;

                     case 2:
                         if (admin.getAcc_no() != cd.getAcc_no()) {
                             admin.setBal(admin.getBal() + deleBal);
                             boolean result = cdao.updateCustomer(admin);

                             if (result) {
                                 Transaction t1 = new Transaction();
                                 t1.setTran_id(TransactionID.generateTransactionId());
                                 t1.setUser_acc(cd.getAcc_no());
                                 t1.setRec_acc(admin.getAcc_no());
                                 t1.setTran_type("CREDITED");
                                 t1.setAmount(cd.getBal());
                                 t1.setBalance(admin.getBal());
                                 boolean tranres = tdao.insertTransaction(t1);
                                 if (tranres) {
                                     if (cdao.deleteCustomer(cd)) {
                                         req.setAttribute("success", "Customer deleted successfully!!");
                                         RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
                                         rd.forward(req, resp);
                                     } else {
                                         req.setAttribute("fail", "Failed to delete!!");
                                         RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                                         rd.forward(req, resp);
                                     }
                                 } else {
                                     req.setAttribute("fail", "Failed to delete!!");
                                     RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                                     rd.forward(req, resp);
                                 }
                             } else {
                                 req.setAttribute("fail", "Failed to delete!!");
                                 RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                                 rd.forward(req, resp);
                             }
                         } else {
                             req.setAttribute("fail", "Failed to delete!!");
                             RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                             rd.forward(req, resp);
                         }
                         break;

                     default:
                         req.setAttribute("fail", "Failed to delete!!");
                         RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                         rd.forward(req, resp);
                 }

             }else {
            	 req.setAttribute("fail", "Account not found!!");
                 RequestDispatcher rd = req.getRequestDispatcher("deleteCustomer.jsp");
                 rd.forward(req, resp);
             }
            
            
            
            }else {
                req.setAttribute("fail", "Session Expired!!");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            }
            

       
    }
}