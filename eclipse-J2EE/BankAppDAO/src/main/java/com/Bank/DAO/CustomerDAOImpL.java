package com.Bank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Bank.Connection.Connector;
import com.Bank.DTO.Customer;


public class CustomerDAOImpL implements CustomerDAO{
	
	private Connection con;
	public CustomerDAOImpL() {
		this.con=Connector.requestConnection();
	}

	@Override
	public boolean insertCustomer(Customer c) {
		// SignUp page
		PreparedStatement ps=null;
		String query="INSERT INTO CUSTOMER(NAME,PHONE,MAIL,PIN) VALUES(?,?,?,?)";
		//"
		 int i=0;
		 
		 try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setInt(4, c.getPin());
			
			i=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			if(i>0) {
				try {
					con.commit();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return true;
			}
			else {
				try {
					con.rollback();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
	}

	@Override
	public Customer getCustomer(long accno, int pin) {
		// Login page
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO=? AND PIN=?";
		
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setLong(1,accno);
			ps.setInt(2, pin);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new Customer();

				c.setAcc_no(rs.getLong("Acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("mail"));
				c.setBal(rs.getLong("balance"));
				c.setPin(rs.getInt("pin"));
	
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c;
	}

	@Override
	//reset the pin 
	public Customer getCustomer(long phone, String mail) {
		
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE PHONE=? AND MAIL=?";
		
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setLong(1,phone);
			ps.setString(2, mail);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new Customer();

				c.setAcc_no(rs.getLong("Acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("mail"));
				c.setBal(rs.getLong("balance"));
				c.setPin(rs.getInt("pin"));
	
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c;
	}

	@Override
	public Customer getCustomer(long accno) {
		//Transerfer amount
		
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO=?";
		
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setLong(1,accno);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new Customer();

				c.setAcc_no(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBal(rs.getLong(5));
				c.setPin(rs.getInt(6));
	
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c;
	}

	@Override
	public ArrayList<Customer> getCustomer() {
		// TODO Auto-generated method stub
		// to get the details of the user
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO!=1100110012 ";
		ArrayList<Customer> arr=new ArrayList<Customer>();
		
		Customer c=null;
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c= new Customer();
				
				c.setAcc_no(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBal(rs.getDouble(5));
				c.setPin(rs.getInt(6));
				
				arr.add(c);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return arr;
	}

	@Override
	public boolean updateCustomer(Customer c) {
		// update the details 
		//and for the depsite and transfer the amount
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,BALANCE=?,PIN=? WHERE ACC_NO=? ";
		try {
			
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setDouble(4, c.getBal());
			ps.setInt(5, c.getPin());
			ps.setLong(6, c.getAcc_no());
			
			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public boolean deleteCustomer(Customer c) {
		// TODO Auto-generated method stub
		// delete the recored
		PreparedStatement ps;
		int res=0;
		String query="DELETE FROM CUSTOMER WHERE ACC_NO=?";
		 try {
			 con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			
			ps.setLong(1, c.getAcc_no());
			
			 res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(res>0) {
				try {
					con.commit();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				return true;
			}else {
				try {
					con.rollback();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
	}
	
	//total amount
	public double totalAmount() {
		//Transerfer amount
		
		double amount=0.0;
		String query="SELECT SUM(BALANCE) FROM CUSTOMER" ;
		
		
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
