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
public class WeeklyMenuDetail {
    private int menuIdDetail;
    private int dow ;
    private int foodIdW;
    private int sessionId;

    public WeeklyMenuDetail() {
    }

    public WeeklyMenuDetail(int menuIdDetail, int dow, int foodIdW, int sessionId) {
        this.menuIdDetail = menuIdDetail;
        this.dow = dow;
        this.foodIdW = foodIdW;
        this.sessionId = sessionId;
    }

    public int getMenuIdDetail() {
        return menuIdDetail;
    }

    public void setMenuIdDetail(int menuIdDetail) {
        this.menuIdDetail = menuIdDetail;
    }

    public int getDow() {
        return dow;
    }

    public void setDow(int dow) {
        this.dow = dow;
    }

    public int getFoodIdW() {
        return foodIdW;
    }

    public void setFoodIdW(int foodIdW) {
        this.foodIdW = foodIdW;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    @Override
    public String toString() {
        return "WeeklyMenuDetail{" + "menuIdDetail=" + menuIdDetail + ", dow=" + dow + ", foodIdW=" + foodIdW + ", sessionId=" + sessionId + '}';
    }
    
}
