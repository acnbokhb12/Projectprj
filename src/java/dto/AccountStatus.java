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
public class AccountStatus {
    private int AStatusId ;
    private String nameAStatus;

     
    public AccountStatus() {
    }

    public AccountStatus(int AStatusId, String nameAStatus) {
        this.AStatusId = AStatusId;
        this.nameAStatus = nameAStatus;
    }

    public int getAStatusId() {
        return AStatusId;
    }

    public void setAStatusId(int AStatusId) {
        this.AStatusId = AStatusId;
    }

    public String getNameAStatus() {
        return nameAStatus;
    }

    public void setNameAStatus(String nameAStatus) {
        this.nameAStatus = nameAStatus;
    }

    @Override
    public String toString() {
        return "AccountStatus{" + "AStatusId=" + AStatusId + ", nameAStatus=" + nameAStatus + '}';
    }
    
}
