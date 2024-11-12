/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;
import java.time.LocalDateTime;
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
    private LocalDateTime  orderDate ;
    private int orderStatus;
    private String CusName;
    private String Phone;
    private Account acc;
    private ArrayList<OrderDetail> orderDetails ;

    public OrderAcc() {
         orderDate = LocalDateTime.now();
         orderDetails = new ArrayList<>();
    }

    public OrderAcc(int orderId, int accId, float total, String addressOrder, LocalDateTime orderDate, int orderStatus, String CusName, String Phone, ArrayList<OrderDetail> orderDetails) {
        this.orderId = orderId;
        this.accId = accId;
        this.total = total;
        this.addressOrder = addressOrder;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.CusName = CusName;
        this.Phone = Phone;
        this.acc = acc;
        this.orderDetails = orderDetails;
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

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public ArrayList<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(ArrayList<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
    
    public void addOrderDetails(OrderDetail orderDetail){
        this.orderDetails.add(orderDetail);
    }

    public String getCusName() {
        return CusName;
    }

    public void setCusName(String CusName) {
        this.CusName = CusName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    @Override
    public String toString() {
        return "OrderAcc{" + "orderId=" + orderId + ", accId=" + accId + ", total=" + total + ", addressOrder=" + addressOrder + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", CusName=" + CusName + ", Phone=" + Phone + ", acc=" + acc + ", orderDetails=" + orderDetails + '}';
    }
    

   

    
   
     
    
    
}
