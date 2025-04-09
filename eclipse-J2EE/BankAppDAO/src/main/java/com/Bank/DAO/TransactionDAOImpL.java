package com.Bank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Bank.Connection.Connector;
import com.Bank.DTO.Transaction;

public class TransactionDAOImpL implements TransactionDAO {
	
	
	//building the connection
	private Connection con;
	public TransactionDAOImpL () {
		this.con=Connector.requestConnection();
	}
	

	@Override
	public boolean insertTransaction(Transaction t) {
		// TODO Auto-generated method stub
		//transfer Amount class
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO PASSBOOK(TRAN_ID,USER_ACC,REC_ACC,TRAN_DATE,TRAN_TYPE,AMOUNT,BALANCE) VALUES(?,?,?,SYSDATE(),?,?,?)";
		
		try {
		//	con =Connector.requestConnection();
			ps=con.prepareStatement(query);
			
			ps.setLong(1, t.getTran_id());
			ps.setLong(2, t.getUser_acc());
			ps.setLong(3, t.getRec_acc());
			ps.setString(4, t.getTran_type());
			ps.setDouble(5,t.getAmount());
			ps.setDouble(6, t.getBalance());
			
			res=ps.executeUpdate();
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(res>0) {
	
			return true;
		}
		else {

			return false;
		}
	}

	@Override
	public ArrayList<Transaction> getTransaction(long user) {
		// TODO Auto-generated method stub
		//passbook print
		PreparedStatement ps=null;
		ResultSet rs=null;
		Transaction t=null;
		ArrayList<Transaction> passbook=new ArrayList<Transaction>();
		String query="SELECT * FROM PASSBOOK WHERE USER_ACC=? ORDER BY TRAN_DATE DESC" ;
		
		try {
			ps=con.prepareStatement(query);
			
			ps.setLong(1, user);
			rs=ps.executeQuery();
			while(rs.next()){
				
				t=new Transaction();
				t.setTran_id(rs.getLong(1));
				t.setUser_acc(rs.getLong(2));
				t.setRec_acc(rs.getLong(3));
				t.setDate(rs.getString(4));
				t.setTran_type(rs.getString(5));
				t.setAmount(rs.getDouble(6));
				t.setBalance(rs.getDouble(7));
				passbook.add(t);
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return passbook;
	}

	@Override
	public ArrayList<Transaction> getTransaction() {
		// view all Transaction
		PreparedStatement ps=null;
		ResultSet rs=null;
		Transaction t=null;
		ArrayList<Transaction> tranbook=new ArrayList<Transaction>();
		String query="SELECT * FROM PASSBOOK ORDER BY TRAN_DATE DESC";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
	while(rs.next()){
				
				t=new Transaction();
				t.setTran_id(rs.getLong(1));
				t.setUser_acc(rs.getLong(2));
				t.setRec_acc(rs.getLong(3));
				t.setDate(rs.getString(4));
				t.setTran_type(rs.getString(5));
				t.setAmount(rs.getDouble(6));
				t.setBalance(rs.getDouble(7));
				tranbook.add(t);
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tranbook;
	}
	//TOTOAL TRAN AMOUNT
	public double totalTransAmount() {
		double amount=0.0;
		String query="SELECT SUM(AMOUNT) FROM PASSBOOK";
		
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				amount=rs.getDouble(1);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return amount;
	}
	

}
