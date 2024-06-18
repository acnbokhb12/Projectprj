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
public class Food {
    private int foodId;
    private String image;
    private String name;
    private String description;
    private String recipe;
    private float price;
    private int fStatusId;
    private ArrayList<Categories> categories;

    public Food() {
        foodId =0;
        image="";
        name="";
        description="";
        recipe="";
        price=0;
        fStatusId=0;
    }

    public Food(int foodId, String image, String name, String description, String recipe, float price, int fStatusId) {
        this.foodId = foodId;
        this.image = image;
        this.name = name;
        this.description = description;
        this.recipe = recipe;
        this.price = price;
        this.fStatusId = fStatusId;
        this.categories = new ArrayList<>();
    }
 

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRecipe() {
        return recipe;
    }

    public void setRecipe(String recipe) {
        this.recipe = recipe;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getfStatusId() {
        return fStatusId;
    }

    public void setfStatusId(int fStatusId) {
        this.fStatusId = fStatusId;
    }

    public ArrayList<Categories> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<Categories> categories) {
        this.categories = categories;
    }

    @Override
    public String toString() {
        return "Food{" + "foodId=" + foodId + ", image=" + image + ", name=" + name + ", description=" + description + ", recipe=" + recipe + ", price=" + price + ", fStatusId=" + fStatusId + ", categories=" + categories + '}';
    }
    
    
    
    
    
    
}
