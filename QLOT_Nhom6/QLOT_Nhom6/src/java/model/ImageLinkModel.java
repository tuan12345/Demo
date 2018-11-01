/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.ImageLink;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class ImageLinkModel {
    
    public List<ImageLink> getAllImageLink() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<ImageLink> listIl = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call ImageLink_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                ImageLink il = new ImageLink();
                il.setImageLinkID(rs.getInt("ImageLinkID"));
                il.setProductID(rs.getString("ProductID"));
                il.setUrl_before(rs.getString("URL_before"));
                il.setUrl_behind(rs.getString("URL_behind"));
                il.setUrl_left(rs.getString("URL_left"));
                il.setUrl_right(rs.getString("URL_right"));
                il.setStatus(rs.getBoolean("Status"));
                listIl.add(il);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listIl;
    }

    public ImageLink getImageLinkByID(int imageLinkID) {
        Connection conn = null;
        CallableStatement callSt = null;
        ImageLink il = new ImageLink();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call ImageLink_GetByID(?) }");
            callSt.setInt(1, imageLinkID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                il.setImageLinkID(rs.getInt("ImageLinkID"));
                il.setProductID(rs.getString("ProductID"));
                il.setUrl_before(rs.getString("URL_before"));
                il.setUrl_behind(rs.getString("URL_behind"));
                il.setUrl_left(rs.getString("URL_left"));
                il.setUrl_right(rs.getString("URL_right"));
                il.setStatus(rs.getBoolean("Status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return il;
    }
    
    public boolean insertImageLink(ImageLink imagelink) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Imagelink_Insert(?,?,?,?,?,?) }");
            //callSt.setInt(1, cata.getCatalogID());
            callSt.setString(1, imagelink.getProductID());
            callSt.setString(2, imagelink.getUrl_before());
            callSt.setString(3, imagelink.getUrl_behind());
            callSt.setString(4, imagelink.getUrl_left());
            callSt.setString(5, imagelink.getUrl_right());
            callSt.setBoolean(6, imagelink.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public boolean updateImageLink(ImageLink imagelink) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Imagelink_Update(?,?,?,?,?,?,?) }");
            callSt.setInt(1, imagelink.getImageLinkID());
            callSt.setString(2, imagelink.getProductID());
            callSt.setString(3, imagelink.getUrl_before());
            callSt.setString(4, imagelink.getUrl_behind());
            callSt.setString(5, imagelink.getUrl_left());
            callSt.setString(6, imagelink.getUrl_right());
            callSt.setBoolean(7, imagelink.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public boolean deleteImageLink(int imagelinkID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Imagelink_Delete(?) }");
            callSt.setInt(1, imagelinkID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public ImageLink getImageByID(String productID) {
        Connection conn = null;
        CallableStatement callSt = null;
        ImageLink iml = new ImageLink();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Imagelink_GetByProductID(?)}");
            callSt.setString(1, productID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
               iml.setUrl_before(rs.getString("URL_before"));
               iml.setUrl_behind(rs.getString("URL_behind"));
               iml.setUrl_left(rs.getString("URL_left"));
               iml.setUrl_right(rs.getString("URL_right"));
            }
            //callSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return iml;
    }

}
