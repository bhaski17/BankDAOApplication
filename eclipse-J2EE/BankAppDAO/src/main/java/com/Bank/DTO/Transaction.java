package com.Bank.DTO;

public class Transaction {
	private long tran_id;
	private long user_acc;
	private long rec_acc;
	private String date;
	private String tran_type;
	private double amount;
	private double balance;
	public long getTran_id() {
		return tran_id;
	}
	public void setTran_id(long tran_id) {
		this.tran_id = tran_id;
	}
	public long getUser_acc() {
		return user_acc;
	}
	public void setUser_acc(long user_acc) {
		this.user_acc = user_acc;
	}
	public long getRec_acc() {
		return rec_acc;
	}
	public void setRec_acc(long rec_acc) {
		this.rec_acc = rec_acc;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTran_type() {
		return tran_type;
	}
	public void setTran_type(String tran_type) {
		this.tran_type = tran_type;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "Transaction [tran_id=" + tran_id + ", user_acc=" + user_acc + ", rec_acc=" + rec_acc + ", date=" + date
				+ ", tran_type=" + tran_type + ", amount=" + amount + ", balance=" + balance + "]";
	}

}
