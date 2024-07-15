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
import dto.OrderStatus;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
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
                String sql = "select [OrderId],[AccId],[Total],[Address],[OrderDate] ,[OStatusId],[CusName], [Phone]from [dbo].[OrderAcc] where [AccId] = ?";
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
                       String cusname = rs.getString("CusName");
                       String phone= rs.getString("Phone");
                       oa.setOrderId(orId);
                       oa.setAccId(accountId);
                       oa.setTotal(total);
                       oa.setAddressOrder(address);
                       oa.setOrderDate(d);
                       oa.setOrderStatus(status);
                       oa.setCusName(cusname);
                       oa.setPhone(phone);
                       
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
    public ArrayList<OrderAcc> getAllOrderAcc(){
            ArrayList<OrderAcc> listAllOrder = new ArrayList<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [OrderId],[AccId],[Total],[Address],[OrderDate] ,[OStatusId],[CusName], [Phone]from [dbo].[OrderAcc] ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                
                if(rs!=null){
                       while(rs.next()){
                           
                        int orId = rs.getInt("OrderId");
                        int accountId = rs.getInt("AccId");
                        float total = rs.getFloat("Total");
                        String address = rs.getString("Address");
                        Timestamp timestamp = rs.getTimestamp("OrderDate");
                        LocalDateTime d = timestamp.toLocalDateTime();
                       int status = rs.getInt("OStatusId");
                        String cusname = rs.getString("CusName");
                       String phone= rs.getString("Phone");
                       
                       OrderAcc oa = new OrderAcc(orId, accountId, total, address, d, status, cusname, phone, null);
                       listAllOrder.add(oa);                     
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
        return listAllOrder;
       }
    public ArrayList<OrderAcc> getOrderAccByStatusId(String statusID){
            ArrayList<OrderAcc> listAllOrder = new ArrayList<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [OrderId],[AccId],[Total],[Address],[OrderDate] ,[OStatusId] ,,[CusName], [Phone]from [dbo].[OrderAcc] where [OStatusId]=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, statusID);
                rs = pst.executeQuery();
                
                if(rs!=null){
                       while(rs.next()){
                           
                        int orId = rs.getInt("OrderId");
                        int accountId = rs.getInt("AccId");
                        float total = rs.getFloat("Total");
                        String address = rs.getString("Address");
                        Timestamp timestamp = rs.getTimestamp("OrderDate");
                        LocalDateTime d = timestamp.toLocalDateTime();
                       int status = rs.getInt("OStatusId");
                       String cusname = rs.getString("CusName");
                       String phone= rs.getString("Phone");
                       
                       OrderAcc oa = new OrderAcc(orId, accountId, total, address, d, status, cusname, phone, null);                                                   
                       listAllOrder.add(oa);                     
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
        return listAllOrder;
       }
    public ArrayList<OrderStatus> getALlStatusOrder (){
        ArrayList<OrderStatus> listS = new  ArrayList<>();
  
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [OStatusId],[Ostatus] from [dbo].[OrderStatus]";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                
                if(rs!=null){
                       while(rs.next()){
                           
                        int idStatus = rs.getInt("OStatusId");
                        String nameStatus = rs.getString("Ostatus");
                        
                        OrderStatus ods = new OrderStatus(idStatus, nameStatus);
                        listS.add(ods);
                                             
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
//     check out hoang lam
    
 public void checkOut(int accId, HashMap<Food, Integer> fim, Float TOTAL, String address, String name, String phone) throws ParseException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String da = String.valueOf(System.currentTimeMillis());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        Calendar cal = Calendar.getInstance();
        java.sql.Timestamp sqldatetime = new java.sql.Timestamp(cal.getTimeInMillis());
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                String sql = "Insert into [dbo].[OrderAcc] ([AccId], [Total], [Address], [OrderDate], [OStatusId],  [CusName], [Phone])\n"
                        + "values(?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, accId);
                pst.setFloat(2, TOTAL);
                pst.setString(3, address);
                pst.setTimestamp(4, sqldatetime);
                pst.setInt(5, 1);
                pst.setString(6, name);
                pst.setString(7, phone);
                System.out.println("insert order success");
                pst.executeUpdate();
                String sql3 = "Select top 1 [OrderId]\n"
                        + "from [dbo].[OrderAcc]\n"
                        + "Order by [OrderId] desc";
                PreparedStatement pst3 = cn.prepareStatement(sql3);
                rs = pst3.executeQuery();
                if (rs != null && rs.next()) {
                    int orderid = rs.getInt("OrderId");
                    if (rs != null) {
                        for (Food f : fim.keySet()) {
                            PreparedStatement pst2 = null;
                            String sql2 = "Insert into [dbo].[OrderDetail] ([OrderId], [FoodId], [Type], [Quantity])\n"
                                    + "values(?,?,?,?)";
                            pst2 = cn.prepareStatement(sql2);
                            pst2.setInt(1, orderid);
                            pst2.setInt(2, f.getFoodId());
                            pst2.setString(3, f.getTypeToBuy());
                            pst2.setInt(4, fim.get(f));
                            System.out.println("Insert detail success");
                            pst2.executeUpdate();
                        }
                    }
                }
                cn.setAutoCommit(true);
                cn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }
    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
//        Food d = od.getFoodWithTypeAndIngredients("1", "Ingredient");
//        FoodDAO fd = new FoodDAO();
//        Food f = fd.getFoodById("20");
//        HashMap<Food,
    ArrayList<OrderAcc> ac = od.getOrderAccHistory("2");
        for(OrderAcc d : ac){
            
    System.out.println(d);
        }
//        String txta ="0,  -2,3,2  ,5,0,7," ;
//        String [] a = txta.split(",");
//        int sum = 0;
//
//        boolean c = false;
//        boolean ni = false;
//        for (String s : a) {
//            s=s.trim();
//            if (s.matches("-?\\d+(\\.\\d+)?")) {
//                System.out.println(s + " là số.");
//                int fd = Integer.parseInt(s);
//                if(fd <0 ){
//                    ni=true;
//                               
//                    break;
//
//                }
//            } else {
//                System.out.println(s + " là chuỗi.");
//                c=true;
//                break;
//            }
//        }
//        if(c==true || ni == true){
//            System.out.println("You musr input value number");
//        }else{
//              
//        for(String s : a){
//            s=s.trim();
//          
//            int sf = Integer.parseInt(s);
//            if(sf % 2 == 0){
//                
//            sum=sum+sf;
//            }
//        }
//            System.out.println(sum);
//        }
    }
}
