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
public class FoodStatus {
    private int idFoodStatus;
    private String nameFoodStatus;

    public FoodStatus() {
    }

    public FoodStatus(int idFoodStatus, String nameFoodStatus) {
        this.idFoodStatus = idFoodStatus;
        this.nameFoodStatus = nameFoodStatus;
    }

    public int getIdFoodStatus() {
        return idFoodStatus;
    }

    public void setIdFoodStatus(int idFoodStatus) {
        this.idFoodStatus = idFoodStatus;
    }

    public String getNameFoodStatus() {
        return nameFoodStatus;
    }

    public void setNameFoodStatus(String nameFoodStatus) {
        this.nameFoodStatus = nameFoodStatus;
    }

    @Override
    public String toString() {
        return "FoodStatus{" + "idFoodStatus=" + idFoodStatus + ", nameFoodStatus=" + nameFoodStatus + '}';
    }
    
    
}
