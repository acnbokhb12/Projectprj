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
public class WeeklyMenu {
    private int menuId ;
    private String menuName;
    private String menuImg;
    private float priceTotalWeek;
    private String des;
    private ArrayList<WeeklyMenuDetail> detailWeekMenu;

    public WeeklyMenu() {
        detailWeekMenu = new ArrayList<>();
      
    }
    public WeeklyMenu(int menuId, String menuName, String menuImg, ArrayList<WeeklyMenuDetail> detailWeekMenu) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.menuImg = menuImg;
        this.detailWeekMenu = detailWeekMenu;
        this.priceTotalWeek =priceTotalWeek;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuImg() {
        return menuImg;
    }

    public void setMenuImg(String menuImg) {
        this.menuImg = menuImg;
    }

    public float getPriceTotalWeek() {
        return priceTotalWeek;
    }

    public void setPriceTotalWeek(float priceTotalWeek) {
        this.priceTotalWeek = priceTotalWeek;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public ArrayList<WeeklyMenuDetail> getDetailWeekMenu() {
        return detailWeekMenu;
    }

    public void setDetailWeekMenu(ArrayList<WeeklyMenuDetail> detailWeekMenu) {
        this.detailWeekMenu = detailWeekMenu;
    }
    public boolean addWeeklyDetail (WeeklyMenuDetail weeklyDetail){
        return detailWeekMenu.add(weeklyDetail);
    }
    @Override
    public String toString() {
        return "WeeklyMenu{" + "menuId=" + menuId + ", menuName=" + menuName + ", menuImg=" + menuImg + ", priceTotalWeek=" + priceTotalWeek + ", detailWeekMenu=" + detailWeekMenu + '}';
    }
    
    
}
