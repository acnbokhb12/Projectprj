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
public class OrderDetail {
    private int orderDetailId ;
    private int orderFoodId ;
    private String type;
    private int orderDetailQuantity;
    private float orderDetailCost ;

    public OrderDetail() {
        orderDetailId = 0;
        orderFoodId = 0;
        type = "";
        orderDetailQuantity = 0;
        orderDetailCost = 0 ;
    }

    public OrderDetail(int orderDetailId, int orderFoodId, String type, int orderDetailQuantity, float orderDetailCost) {
        this.orderDetailId = orderDetailId;
        this.orderFoodId = orderFoodId;
        this.type = type;
        this.orderDetailQuantity = orderDetailQuantity;
        this.orderDetailCost = orderDetailCost;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderFoodId() {
        return orderFoodId;
    }

    public void setOrderFoodId(int orderFoodId) {
        this.orderFoodId = orderFoodId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getOrderDetailQuantity() {
        return orderDetailQuantity;
    }

    public void setOrderDetailQuantity(int orderDetailQuantity) {
        this.orderDetailQuantity = orderDetailQuantity;
    }

    public float getOrderDetailCost() {
        return orderDetailCost;
    }

    public void setOrderDetailCost(float orderDetailCost) {
        this.orderDetailCost = orderDetailCost;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderDetailId=" + orderDetailId + ", orderFoodId=" + orderFoodId + ", type=" + type + ", orderDetailQuantity=" + orderDetailQuantity + ", orderDetailCost=" + orderDetailCost + '}';
    }
    
    
}
