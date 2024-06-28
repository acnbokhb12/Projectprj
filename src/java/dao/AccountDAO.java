/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.myLib;

/**
 *
 * @author DELL
 */
public class AccountDAO {

    public Account getAccount(String email, String password) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select[AccId],[Email],[Password],[UserName],[Phone],[Role],[AStatusId] from [dbo].[Account] where [Email] = ? and [Password] =?";

                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accid = rs.getInt("AccId");
                    String em = rs.getString("Email");
                    String pw = rs.getString("Password");
                    String userName = rs.getString("UserName");
                    String phoneNumber = rs.getString("Phone");
                    String role = rs.getString("Role");
                    int aStatus = rs.getInt("AStatusId");

                    acc = new Account(accid, em, pw, userName, phoneNumber, role, aStatus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return acc;
    }

    public Account checkAccountExist(String email) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select[AccId],[Email],[Password],[UserName],[Phone],[Role],[AStatusId] from [dbo].[Account] where [Email] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accid = rs.getInt("AccId");
                    String em = rs.getString("Email");
                    String pw = rs.getString("Password");
                    String userName = rs.getString("UserName");
                    String phoneNumber = rs.getString("Phone");
                    String role = rs.getString("Role");
                    int aStatus = rs.getInt("AStatusId");

                    acc = new Account(accid, em, pw, userName, phoneNumber, role, aStatus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return acc;
    }

    public void signUpAccount(String email, String password, String username) {
        Connection cn = null;
        String role = "Customer";
        int AStatusId = 1;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "insert into [dbo].[Account] ([Email],[Password],[UserName],[Role],[AStatusId]) values (?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                pst.setString(3, username);
                pst.setString(4, role);
                pst.setInt(5, AStatusId);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void main(String[] args) {
        
    }

}
