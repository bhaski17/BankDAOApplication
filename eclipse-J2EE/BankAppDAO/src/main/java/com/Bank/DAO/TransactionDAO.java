package com.Bank.DAO;

import java.util.ArrayList;

import com.Bank.DTO.Transaction;

public interface TransactionDAO {
	public boolean insertTransaction(Transaction t);
	public ArrayList<Transaction> getTransaction(long user);
	public ArrayList<Transaction> getTransaction();
	public double totalTransAmount();
}
