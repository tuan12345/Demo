/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import entity.Comment;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class CommentModel {
    public List<Comment> getAllComment() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Comment> listCm = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{ call Comment_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Comment cm = new Comment();
                cm.setUserID(rs.getInt("UserID"));
                cm.setProductID(rs.getString("ProductID"));
                cm.setComment(rs.getString("Comment"));
                cm.setCommentDate(rs.getDate("CommentDate"));
                cm.setStatus(rs.getBoolean("Status"));
                listCm.add(cm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listCm;
    }
    
    public boolean updateComment(int userID,String productID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Comment_Update(?,?) }");
            callSt.setInt(1, userID);
            callSt.setString(2,productID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public boolean deleteComment(int userID,String productID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Comment_Delete(?,?) }");
            callSt.setInt(1, userID);
            callSt.setString(2,productID);
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
