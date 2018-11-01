/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Catalog;
import java.sql.*;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class CatalogModel {

    public List<Catalog> getAllCatalog() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Catalog> listCatalog = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call GetAllCatalog()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Catalog ct = new Catalog();
                ct.setCatalogID(rs.getInt("CatalogID"));
                ct.setCatalogName(rs.getString("CatalogName"));
                ct.setDescription(rs.getString("Description"));
                ct.setStatus(rs.getBoolean("Status"));
                ct.setParentID(rs.getInt("ParentID"));
                ct.setImageLogo(rs.getString("Image"));
                listCatalog.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listCatalog;
    }

    public Catalog getCatalogByID(int catalogID) {
        Connection conn = null;
        CallableStatement callSt = null;
        Catalog cata = new Catalog();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Catalog_GetByID(?)}");
            callSt.setInt(1, catalogID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                cata.setCatalogID(rs.getInt("CatalogID"));
                cata.setCatalogName(rs.getString("CatalogName"));
                cata.setDescription(rs.getString("Description"));
                cata.setStatus(rs.getBoolean("Status"));
                cata.setParentID(rs.getInt("ParentID"));
                cata.setImageLogo(rs.getString("Image"));
            }
            //callSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return cata;
    }
    public List<Catalog> getCatalogByParentID(int parentID) {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Catalog> listCt = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call GetAllCatalogByParent(?) }");
            callSt.setInt(1, parentID);
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Catalog ct = new Catalog();
                ct.setCatalogID(rs.getInt("CatalogID"));
                ct.setCatalogName(rs.getString("CatalogName"));
                ct.setDescription(rs.getString("Description"));
                ct.setStatus(rs.getBoolean("Status"));
                ct.setParentID(rs.getInt("ParentID"));
                ct.setImageLogo(rs.getString("Image"));
                listCt.add(ct);
            }
            //callSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listCt;
    }

    public boolean insertCatalog(Catalog cata) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Catalog_Insert(?,?,?,?,?) }");
            //callSt.setInt(1, cata.getCatalogID());
            callSt.setString(1, cata.getCatalogName());
            callSt.setString(2, cata.getDescription());
            callSt.setBoolean(3, cata.isStatus());
            callSt.setInt(4, cata.getParentID());
            callSt.setString(5, cata.getImageLogo());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean updateCatalog(Catalog cata) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Catalog_Update(?,?,?,?,?,?) }");
            callSt.setInt(1, cata.getCatalogID());
            callSt.setString(2, cata.getCatalogName());
            callSt.setString(3, cata.getDescription());
            callSt.setBoolean(4, cata.isStatus());
            callSt.setInt(5, cata.getParentID());
            callSt.setString(6, cata.getImageLogo());

            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean deleteCatalog(int catalogID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Catalog_Delete(?) }");
            callSt.setInt(1, catalogID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
}