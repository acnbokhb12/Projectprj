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
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId,ct.CateImage,ct.CategoryName  \n"
                        + "                         from Food f left join FoodCate fd on f.FoodId = fd.FoodId  \n"
                        + "                        left join Categories ct on fd.CategoriesId = ct.CategoryId";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
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
        ArrayList<Categories> listCate = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [CategoryId],[CateImage],[CategoryName]  from [dbo].[Categories]";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
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
        ArrayList<Food> list = new ArrayList<>();

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select   f.FoodId, f.FoodImage, f.FoodName, f.Description, f.Recipe, f.Price, f.FStatusId, c.CategoryId,c.CateImage,c.CategoryName \n"
                        + "from Food f left join FoodCate fc on f.FoodId = fc.FoodId\n"
                        + "     left join Categories c on fc.CategoriesId = c.CategoryId\n"
                        + "                     WHERE c.CategoryId = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, cateID);
                ResultSet rs = pst.executeQuery();
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
        ArrayList<Food> listFN = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT top 5  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId,ct.CateImage,ct.CategoryName  \n"
                        + "                         from Food f left join FoodCate fd on f.FoodId = fd.FoodId  \n"
                        + "                        left join Categories ct on fd.CategoriesId = ct.CategoryId  \n"
                        + " order by  f.FoodId desc ";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
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
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return listFN;
    }

    public Food getFoodById(String idFood) {
        Connection cn = null;
        Food food = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [FoodId], [FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId] from [dbo].[Food] where [FoodId] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1,  idFood);
                ResultSet rs = pst.executeQuery();
               
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
    public ArrayList<Ingredient> getIngredientsByFoodId(String idFood){
        ArrayList<Ingredient> listIngredients = new ArrayList<>();
        Ingredient ingredient = null;
        Connection cn = null;
         
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [FoodId],[IngredientId],[InImage],[IngredientName], [Quantity],[Unit],[Price] from [dbo].[Ingredient]  where [FoodId] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idFood);
                ResultSet rs = pst.executeQuery();
                
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
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return listIngredients;
    }
    public float getTotalPriceIng(ArrayList<Ingredient> lIng){
        float total = 0;
        for(Ingredient i : lIng){
            total = total + i.getIngredientPrice();
        }
        return total;
    }
    
    public static void main(String[] args) {
        FoodDAO fd = new FoodDAO();
        String a ="1";
        ArrayList<Ingredient> ing = fd.getIngredientsByFoodId(a);
         
        Food f= fd.getFoodById(a);
        System.out.println(f);
         
    }
}
