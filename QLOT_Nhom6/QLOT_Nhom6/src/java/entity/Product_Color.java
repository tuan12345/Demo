/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author neo
 */
public class Product_Color {
    private String procductID;
    private int colorID;

    public Product_Color() {
    }

    public Product_Color(String procductID, int colorID) {
        this.procductID = procductID;
        this.colorID = colorID;
    }

    public String getProcductID() {
        return procductID;
    }

    public void setProcductID(String procductID) {
        this.procductID = procductID;
    }

    public int getColorID() {
        return colorID;
    }

    public void setColorID(int colorID) {
        this.colorID = colorID;
    }
    
}
