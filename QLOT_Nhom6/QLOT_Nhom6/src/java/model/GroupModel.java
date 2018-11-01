/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Function;
import entity.Group;
import entity.Group_Function;
import java.sql.*;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class GroupModel {

   public List<Group> getAllGroup() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Group> listGr = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Group gr = new Group();
                gr.setGroupID(rs.getInt("GroupID"));
                gr.setGroupName(rs.getString("GroupName"));
                gr.setStatus(rs.getBoolean("Status"));
                listGr.add(gr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listGr;
    }
   
   public List<Group_Function> getFunctionByGroupID( int groupID) {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Group_Function> listGf = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_GetFunctionByGroupID(?)}");
            callSt.setInt(1, groupID);
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Group_Function gf = new Group_Function();
                gf.setGroupID(rs.getInt("GroupID"));
                gf.setFunctionID(rs.getInt("FunctionID"));
                gf.setStatus(rs.getBoolean("Status"));
                listGf.add(gf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listGf;
    }

    public Group getGroupByID(int groupID) {
        Connection conn = null;
        CallableStatement callSt = null;
        Group gr = new Group();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_GetByID(?) }");
            callSt.setInt(1, groupID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                gr.setGroupID(rs.getInt("GroupID"));
                gr.setGroupName(rs.getString("GroupName"));
                gr.setStatus(rs.getBoolean("Status"));
            }
            //callSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return gr;
    }

    public boolean insertGroup(Group gr) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_Insert(?,?) }");
            callSt.setString(1, gr.getGroupName());
            callSt.setBoolean(2, gr.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    public boolean insertFunctionInGroup(Group_Function gf) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_Function_Insert(?.?,?) }");
            callSt.setInt(1,gf.getGroupID() );
            callSt.setInt(2, gf.getFunctionID());
            callSt.setBoolean(3, gf.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean updateGroup(Group gr) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_Update(?,?,?) }");
            callSt.setInt(1, gr.getGroupID());
            callSt.setString(2, gr.getGroupName());
            callSt.setBoolean(3, gr.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean deleteGroup(int groupID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_Delete(?) }");
            callSt.setInt(1, groupID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    } 
    public boolean deleteFunctionInGroup(int groupID,int functionID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Group_DeleteFunctionInGroup(?,?) }");
            callSt.setInt(1, groupID);
            callSt.setInt(2, functionID);
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
