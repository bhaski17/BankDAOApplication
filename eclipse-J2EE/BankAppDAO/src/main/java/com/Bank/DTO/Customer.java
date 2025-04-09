package com.Bank.DTO;

public class Customer {
	private long Acc_no;
	private String name;
	private long phone;
	private String mail;
	private double bal;
	private int pin;
	
	public long getAcc_no() {
		return Acc_no;
	}
	public void setAcc_no(long acc_no) {
		Acc_no = acc_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public double getBal() {
		return bal;
	}
	public void setBal(double bal) {
		this.bal = bal;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	@Override
	public String toString() {
		return "Customer [Acc_no=" + Acc_no + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", bal=" + bal
				+ "]";
	}
	

}
