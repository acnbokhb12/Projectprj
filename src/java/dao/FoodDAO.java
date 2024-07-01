/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import dto.Categories;
import dto.Food;
import dto.Ingredient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import utils.myLib;

/**
 *
 * @author DELL
 */
public class FoodDAO {

    public ArrayList<Food> getAllFood() {

        ArrayList<Food> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId,ct.CateImage,ct.CategoryName  \n"
                        + "                         from Food f left join FoodCate fd on f.FoodId = fd.FoodId  \n"
                        + "                        left join Categories ct on fd.CategoriesId = ct.CategoryId";
                pst = cn.prepareStatement(sql);
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

                        Food food = foodMap.get(id);
                        if (food == null) {
                            food = new Food(id, image, name, desc, recipe, price, status);
                            foodMap.put(id, food);
                        }

                        int cateId = rs.getInt("CategoryId");
                        String cateImg = rs.getString("CateImage");
                        String cateName = rs.getString("CategoryName");
                        if (cateId != 0 && cateName != null) {
                            Categories cat = new Categories(cateId, cateImg, cateName);
                            food.getCategories().add(cat);
                        }
                    }

                    list.addAll(foodMap.values());
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
        return list;
    }

    public ArrayList<Categories> getlistCategories() {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Categories> listCate = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [CategoryId],[CateImage],[CategoryName]  from [dbo].[Categories]";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int cateId = rs.getInt("CategoryId");
                        String cateImg = rs.getString("CateImage");
                        String cateName = rs.getString("CategoryName");

                        Categories cate = new Categories(cateId, cateImg, cateName);
                        listCate.add(cate);
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
        return listCate;
    }

    public ArrayList<Food> getFoodbyCateID(String cateID) {

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Food> list = new ArrayList<>();

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select   f.FoodId, f.FoodImage, f.FoodName, f.Description, f.Recipe, f.Price, f.FStatusId, c.CategoryId,c.CateImage,c.CategoryName \n"
                        + "from Food f left join FoodCate fc on f.FoodId = fc.FoodId\n"
                        + "     left join Categories c on fc.CategoriesId = c.CategoryId\n"
                        + "                     WHERE c.CategoryId = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, cateID);
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

                        Food food = foodMap.get(id);
                        if (food == null) {
                            food = new Food(id, image, name, desc, recipe, price, status);
                            foodMap.put(id, food);
                        }

                        int cateId = rs.getInt("CategoryId");
                        String cateImg = "";
                        String cateName = rs.getString("CategoryName");
                        if (cateId != 0 && cateName != null) {
                            Categories cat = new Categories(cateId, cateImg, cateName);
                            food.getCategories().add(cat);
                        }
                    }

                    list.addAll(foodMap.values());
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
        return list;
    }

    public ArrayList<Food> searchFoodByName(String txtnamesearch) {

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Food> list = new ArrayList<>();

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select   f.FoodId, f.FoodImage, f.FoodName, f.Description, f.Recipe, f.Price, f.FStatusId, c.CategoryId,c.CateImage,c.CategoryName \n"
                        + "                       from Food f left join FoodCate fc on f.FoodId = fc.FoodId\n"
                        + "                           left join Categories c on fc.CategoriesId = c.CategoryId\n"
                        + "                                        WHERE f.FoodName like ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + txtnamesearch + "%");
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

                        Food food = foodMap.get(id);
                        if (food == null) {
                            food = new Food(id, image, name, desc, recipe, price, status);
                            foodMap.put(id, food);
                        }

                        int cateId = rs.getInt("CategoryId");
                        String cateImg = "";
                        String cateName = rs.getString("CategoryName");
                        if (cateId != 0 && cateName != null) {
                            Categories cat = new Categories(cateId, cateImg, cateName);
                            food.getCategories().add(cat);
                        }
                    }

                    list.addAll(foodMap.values());
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
        return list;
    }

      public ArrayList<Food> getNewFood() {
         Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Food> listFN = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT top 5  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId,ct.CateImage,ct.CategoryName  \n"
                        + "                         from Food f left join FoodCate fd on f.FoodId = fd.FoodId  \n"
                        + "                        left join Categories ct on fd.CategoriesId = ct.CategoryId  \n"
                        + " order by  f.FoodId desc ";
                pst = cn.prepareStatement(sql);
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

                        Food food = foodMap.get(id);
                        if (food == null) {
                            food = new Food(id, image, name, desc, recipe, price, status);
                            foodMap.put(id, food);
                        }

                        int cateId = rs.getInt("CategoryId");
                        String cateImg = rs.getString("CateImage");
                        String cateName = rs.getString("CategoryName");
                        if (cateId != 0 && cateName != null) {
                            Categories cat = new Categories(cateId, cateImg, cateName);
                            food.getCategories().add(cat);
                        }
                    }

                    listFN.addAll(foodMap.values());
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return listFN;
    }

    public Food getFoodById(String idFood) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Food food = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [FoodId], [FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId] from [dbo].[Food] where [FoodId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, idFood);
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    int id = rs.getInt("FoodId");
                    String image = rs.getString("FoodImage");
                    String name = rs.getString("FoodName");
                    String desc = rs.getString("Description");
                    String recipe = rs.getString("Recipe");
                    float price = rs.getFloat("Price");
                    int status = rs.getInt("FStatusId");
                    food = new Food(id, image, name, desc, recipe, price, status);
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

    //
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
                        + "                                           from Food f left join Ingredient ing on f.FoodId = ing.FoodId                            \n"
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
                            Ingredient ingredient = new Ingredient(id,ingId, ingImg, ingName, ingQuantity, ingUnit, ingPrice);
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

    // take inredient by foodid 
    public ArrayList<Ingredient> getIngredientsByFoodId(String idFood) {
        ArrayList<Ingredient> listIngredients = new ArrayList<>();
        Ingredient ingredient = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [FoodId],[IngredientId],[InImage],[IngredientName], [Quantity],[Unit],[Price] from [dbo].[Ingredient]  where [FoodId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, idFood);
                rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int foodId = rs.getInt("FoodId");
                        int IngrId = rs.getInt("IngredientId");
                        String imageIng = rs.getString("InImage");
                        String nameIng = rs.getString("IngredientName");
                        float quanity = rs.getFloat("Quantity");
                        String unit = rs.getString("Unit");
                        float price = rs.getFloat("Price");

                        ingredient = new Ingredient(foodId, IngrId, imageIng, nameIng, quanity, unit, price);
                        listIngredients.add(ingredient);
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
        return listIngredients;
    }

    public float getTotalPriceIng(ArrayList<Ingredient> lIng) {
        float total = 0;
        for (Ingredient i : lIng) {
            total = total + i.getIngredientPrice();
        }
        return total;
    }
    
    public HashMap<Integer, String> getFoodStatus (){
        HashMap<Integer,String> listStatus = new  HashMap<>();
        
         Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
      
       
        try {
            cn = myLib.makeConnection();
            if(cn!=null){            
                String sql = "select [FStatusId],[FStatus] from [dbo].[FoodStatus] ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs!=null){
                    while (rs.next()) {                        
                        int fStatusId = rs.getInt("FStatusId");
                        String fStatusName = rs.getString("FStatus");
                        listStatus.put(fStatusId, fStatusName);
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
        return  listStatus;
    }
    
    public static void main(String[] args) {
        FoodDAO fd = new FoodDAO();
        String a = "10";
        ArrayList<Food> ing = fd.searchFoodByName("dri");
        ArrayList<Food> f = fd.getNewFood();
        HashMap <Integer ,String > listFst = fd.getFoodStatus();
        for(Food as :  f ){
            
        System.out.println(as);
        }
    }
}
