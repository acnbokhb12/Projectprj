/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author DELL
 */
public class Account {
    private int accId;
    private String email;
    private String password;
    private String userName;
    private String phoneNumber;
    private String role;
    private int aStatusId;

    public Account() {
        accId =0;
        email="";
        password="";
        userName="";
        phoneNumber="";
        role="";
        aStatusId=0;
    }

    public Account(int accId, String email, String password, String userName, String phoneNumber, String role, int aStatusId) {
        this.accId = accId;
        this.email = email;
        this.password = password;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.aStatusId = aStatusId;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getaStatusId() {
        return aStatusId;
    }

    public void setaStatusId(int aStatusId) {
        this.aStatusId = aStatusId;
    }

    @Override
    public String toString() {
        return "Account{" + "accId=" + accId + ", email=" + email + ", password=" + password + ", userName=" + userName + ", phoneNumber=" + phoneNumber + ", role=" + role + ", aStatusId=" + aStatusId + '}';
    }
    
    
}
