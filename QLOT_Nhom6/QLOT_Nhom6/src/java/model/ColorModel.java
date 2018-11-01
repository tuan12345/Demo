/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Color;
import java.sql.*;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class ColorModel {

    public List<Color> getAllColor() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Color> listCl = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{ call Color_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Color cl = new Color();
                cl.setColorID(rs.getInt("ColorID"));
                cl.setColorName(rs.getString("ColorName"));
                cl.setStatus(rs.getBoolean("Status"));
                listCl.add(cl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listCl;
    }

    public Color getColorByID(int colorID) {
        Connection conn = null;
        CallableStatement callSt = null;
        Color cl = new Color();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Color_GetByID(?)}");
            callSt.setInt(1, colorID);
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                cl.setColorID(rs.getInt("ColorID"));
                cl.setColorName(rs.getString("ColorName"));
                cl.setStatus(rs.getBoolean("Status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return cl;
    }

    public boolean insertColor(Color cl) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Color_Insert(?,?)}");
            callSt.setString(1, cl.getColorName());
            callSt.setBoolean(2, cl.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public boolean updateColor(Color cl) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Color_Update(?,?,?)}");
            callSt.setInt(1, cl.getColorID());
            callSt.setString(2, cl.getColorName());
            callSt.setBoolean(3, cl.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public boolean deleteColor(int colorID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Color_delete(?)}");
            callSt.setInt(1, colorID);
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
