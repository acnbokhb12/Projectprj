/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Food;
import dto.WeeklyMenu;
import dto.WeeklyMenuDetail;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import utils.myLib;


/**
 *
 * @author DELL
 */
public class WeeklyDAO {
//    lay het list menu cua app
     public ArrayList<WeeklyMenu> getAllWeeklyMenu() {
        ArrayList<WeeklyMenu> listWeeklyMenu = new ArrayList<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        FoodDAO fd = new FoodDAO();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [MenuId],[MenuName],[MenuImg]\n"
                        + "from  [dbo].[WeeklyMenu]";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                float totalWeekLyMenu = 0;
                if (rs != null) {
                    while (rs.next()) {
                        WeeklyMenu wm = new WeeklyMenu();
                        int mId = rs.getInt("MenuId");
                        String mName = rs.getString("MenuName");
                        String mImg = rs.getString("MenuImg");
                        wm.setMenuId(mId);
                        wm.setMenuName(mName);
                        wm.setMenuImg(mImg);

                        //Lay danh sach weekly detai
                        String sql2 = "select  [MenuId],[DOW],[FoodId],[SessionId]\n"
                                + "from  [dbo].[WeeklyMenuDetail]\n"
                                + "where [MenuId] = ?";
                        PreparedStatement pst2 = cn.prepareStatement(sql2);
                        pst2.setInt(1, mId);
                        ResultSet rs2 = pst2.executeQuery();

                        if (rs2 != null) {
                            while (rs2.next()) {
                                int mIdDe = rs2.getInt("MenuId");
                                int dow = rs2.getInt("DOW");
                                int fid = rs2.getInt("FoodId");
                                int sessId = rs2.getInt("SessionId");

                                WeeklyMenuDetail wmd = new WeeklyMenuDetail(mIdDe, dow, fid, sessId);

                                wm.addWeeklyDetail(wmd);
                            }
                        }

                        float total = 0;
                        for (WeeklyMenuDetail wmdl : wm.getDetailWeekMenu()) {
                            Food food = fd.getFoodById(String.valueOf(wmdl.getFoodIdW()));
                            total += food.getPrice();
                        }
                        wm.setPriceTotalWeek(total);
                        listWeeklyMenu.add(wm);
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
        return listWeeklyMenu;
    }
     public ArrayList<WeeklyMenu> searchWeeklyMenu(String txtNameW) {
        ArrayList<WeeklyMenu> listWeeklyMenu = new ArrayList<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        FoodDAO fd = new FoodDAO();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [MenuId],[MenuName],[MenuImg]\n"
                        + "from  [dbo].[WeeklyMenu]\n"
                        + "where [MenuName] like ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + txtNameW + "%");
                rs = pst.executeQuery();
              
                if (rs != null) {
                    while (rs.next()) {
                        WeeklyMenu wm = new WeeklyMenu();
                        int mId = rs.getInt("MenuId");
                        String mName = rs.getString("MenuName");
                        String mImg = rs.getString("MenuImg");
                        wm.setMenuId(mId);
                        wm.setMenuName(mName);
                        wm.setMenuImg(mImg);

                        //Lay danh sach weekly detai
                        String sql2 = "select  [MenuId],[DOW],[FoodId],[SessionId]\n"
                                + "from  [dbo].[WeeklyMenuDetail]\n"
                                + "where [MenuId] = ?";
                        PreparedStatement pst2 = cn.prepareStatement(sql2);
                        pst2.setInt(1, mId);
                        ResultSet rs2 = pst2.executeQuery();

                        if (rs2 != null) {
                            while (rs2.next()) {
                                int mIdDe = rs2.getInt("MenuId");
                                int dow = rs2.getInt("DOW");
                                int fid = rs2.getInt("FoodId");
                                int sessId = rs2.getInt("SessionId");

                                WeeklyMenuDetail wmd = new WeeklyMenuDetail(mIdDe, dow, fid, sessId);

                                wm.addWeeklyDetail(wmd);
                            }
                        }

                        float total = 0;
                        for (WeeklyMenuDetail wmdl : wm.getDetailWeekMenu()) {
                            Food food = fd.getFoodById(String.valueOf(wmdl.getFoodIdW()));
                            total += food.getPrice();
                        }
                        wm.setPriceTotalWeek(total);
                        listWeeklyMenu.add(wm);
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
        return listWeeklyMenu;
    }
    public HashMap<Integer, ArrayList<Food>> getAllWeeklyMenuDetail(String menuid) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        HashMap<Integer, ArrayList<Food>> hashmenu = new HashMap<>();
        FoodDAO fd = new FoodDAO();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "	 select [MenuId],[DOW] ,[FoodId],[SessionId]\n"
                        + "	 from  [dbo].[WeeklyMenuDetail]  \n"
                        + "      where  [MenuId] = ? ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, menuid);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int menuidWeek = rs.getInt("MenuId");
                        int dow = rs.getInt("DOW");
                        int fid = rs.getInt("FoodId");
                        int sessionid = rs.getInt("SessionId");

                        Food fp = fd.getFoodbyIdWithCate(String.valueOf(fid));
                        if (!hashmenu.containsKey(dow)) {
                            ArrayList<Food> f = new ArrayList<>();
                            hashmenu.put(dow, f);
                        }
                        hashmenu.get(dow).add(fp);

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
        return hashmenu;
    }
//    ADD VAO DATABASE
     public void addToMealPlan(HashMap<String, ArrayList<Food>> mealMap, int AID) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {

                for (String DATE : mealMap.keySet()) {
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//                    Date date = (Date) df.parse(DATE);
                    java.util.Date date = df.parse(DATE);
                    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                    for (Food f : mealMap.get(DATE)) {
                        String sql = "insert into [dbo].[MealPlan] ([AccId], [FoodId], [Date])\n"
                                + "values(?,?,?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, AID);
                        pst.setInt(2, f.getFoodId());
                        pst.setDate(3, sqlDate);
                        System.out.println("exucute update next");
                        pst.executeUpdate();
                    }

                }
                cn.commit();

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
        return;
    }
    
    public HashMap<String, ArrayList<Food>> getMealPlanById(String accId) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        HashMap<String, ArrayList<Food>> mealMap = new HashMap<>();
        int AID = Integer.parseInt(accId);
        FoodDAO fd = new FoodDAO();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                String sql = "select  distinct [Date]from [dbo].[MealPlan]\n"
                        + "where [AccId]=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, AID);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        Date da = rs.getDate("Date");
                        java.sql.Date sqlDate = new java.sql.Date(da.getTime());
                        String sql2 = "Select [FoodId] from [dbo].[MealPlan]\n"
                                + "where [AccId]=?\n"
                                + "and Date like ?";
                        String stringdate = df.format(da);
                        PreparedStatement pst2 = cn.prepareStatement(sql2);
                        pst2.setInt(1, AID);
                        pst2.setDate(2, sqlDate);
                        ResultSet rs2 = pst2.executeQuery();
                        ArrayList<Food> foodL = new ArrayList<>();
                        if (rs2 != null) {
                            while (rs2.next()) {
                                String fid = String.valueOf(rs2.getInt("FoodId"));
                                Food food = (fd.getFoodById(fid));
                                food.setCategories((fd.getCateByFoodId(fid)));
                                foodL.add(food);
                            }
                        }
                        mealMap.put(stringdate, foodL);
                        cn.commit();
                    }
                }
                cn.setAutoCommit(true);
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
        return mealMap;
    }
     public void deleteFoodFromMealPlan(int accid, int foodid, String date) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "delete from [dbo].[MealPlan] \n"
                        + "where [AccId]=?\n"
                        + "and [FoodId]=?\n"
                        + "and [Date]=?";
                pst=cn.prepareStatement(sql);
                pst.setInt(1, accid);
                pst.setInt(2, foodid);
                DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date da = df.parse(date);
                java.sql.Date sqldate= new java.sql.Date (da.getTime());
                pst.setDate(3, sqldate);
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
        return;
    }
    public static void main(String[] args) {
        WeeklyDAO wld = new WeeklyDAO();
        FoodDAO fd=new FoodDAO();
        String a="2024-04-12";
        String b ="1";
        ArrayList<Food> fL=new ArrayList<>();
        fL.add(fd.getFoodById(b));
        HashMap<String,ArrayList<Food>> fMap= new HashMap<>();
        fMap.put(a,fL);
        wld.addToMealPlan(fMap, 1);
    }
}
