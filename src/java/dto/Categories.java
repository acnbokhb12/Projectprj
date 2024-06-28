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
public class Categories {
    private int categoriesId;
    private String categoriesImg;
    private String categoriesName;

    public Categories() {
        categoriesId = 0;
        categoriesImg="";
        categoriesName="";
    }

    public Categories(int categoriesId, String categoriesImg, String categoiresName) {
        this.categoriesId = categoriesId;
        this.categoriesImg = categoriesImg;
        this.categoriesName = categoiresName;
    }

    public int getCategoriesId() {
        return categoriesId;
    }

    public void setCategoriesId(int categoriesId) {
        this.categoriesId = categoriesId;
    }

    public String getCategoriesImg() {
        return categoriesImg;
    }

    public void setCategoriesImg(String categoriesImg) {
        this.categoriesImg = categoriesImg;
    }

    public String getCategoriesName() {
        return categoriesName;
    }

    public void setCategoriesName(String categoriesName) {
        this.categoriesName = categoriesName;
    }

    @Override
    public String toString() {
        return "Categories{" + "categoriesId=" + categoriesId + ", categoriesImg=" + categoriesImg + ", categoiresName=" + categoriesName + '}';
    }

   
    
    
    
    
    
}
