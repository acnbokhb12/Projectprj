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
public class Ingredient {
    private int foodId;
    private int ingredientId;
    private String ingredientImg;
    private String ingredientName;
    private float ingredientQuantity;
    private String ingredientUnit;
    private float ingredientPrice;

    public Ingredient() {
        foodId= 0;
        ingredientId =0;
        ingredientImg ="";
        ingredientName="";
        ingredientQuantity =0;
        ingredientUnit = "";
        ingredientPrice=0;
    }

    public Ingredient(int foodId, int ingredientId, String ingredientImg, String ingredientName, float ingredientQuantity, String ingredientUnit, float ingredientPrice) {
        this.foodId = foodId;
        this.ingredientId = ingredientId;
        this.ingredientImg = ingredientImg;
        this.ingredientName = ingredientName;
        this.ingredientQuantity = ingredientQuantity;
        this.ingredientUnit = ingredientUnit;
        this.ingredientPrice = ingredientPrice;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public int getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId) {
        this.ingredientId = ingredientId;
    }

    public String getIngredientImg() {
        return ingredientImg;
    }

    public void setIngredientImg(String ingredientImg) {
        this.ingredientImg = ingredientImg;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public float getIngredientQuantity() {
        return ingredientQuantity;
    }

    public void setIngredientQuantity(float ingredientQuantity) {
        this.ingredientQuantity = ingredientQuantity;
    }

    public String getIngredientUnit() {
        return ingredientUnit;
    }

    public void setIngredientUnit(String ingredientUnit) {
        this.ingredientUnit = ingredientUnit;
    }

    public float getIngredientPrice() {
        return ingredientPrice;
    }

    public void setIngredientPrice(float ingredientPrice) {
        this.ingredientPrice = ingredientPrice;
    }

    @Override
    public String toString() {
        return "Ingredient{" + "foodId=" + foodId + ", ingredientId=" + ingredientId + ", ingredientImg=" + ingredientImg + ", ingredientName=" + ingredientName + ", ingredientQuantity=" + ingredientQuantity + ", ingredientUnit=" + ingredientUnit + ", ingredientPrice=" + ingredientPrice + '}';
    }
    
    
}
