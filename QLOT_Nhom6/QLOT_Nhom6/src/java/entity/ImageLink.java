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
public class ImageLink {

    private int imageLinkID;
    private String productID;
    private String url_before;
    private String url_behind;
    private String url_left;
    private String url_right;
    private boolean status;
    

    public ImageLink() {
    }

    public ImageLink(int imageLinkID, String productID, String url_before, String url_behind, String url_left, String url_right, boolean status) {
        this.imageLinkID = imageLinkID;
        this.productID = productID;
        this.url_before = url_before;
        this.url_behind = url_behind;
        this.url_left = url_left;
        this.url_right = url_right;
        this.status = status;
    }

    public int getImageLinkID() {
        return imageLinkID;
    }

    public void setImageLinkID(int imageLinkID) {
        this.imageLinkID = imageLinkID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getUrl_before() {
        return url_before;
    }

    public void setUrl_before(String url_before) {
        this.url_before = url_before;
    }

    public String getUrl_behind() {
        return url_behind;
    }

    public void setUrl_behind(String url_behind) {
        this.url_behind = url_behind;
    }

    public String getUrl_left() {
        return url_left;
    }

    public void setUrl_left(String url_left) {
        this.url_left = url_left;
    }

    public String getUrl_right() {
        return url_right;
    }

    public void setUrl_right(String url_right) {
        this.url_right = url_right;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
