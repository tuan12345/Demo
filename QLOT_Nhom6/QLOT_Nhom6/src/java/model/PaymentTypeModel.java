/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.PaymentType;
import java.sql.*;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class PaymentTypeModel {

    public List<PaymentType> getAllPaymentType() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<PaymentType> listPm = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{ call PaymentType_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                PaymentType pm = new PaymentType();
                pm.setPaymentTypeID(rs.getInt("PaymentTypeID"));
                pm.setPaymentTypeName(rs.getString("PaymentTypeName"));
                pm.setDescription(rs.getString("Description"));
                pm.setStatus(rs.getBoolean("Status"));
                listPm.add(pm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listPm;
    }

    public PaymentType getPaymentTypeByID(int paymentTypeID) {
        Connection conn = null;
        CallableStatement callSt = null;
        PaymentType pm = new PaymentType();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call PaymentType_GetByID(?)}");
            callSt.setInt(1, paymentTypeID);
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                pm.setPaymentTypeID(rs.getInt("PaymentTypeID"));
                pm.setPaymentTypeName(rs.getString("PaymentTypeName"));
                pm.setDescription(rs.getString("Description"));
                pm.setStatus(rs.getBoolean("Status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return pm;
    }

    public boolean insertPaymentType(PaymentType pm) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call PaymentType_Insert(?,?,?)}");
            callSt.setString(1, pm.getPaymentTypeName());
            callSt.setString(2, pm.getDescription());
            callSt.setBoolean(3, pm.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean updatePaymentType(PaymentType pm) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call PaymentType_Update(?,?,?,?)}");
            callSt.setInt(1, pm.getPaymentTypeID());
            callSt.setString(2, pm.getPaymentTypeName());
            callSt.setString(3, pm.getDescription());
            callSt.setBoolean(4, pm.isStatus());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean deletePaymentType(int paymentID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call PaymentType_delete(?)}");
            callSt.setInt(1, paymentID);
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
