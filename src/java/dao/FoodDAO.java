  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import dto.Categories;
import dto.Food;
import dto.FoodStatus;
import dto.Ingredient;
import dto.OrderAcc;
import dto.OrderDetail;
import dto.WeeklyMenu;
import dto.WeeklyMenuDetail;
import java.sql.Connection;
import java.sql.Date;
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
         Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Food> listFN = new ArrayList<>();
        Food f = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT [FoodId],[FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId]  from [dbo].[Food] where [FStatusId] != 3";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        f = new Food();
                        int id = rs.getInt("FoodId");
                        String image = rs.getString("FoodImage");
                        String name = rs.getString("FoodName");
                        String desc = rs.getString("Description");
                        String recipe = rs.getString("Recipe");
                        float price = rs.getFloat("Price");
                        int status = rs.getInt("FStatusId");

                        f.setFoodId(id);
                        f.setImage(image);
                        f.setName(name);
                        f.setDescription(desc);
                        f.setRecipe(recipe);
                        f.setPrice(price);
                        f.setfStatusId(status);

                        String sql2 = "SELECT  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId ,ct.CateImage ,ct.CategoryName   \n"
                                + "                      from Food f inner join FoodCate fd on f.FoodId = fd.FoodId   \n"
                                + "                           inner join Categories ct on fd.CategoriesId = ct.CategoryId\n"
                                + "						   where f.FoodId  = ?";
                        PreparedStatement pst2 = cn.prepareStatement(sql2);
                        pst2.setInt(1, id);
                        ResultSet rs2 = pst2.executeQuery();
                        ArrayList<Categories> listCate = new ArrayList<>();
                        if(rs2!= null){
                            while(rs2.next()){
                                int cateId = rs2.getInt("CategoryId");
                                String cateImg = rs2.getString("CateImage");
                                String cateName = rs2.getString("CategoryName");
                                Categories cat = new Categories(cateId, cateImg, cateName);
                                listCate.add(cat);
                            }
                            
                        }
                        f.setCategories(listCate);
                        
                        listFN.add(f);
                           
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
        return listFN;   
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
                        + "from Food f inner join FoodCate fc on f.FoodId = fc.FoodId\n"
                        + "     inner join Categories c on fc.CategoriesId = c.CategoryId\n"
                        + "                     WHERE c.CategoryId = ? and f.FStatusId != 3";
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
        ArrayList<Food> listFN = new ArrayList<>();
        Food f = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT [FoodId],[FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId]  from [dbo].[Food] where [FStatusId] != 3 and [FoodName] like ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + txtnamesearch + "%");
                rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        f = new Food();
                        int id = rs.getInt("FoodId");
                        String image = rs.getString("FoodImage");
                        String name = rs.getString("FoodName");
                        String desc = rs.getString("Description");
                        String recipe = rs.getString("Recipe");
                        float price = rs.getFloat("Price");
                        int status = rs.getInt("FStatusId");

                        f.setFoodId(id);
                        f.setImage(image);
                        f.setName(name);
                        f.setDescription(desc);
                        f.setRecipe(recipe);
                        f.setPrice(price);
                        f.setfStatusId(status);

                        String sql2 = "SELECT  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId ,ct.CateImage ,ct.CategoryName   \n"
                                + "                      from Food f inner join FoodCate fd on f.FoodId = fd.FoodId   \n"
                                + "                           inner join Categories ct on fd.CategoriesId = ct.CategoryId\n"
                                + "						   where f.FoodId  = ?";
                        PreparedStatement pst2 = cn.prepareStatement(sql2);
                        pst2.setInt(1, id);
                        ResultSet rs2 = pst2.executeQuery();
                        ArrayList<Categories> listCate = new ArrayList<>();
                        if(rs2!= null){
                            while(rs2.next()){
                                int cateId = rs2.getInt("CategoryId");
                                String cateImg = rs2.getString("CateImage");
                                String cateName = rs2.getString("CategoryName");
                                Categories cat = new Categories(cateId, cateImg, cateName);
                                listCate.add(cat);
                            }
                            
                        }
                        f.setCategories(listCate);
                        
                        listFN.add(f);
                           
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
        return listFN;
    }
    
    public ArrayList<Food> getNewFoodFive() {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Food> listFN = new ArrayList<>();
        Food f = null;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT top 5 [FoodId],[FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId]  from [dbo].[Food] where [FStatusId] != 3 order by [FoodId] desc ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        f = new Food();
                        int id = rs.getInt("FoodId");
                        String image = rs.getString("FoodImage");
                        String name = rs.getString("FoodName");
                        String desc = rs.getString("Description");
                        String recipe = rs.getString("Recipe");
                        float price = rs.getFloat("Price");
                        int status = rs.getInt("FStatusId");

                        f.setFoodId(id);
                        f.setImage(image);
                        f.setName(name);
                        f.setDescription(desc);
                        f.setRecipe(recipe);
                        f.setPrice(price);
                        f.setfStatusId(status);

                        String sql2 = "SELECT  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId ,ct.CateImage ,ct.CategoryName   \n"
                                + "                      from Food f inner join FoodCate fd on f.FoodId = fd.FoodId   \n"
                                + "                           inner join Categories ct on fd.CategoriesId = ct.CategoryId\n"
                                + "						   where f.FoodId  = ?";
                        PreparedStatement pst2 = cn.prepareStatement(sql2);
                        pst2.setInt(1, id);
                        ResultSet rs2 = pst2.executeQuery();
                        ArrayList<Categories> listCate = new ArrayList<>();
                        if(rs2!= null){
                            while(rs2.next()){
                                int cateId = rs2.getInt("CategoryId");
                                String cateImg = rs2.getString("CateImage");
                                String cateName = rs2.getString("CategoryName");
                                Categories cat = new Categories(cateId, cateImg, cateName);
                                listCate.add(cat);
                            }
                            
                        }
                        f.setCategories(listCate);
                        
                        listFN.add(f);
                           
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
                String sql = "select [FoodId], [FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId] from [dbo].[Food] where [FoodId] = ? and [FStatusId] != 3";
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

    public Food getFoodbyIdWithCate(String fid) {

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Food food = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "SELECT  f.FoodId, f.FoodName,  f.FoodImage,   f.Description, f.Recipe, f.Price, f.FStatusId, ct.CategoryId,ct.CateImage,ct.CategoryName   \n"
                        + "                                         from Food f inner join FoodCate fd on f.FoodId = fd.FoodId   \n"
                        + "                                            inner join Categories ct on fd.CategoriesId = ct.CategoryId\n"
                        + "											where f.FoodId = ?";
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
                            food = new Food(id, image, name, desc, recipe, price, status);
                            foodMap.put(id, food);
                        }

                        int cateId = rs.getInt("CategoryId");
                        String cateImg = rs.getString("CateImage");
                        String cateName = rs.getString("CategoryName");
                        if (cateName != null) {
                            Categories cat = new Categories(cateId, cateImg, cateName);
                            food.getCategories().add(cat);
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
                        + "              where f.FoodId = ? ";
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

    //
    public Food getFoodWithIngredients(String fid) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        ArrayList<Food> listFN = new ArrayList<>();
        Food f = new Food();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = " select[FoodId],[FoodImage],[FoodName],[Description],[Recipe],[Price],[FStatusId]   from  [dbo].[Food] where [FoodId] = ? and [FStatusId] != 3";
                pst = cn.prepareStatement(sql);
                pst.setString(1, fid);
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {

                    int id = rs.getInt("FoodId");
                    String image = rs.getString("FoodImage");
                    String name = rs.getString("FoodName");
                    String desc = rs.getString("Description");
                    String recipe = rs.getString("Recipe");
                    float price = rs.getFloat("Price");
                    int status = rs.getInt("FStatusId");

                    f.setFoodId(id);
                    f.setImage(image);
                    f.setName(name);
                    f.setDescription(desc);
                    f.setRecipe(recipe);
                    f.setPrice(price);
                    f.setfStatusId(status);

                    String sql2 = " select [FoodId],[IngredientId],[InImage],[IngredientName],[Quantity],[Unit],[Price] as ingPrice from [dbo].[Ingredient] where [FoodId] = ?";
                    PreparedStatement pst2 = cn.prepareStatement(sql2);
                    pst2.setInt(1, id);
                    ResultSet rs2 = pst2.executeQuery();
                    ArrayList<Ingredient> ling = new ArrayList<>();
                    while (rs2.next()) {
                        int fid2 = rs2.getInt("FoodId");
                        int ingId = rs2.getInt("IngredientId");
                        String ingImg = rs2.getString("InImage");
                        String ingName = rs2.getString("IngredientName");
                        float ingQuantity = rs2.getFloat("Quantity");
                        String ingUnit = rs2.getString("Unit");
                        float ingPrice = rs2.getFloat("ingPrice");
                        Ingredient ing = new Ingredient(fid2, ingId, ingImg, ingName, ingQuantity, ingUnit, ingPrice);
                        ling.add(ing);

                    }
                    f.setListingredients(ling);
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
        return f;
    }

    public ArrayList<Categories> getCateByFoodId(String fid) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Categories> cateL = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [CategoryId], [CategoryName], [CateImage]\n"
                        + "from [dbo].[Categories] ca, [dbo].[FoodCate] fa\n"
                        + "where  ca.CategoryId=fa.CategoriesId\n"
                        + "and fa.FoodId=?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, fid);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int catid = rs.getInt("CategoryId");
                        String catname = rs.getString("CategoryName");
                        String catimg = rs.getString("CateImage");
                        Categories cate = new Categories(catid, catimg, catname);
                        cateL.add(cate);
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
        return cateL;
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
                String sql = "select [FoodId],[IngredientId],[InImage],[IngredientName], [Quantity],[Unit],[Price] from [dbo].[Ingredient]  where [FoodId] = ?  ";
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

    public HashMap<Integer, String> getFoodStatus() {
        HashMap<Integer, String> listStatus = new HashMap<>();

        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [FStatusId],[FStatus] from [dbo].[FoodStatus] ";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null) {
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
        return listStatus;
    }

//    public HashMap<Integer, ArrayList<Food>> getAllWeeklyMenuDetail(String menuid) {
//        Connection cn = null;
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        HashMap<Integer, ArrayList<Food>> hashmenu = new HashMap<>();
//        try {
//            cn = myLib.makeConnection();
//            if (cn != null) {
//                String sql = "	 select [MenuId],[DOW] ,[FoodId],[SessionId]\n"
//                        + "	 from  [dbo].[WeeklyMenuDetail]  \n"
//                        + "      where  [MenuId] = ? ";
//                pst = cn.prepareStatement(sql);
//                pst.setString(1, menuid);
//                rs = pst.executeQuery();
//                if (rs != null) {
//                    while (rs.next()) {
//                        int menuidWeek = rs.getInt("MenuId");
//                        int dow = rs.getInt("DOW");
//                        int fid = rs.getInt("FoodId");
//                        int sessionid = rs.getInt("SessionId");
//
//                        Food fp = getFoodbyIdWithCate(String.valueOf(fid));
//                        if (!hashmenu.containsKey(dow)) {
//                            ArrayList<Food> f = new ArrayList<>();
//                            hashmenu.put(dow, f);
//                        }
//                        hashmenu.get(dow).add(fp);
//
//                    }
//                }
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (pst != null) {
//                    pst.close();
//                }
//                if (cn != null) {
//                    cn.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return hashmenu;
//    }
    public ArrayList<FoodStatus> getAllFoodStatus() {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<FoodStatus> listStatus = new ArrayList<>();

        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select [FStatusId],[FStatus]  from [dbo].[FoodStatus] where [FStatusId] != 3";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("FStatusId");
                        String nameSt = rs.getString("FStatus");

                        FoodStatus fst = new FoodStatus(id, nameSt);
                        listStatus.add(fst);
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
        return listStatus;
    }

    public ArrayList<Food> getFoodWithStatusId(String sfid) {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Food> listFN = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = " select [FoodId],[FoodImage],[FoodName], [Description],[Recipe],[Price],[FStatusId] from  [dbo].[Food] where [FStatusId] = ? ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, sfid);
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

                        Food f = new Food(id, image, name, desc, recipe, price, status);

                        listFN.add(f);
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
        return listFN;
    }

    public void updateStatusFood(String fid, String fstatus) {
        Connection cn = null;
        PreparedStatement pst = null;

        ArrayList<Food> listFN = new ArrayList<>();
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Food]\n"
                        + "set [FStatusId] = ?\n"
                        + "where [FoodId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, fstatus);
                pst.setString(2, fid);
                pst.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

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

    }
    public int totalProduct() {
        ResultSet rs = null;
        Connection cn = null;
        PreparedStatement pst = null;
        int count = 0;
        try {
            cn = myLib.makeConnection();
            if (cn != null) {
                String sql = "select COUNT([FoodId]) as Product from [dbo].[Food]\n"
                        + "where [FStatusId]!= 3";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs!=null && rs.next())
                count = rs.getInt(1);
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
        return count;
    }

    public static void main(String[] args) {
        FoodDAO fd = new FoodDAO();
        String a = "1";
        ArrayList<Food> ing = fd.searchFoodByName("co");
//        ArrayList<Food> f = fd.getNewFood();
//        HashMap<Integer, String> listFst = fd.getFoodStatus();
//        Food fing = fd.getFoodWithIngredients(a);
        for(Food fff : ing){
            
         System.out.println(fff);
        }

    }
}
