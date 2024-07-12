/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class OrderDetail {
    private int orderDetailId ;
    private int orderFoodId ;
    private String type;
    private int orderDetailQuantity;
    private Food food;
//    private ArrayList<Food> listDetailFood ;

    public OrderDetail() {
        orderDetailId = 0;
        orderFoodId = 0;
        type = "";
        orderDetailQuantity = 0;
//        listDetailFood = new ArrayList<>();
    }

    public OrderDetail(int orderDetailId, int orderFoodId, String type, int orderDetailQuantity, Food food) {
        this.orderDetailId = orderDetailId;
        this.orderFoodId = orderFoodId;
        this.type = type;
        this.orderDetailQuantity = orderDetailQuantity;
        this.food = food;
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

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    
//    public void addFoodToList(Food food){
//        this.listDetailFood.add(food);
//    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderDetailId=" + orderDetailId + ", orderFoodId=" + orderFoodId + ", type=" + type + ", orderDetailQuantity=" + orderDetailQuantity + ", food=" + food + '}';
    }

    

    
    
     
    
    
}
