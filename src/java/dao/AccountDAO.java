/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import dto.AccountStatus;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return acc;
    }

    public Account getAccountByid(String id) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select[AccId],[Email],[Password],[UserName],[Phone],[Role],[AStatusId] from [dbo].[Account] where [AccId]  = ?  ";

                pst = cn.prepareStatement(sql);
                pst.setString(1, id);
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
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
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
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
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

    public void updatePhone(int idAcc, String phone) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Account]\n"
                        + "set [Phone] = ?\n"
                        + "where [AccId] = ?";

                pst = cn.prepareStatement(sql);
                pst.setString(1, phone);
                pst.setInt(2, idAcc);
                pst.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
//    admin 

    public ArrayList< Account> getAllAccount() {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList< Account> list = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [AccId],[Email], [Password],[UserName],[Phone],[Role],[AStatusId]from [dbo].[Account] \n"
                        + "where [Role] not like '%Admin%' and [AStatusId] not like 4 ";

                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {

                        int accid = rs.getInt("AccId");
                        String em = rs.getString("Email");
                        String pw = rs.getString("Password");
                        String userName = rs.getString("UserName");
                        String phoneNumber = rs.getString("Phone");
                        String role = rs.getString("Role");
                        int aStatus = rs.getInt("AStatusId");

                        acc = new Account(accid, em, pw, userName, phoneNumber, role, aStatus);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public ArrayList< Account> getAccByEmailPhone(String txtsearch) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList< Account> list = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT [AccId], [Email], [Password], [UserName], [Phone], [Role], [AStatusId]\n"
                        + "FROM [dbo].[Account]\n"
                        + "WHERE ([Email] LIKE ? OR [Phone] LIKE ? ) and [AStatusId] not like 4";

                pst = cn.prepareStatement(sql);

                String searchPattern = "%" + txtsearch + "%";
                pst.setString(1, searchPattern);
                pst.setString(2, searchPattern);

                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {

                        int accid = rs.getInt("AccId");
                        String em = rs.getString("Email");
                        String pw = rs.getString("Password");
                        String userName = rs.getString("UserName");
                        String phoneNumber = rs.getString("Phone");
                        String role = rs.getString("Role");
                        int aStatus = rs.getInt("AStatusId");

                        acc = new Account(accid, em, pw, userName, phoneNumber, role, aStatus);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public ArrayList<AccountStatus> getALlStatusAccount() {
        ArrayList<AccountStatus> listS = new ArrayList<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [AStatusId], [AStatus] from  [dbo].[AccStatus] where [AStatusId] not like 4";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {

                        int id = rs.getInt("AStatusId");
                        String nameStatus = rs.getString("AStatus");

                        AccountStatus acst = new AccountStatus(id, nameStatus);
                        listS.add(acst);

                    }

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return listS;
    }

    public ArrayList< Account> getAllAccountByStatus(String statusid) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList< Account> list = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [AccId],[Email], [Password],[UserName],[Phone],[Role],[AStatusId]from [dbo].[Account] \n"
                        + "where [Role] not like '%Admin%' and [AStatusId]=?  and [AStatusId] not like 4";

                pst = cn.prepareStatement(sql);
                pst.setString(1, statusid);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {

                        int accid = rs.getInt("AccId");
                        String em = rs.getString("Email");
                        String pw = rs.getString("Password");
                        String userName = rs.getString("UserName");
                        String phoneNumber = rs.getString("Phone");
                        String role = rs.getString("Role");
                        int aStatus = rs.getInt("AStatusId");

                        acc = new Account(accid, em, pw, userName, phoneNumber, role, aStatus);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public void EditUserAcc(String uid , String statusID) {
        Account acc = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null; 
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = " update [dbo].[Account]\n"
                        + " set [AStatusId] = ?\n"
                        + " where [AccId] = ?";

                pst = cn.prepareStatement(sql);
                pst.setString(1, statusID);
                pst.setString(2, uid);
                pst.executeUpdate();
                 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
      
    }
    
     public int totalUser() {
        ResultSet rs = null;
        Connection cn = null;
        PreparedStatement pst = null;
        int count=0;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select COUNT([AccId]) as Acc from [dbo].[Account]\n"
                        + "where [Role] not like 'admin'";
                pst=cn.prepareStatement(sql);
                rs=pst.executeQuery();
                if(rs!=null && rs.next()){
                    
                    count=rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return count;
    }
    public static void main(String[] args) {
        AccountDAO acd = new AccountDAO();
        acd.updatePhone(2, "0903786678");

        Account acc = acd.getAccountByid("2");
        ArrayList<Account> gta = acd.getAccByEmailPhone("ad");
        
        int tt = acd.totalUser();
        
            System.out.println(tt);
        
    }

}
