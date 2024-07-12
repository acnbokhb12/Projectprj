/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Food;
import dto.Ingredient;
import dto.OrderAcc;
import dto.OrderDetail;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import utils.myLib;
 


/**
 *
 * @author DELL
 */
public class OrderDAO {
    public Food getFoodWithTypeAndIngredients(String fid, String typeToby) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Food food = null;
        ArrayList<Food> listFN = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = " select f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ing.IngredientId,ing.InImage,ing.IngredientName,ing.Quantity, ing.Unit,ing.Price as ingPrice\n"
                        + "                                           from Food f inner join Ingredient ing on f.FoodId = ing.FoodId                            \n"
                        + "              where f.FoodId = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, fid);
                rs = pst.executeQuery();
                HashMap<Integer, Food> foodMap = new HashMap<>();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("FoodId");
                        String image = rs.getString("FoodImage");
                        String name = rs.getString("FoodName");
                        String desc = rs.getString("Description");
                        String recipe = rs.getString("Recipe");
                        float price = rs.getFloat("Price");
                        int status = rs.getInt("FStatusId");

                        food = foodMap.get(id);
                        if (food == null) {
                            food = new Food(id, image, name, desc, recipe, price, status, typeToby);
                            foodMap.put(id, food);
                        }

                        int ingId = rs.getInt("IngredientId");
                        String ingImg = rs.getString("InImage");
                        String ingName = rs.getString("IngredientName");
                        float ingQuantity = rs.getFloat("Quantity");
                        String ingUnit = rs.getString("Unit");
                        float ingPrice = rs.getFloat("ingPrice");
                        if (ingId != 0 && ingPrice != 0) {
                            Ingredient ingredient = new Ingredient(id, ingId, ingImg, ingName, ingQuantity, ingUnit, ingPrice);
                            food.getListingredients().add(ingredient);
                        }
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
        return food;
    }
    
    public ArrayList<OrderAcc> getOrderAccHistory(String accId){
            ArrayList<OrderAcc> listOrderH = new ArrayList<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [OrderId],[AccId],[Total],[Address],[OrderDate] ,[OStatusId]from [dbo].[OrderAcc] where [AccId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, accId);
                rs = pst.executeQuery();
                
                if(rs!=null){
                       while(rs.next()){
                           
                       OrderAcc oa = new OrderAcc();
                        int orId = rs.getInt("OrderId");
                        int accountId = rs.getInt("AccId");
                        float total = rs.getFloat("Total");
                        String address = rs.getString("Address");
                        Timestamp timestamp = rs.getTimestamp("OrderDate");
                        LocalDateTime d = timestamp.toLocalDateTime();
                       int status = rs.getInt("OStatusId");
                       
                       oa.setOrderId(orId);
                       oa.setAccId(accountId);
                       oa.setTotal(total);
                       oa.setAddressOrder(address);
                       oa.setOrderDate(d);
                       oa.setOrderStatus(status);
                       
                       String sql2 = "select [OrderId],[FoodId],[Type],[Quantity] from [dbo].[OrderDetail] where [OrderId] =?";
                       PreparedStatement pst2 = cn.prepareStatement(sql2);
                       pst2.setInt(1, orId);
                       ResultSet rs2 = pst2.executeQuery();
                       if(rs2!=null){
                           while(rs2.next()){                                                         
                               int ordIdDetail = rs2.getInt("OrderId");
                               int fid = rs2.getInt("FoodId");
                               String type = rs2.getString("Type");
                               int ordQty = rs2.getInt("Quantity");
                               
                               Food f = getFoodWithTypeAndIngredients(String.valueOf(fid), type);
                               
                               OrderDetail ord = new OrderDetail(ordIdDetail, fid, type, ordQty,f);
                               
                               oa.addOrderDetails(ord);
                               
                           }
                          
                       }
                       listOrderH.add(oa);
                     
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
        return listOrderH;
       } 
    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        String a ="2" ;
        ArrayList<OrderAcc> oa = od.getOrderAccHistory(a);
        for(OrderAcc o : oa){
            System.out.println(o);
        }
    }
}
