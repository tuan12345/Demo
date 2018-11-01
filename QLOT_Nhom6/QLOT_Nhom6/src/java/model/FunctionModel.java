/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Function;
import java.sql.*;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class FunctionModel {
    public List<Function> getAllFunction() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Function> listFunction = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Function_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Function fc = new Function();
                fc.setFunctionID(rs.getInt("FunctionID"));
                fc.setFunctionName(rs.getString("FunctionName"));
                fc.setStatus(rs.getBoolean("Status"));
                listFunction.add(fc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listFunction;
    }

    public Function getFunctionByID(int functionID) {
        Connection conn = null;
        CallableStatement callSt = null;
        Function fc = new Function();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Function_GetByID(?) }");
            callSt.setInt(1, functionID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                fc.setFunctionID(rs.getInt("FunctionID"));
                fc.setFunctionName(rs.getString("FunctionName"));
                fc.setStatus(rs.getBoolean("Status"));
            }
            //callSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return fc;
    }
    

    public boolean insertFunction(Function fc) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Function_Insert(?,?) }");
            callSt.setString(1, fc.getFunctionName());
            callSt.setBoolean(2, fc.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean updateFunction(Function fc) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Function_Update(?,?,?) }");
            callSt.setInt(1, fc.getFunctionID());
            callSt.setString(2, fc.getFunctionName());
            callSt.setBoolean(3, fc.isStatus());

            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean deleteFunction(int functionID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Function_Delete(?) }");
            callSt.setInt(1, functionID);
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
