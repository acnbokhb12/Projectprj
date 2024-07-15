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
public class OrderStatus {
    private int idOrderStatus;
    private String nameOrderStatus;

    public OrderStatus() {
    }

    public OrderStatus(int idOrderStatus, String nameOrderStatus) {
        this.idOrderStatus = idOrderStatus;
        this.nameOrderStatus = nameOrderStatus;
    }

    public int getIdOrderStatus() {
        return idOrderStatus;
    }

    public void setIdOrderStatus(int idOrderStatus) {
        this.idOrderStatus = idOrderStatus;
    }

    public String getNameOrderStatus() {
        return nameOrderStatus;
    }

    public void setNameOrderStatus(String nameOrderStatus) {
        this.nameOrderStatus = nameOrderStatus;
    }

    @Override
    public String toString() {
        return "OrderStatus{" + "idOrderStatus=" + idOrderStatus + ", nameOrderStatus=" + nameOrderStatus + '}';
    }
    
    
}
