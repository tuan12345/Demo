
package model;

import entity.Order;
import entity.Order_Detail;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import util.ConnectionDB;


public class OrderModel {

    public List<Order> getAllOrder() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Order> listOd = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Order_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Order od = new Order();
                od.setOrderID(rs.getInt("OrderID"));
                od.setOrderName(rs.getString("OrderName"));
                od.setOrderNumber(rs.getInt("OrderNumber"));
                od.setCreated(rs.getDate("Created"));
                od.setPaymentDate(rs.getDate("PaymentDate"));
                od.setTotalAmount(rs.getFloat("TotalAmount"));
                od.setUserID(rs.getInt("UserID"));
                od.setPhone(rs.getString("Phone"));
                od.setEmail(rs.getString("Email"));
                od.setAddress(rs.getString("Address"));
                od.setStatus(rs.getBoolean("Status"));
                listOd.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listOd;
    }

    public List<Order_Detail> getAllOrder_Detail(int orderID) {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Order_Detail> listOd_Dt = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Order_DetailByID(?)}");
            callSt.setInt(1, orderID);
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Order_Detail od_dt = new Order_Detail();
                od_dt.setOrderID(rs.getInt("OrderID"));
                od_dt.setProductID(rs.getString("ProductID"));
                od_dt.setProductName(rs.getString("ProductName"));
                od_dt.setAmount(rs.getFloat("Amount"));
                od_dt.setQuantity(rs.getInt("Quantity"));
                od_dt.setStatus(rs.getBoolean("Status"));
                listOd_Dt.add(od_dt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listOd_Dt;
    }
    
    public boolean updateOrder(int orderID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Order_Update_Status(?) }");
            callSt.setInt(1, orderID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    } 
    
    
    
    public static java.sql.Date convertFromDateToSQLDate(String dateSt) {
        java.sql.Date sql = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy");
            java.util.Date parsed = format.parse(dateSt);
            sql = new java.sql.Date(parsed.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

}
