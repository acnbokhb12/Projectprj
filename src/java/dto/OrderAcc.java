/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class OrderAcc {
    private int orderId ;
    private int accId ;
    private float total;
    private String addressOrder;
    private Date orderDate ;
    private int orderStatus;
    private ArrayList<OrderDetail> details ;

    public OrderAcc() {
         
    }

    public OrderAcc(int orderId, int accId, float total, String addressOrder, Date orderDate, int orderStatus) {
        this.orderId = orderId;
        this.accId = accId;
        this.total = total;
        this.addressOrder = addressOrder;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getAddressOrder() {
        return addressOrder;
    }

    public void setAddressOrder(String addressOrder) {
        this.addressOrder = addressOrder;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public ArrayList<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<OrderDetail> details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "OrderAcc{" + "orderId=" + orderId + ", accId=" + accId + ", total=" + total + ", addressOrder=" + addressOrder + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", details=" + details + '}';
    }
    
    
}
