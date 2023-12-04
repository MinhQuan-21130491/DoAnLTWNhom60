package service;

import dao.DAOAccount;
import model.Account;
import model.VerifyAccount;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class AccountService {
    static AccountService instance;

    private AccountService() {
    }

    public static AccountService getInstance() {
        if (instance == null)
            instance = new AccountService();
        return instance;
    }

    public boolean checkExistUserName(String userName) {
        return DAOAccount.checkExistUserName(userName);
    }
    
    public boolean checkExistEmail(String email) {
        return DAOAccount.checkExistEmail(email);
    }

    public int registerAccount(Account a) {
        return DAOAccount.registerAccount(a);
    }

    public int insertVerify(VerifyAccount v) {
        return DAOAccount.insertVerify(v);
    }

    public int updateStateVerify(VerifyAccount v) {
        return DAOAccount.updateStateVerify(v);
    }

    public Account selectAccountByUserName(String userName) {
        return DAOAccount.selectAccountByUserName(userName);
    }
    public Account selectAccountByEmail(String email) {
        return DAOAccount.selectAccountByEmail(email);
    }
    public  VerifyAccount selectVerifyAccountByIdAccount(int idAccount) {
       return DAOAccount.selectVerifyAccountByIdAccount(idAccount);
    }
    public  int updateVerifyCode(int newCode, int idAccount) {
        return DAOAccount.updateVerifyCode(newCode,idAccount);
    }
    public  int updateInfor(Account account){ return DAOAccount.updateInfor(account);}
    public  Account selectById(Account account){
        return DAOAccount.selectById(account);
    }
    public Account getAccount(String userName, String password) {
        return DAOAccount.getAccount(userName, password);
    }
    public VerifyAccount getVrfOfAccount(int idAccount) {
        return  DAOAccount.getVrfOfAccount(idAccount);
    }

    }