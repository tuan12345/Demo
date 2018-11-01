package model;

import entity.Favorite;
import entity.User;
import java.sql.*;
import java.util.*;
import util.ConnectionDB;
import java.text.SimpleDateFormat;

public class UserModel {

    public List<User> getAllUser() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<User> listUs = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                User us = new User();
                us.setUserID(rs.getInt("UserID"));
                us.setUserName(rs.getString("UserName"));
                us.setPassword(rs.getString("Password"));
                us.setPhone(rs.getString("Phone"));
                us.setEmail(rs.getString("Email"));
                us.setAddress(rs.getString("Address"));
                us.setGender(rs.getBoolean("Gender"));
                us.setBirthday(rs.getDate("Birthday"));
                us.setUserType(rs.getString("UserType"));
                us.setGroupID(rs.getInt("GroupID"));
                listUs.add(us);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listUs;
    }

    public List<Favorite> getFavoriteByID(int userID) {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Favorite> listFa = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_Favorite(?) }");
            callSt.setInt(1, userID);
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Favorite fa = new Favorite();
                fa.setUserID(rs.getInt("UserID"));
                fa.setProductID(rs.getString("ProductID"));
                fa.setProductName(rs.getString("ProductName"));
                fa.setPriceExport(rs.getFloat("PriceExport"));
                listFa.add(fa);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listFa;
    }
    
    public User getUserByName(String userName) {
        Connection conn = null;
        CallableStatement callSt = null;
        User us = new User();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_GetByName(?) }");
            callSt.setString(1, userName);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                us.setUserID(rs.getInt("UserID"));
                us.setUserName(rs.getString("UserName"));
                us.setPassword(rs.getString("Password"));
                us.setPhone(rs.getString("Phone"));
                us.setEmail(rs.getString("Email"));
                us.setAddress(rs.getString("Address"));
                us.setGender(rs.getBoolean("Gender"));
                us.setBirthday(rs.getDate("Birthday"));
                us.setUserType(rs.getString("UserType"));
                us.setGroupID(rs.getInt("GroupID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return us;
    }
    
    public User getUserByID(int userID) {
        Connection conn = null;
        CallableStatement callSt = null;
        User us = new User();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_GetByID(?) }");
            callSt.setInt(1, userID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                us.setUserID(rs.getInt("UserID"));
                us.setUserName(rs.getString("UserName"));
                us.setPassword(rs.getString("Password"));
                us.setPhone(rs.getString("Phone"));
                us.setEmail(rs.getString("Email"));
                us.setAddress(rs.getString("Address"));
                us.setGender(rs.getBoolean("Gender"));
                us.setBirthday(rs.getDate("Birthday"));
                us.setUserType(rs.getString("UserType"));
                us.setGroupID(rs.getInt("GroupID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return us;
    }

    public boolean insertUser(String userName, String password, String phone, String email, String address, boolean gender, String birthday) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_Signup(?,?,?,?,?,?,?}");
            callSt.setString(1, userName);
            callSt.setString(2, password);
            callSt.setString(3, phone);
            callSt.setString(4, email);
            callSt.setString(5, address);
            callSt.setBoolean(6, gender);
            callSt.setDate(7, convertFromDateToSQLDate(birthday));
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public boolean checkLoginAdmin(String name, String pass){
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_CheckLogin_Admin(?,?) }");
            callSt.setString(1, name);
            callSt.setString(2, pass);
            ResultSet rs = callSt.executeQuery();
            int count = 0;
             while (rs.next()) {
                count++;

            }
            if (count == 1) {
                check = true;
            }
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
    
    public boolean checkSignup(String userName, String email){
        Connection conn = null;
        CallableStatement callSt = null;
        boolean returnCheck = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_CheckSignup(?,?,?)}");
            callSt.setString(1, userName);
            callSt.setString(2, email);
            callSt.registerOutParameter(3, Types.BOOLEAN);
            callSt.execute();
            returnCheck = callSt.getBoolean(3);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return returnCheck;
    }

    public boolean insertUser(User us) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;

        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_Insert(?,?,?,?,?,?,?,?,?) }");
            callSt.setString(1, us.getUserName());
            callSt.setString(2, us.getPassword());
            callSt.setString(3, us.getPhone());
            callSt.setString(4, us.getEmail());
            callSt.setString(5, us.getAddress());
            callSt.setBoolean(6, us.isGender());
            callSt.setDate(7, us.getBirthday());
            callSt.setString(8, us.getUserType());
            callSt.setInt(9, us.getGroupID());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean updateUser(User us) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_Update(?,?,?,?,?,?,?,?,?,?) }");
            callSt.setInt(1, us.getUserID());
            callSt.setString(2, us.getUserName());
            callSt.setString(3, us.getPassword());
            callSt.setString(4, us.getPhone());
            callSt.setString(5, us.getEmail());
            callSt.setString(6, us.getAddress());
            callSt.setBoolean(7, us.isGender());
            callSt.setDate(8, us.getBirthday());
            callSt.setString(9, us.getUserType());
            callSt.setInt(10, us.getGroupID());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean deleteUser(int userID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_Delete(?) }");
            callSt.setInt(1, userID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean checkLogin(String userName, String password) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean returnCheck = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call User_checkLogin(?,?,?)}");
            callSt.setString(1, userName);
            callSt.setString(2, password);
            callSt.registerOutParameter(3, Types.BOOLEAN);
            callSt.execute();
            returnCheck = callSt.getBoolean(3);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return returnCheck;
    }
    
}
