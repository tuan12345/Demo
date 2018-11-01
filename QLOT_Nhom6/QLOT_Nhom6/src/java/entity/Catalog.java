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
public class Catalog {

    private int catalogID;
    private String catalogName;
    private String description;
    private boolean status;
    private int parentID;
    private String imageLogo;

    public Catalog() {
    }

    public Catalog(int catalogID, String catalogName, String description, boolean status, int parentID, String imageLogo) {
        this.catalogID = catalogID;
        this.catalogName = catalogName;
        this.description = description;
        this.status = status;
        this.parentID = parentID;
        this.imageLogo = imageLogo;
    }

    public int getCatalogID() {
        return catalogID;
    }

    public void setCatalogID(int catalogID) {
        this.catalogID = catalogID;
    }

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

    public String getImageLogo() {
        return imageLogo;
    }

    public void setImageLogo(String imageLogo) {
        this.imageLogo = imageLogo;
    }
    
    
}
