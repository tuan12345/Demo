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
public class Favorite {

    private int userID;
    private String productID;
    private String productName;
    private float priceExport;

    public Favorite() {
    }

    public Favorite(int userID, String productID, String productName, float priceExport) {
        this.userID = userID;
        this.productID = productID;
        this.productName = productName;
        this.priceExport = priceExport;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPriceExport() {
        return priceExport;
    }

    public void setPriceExport(float priceExport) {
        this.priceExport = priceExport;
    }

   

}
