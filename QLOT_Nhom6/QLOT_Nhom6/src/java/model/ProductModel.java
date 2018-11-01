/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Product;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import util.ConnectionDB;

/**
 *
 * @author neo
 */
public class ProductModel {
    public List<Product> getAllProduct() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Product> listProduct = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Product_GetAll()}");
            ResultSet rs = callSt.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getString("ProductID"));
                pro.setProductName(rs.getString("ProductName"));
                pro.setContentDetail(rs.getString("ContentDetail"));
                pro.setImage(rs.getString("Image"));
                pro.setPriceImport(rs.getFloat("PriceImport"));
                pro.setPriceExport(rs.getFloat("PriceExport"));
                pro.setDiscount(rs.getInt("Discount"));
                pro.setFromDate(rs.getDate("FromDate"));
                pro.setToDate(rs.getDate("ToDate"));
                pro.setQuantity(rs.getInt("Quantity"));
                pro.setStatus(rs.getBoolean("Status"));
                pro.setCatalogID(rs.getInt("CatalogID"));
                pro.setNumberOfSeat(rs.getInt("NumberOfSeat"));
                pro.setCarType(rs.getBoolean("Cartype"));
                pro.setNumberView(rs.getInt("NumberView"));
                pro.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                pro.setPetrolTankCapacity(rs.getFloat("PetrolTankCapacity"));
                pro.setTimeSpeed100(rs.getFloat("TimeSpeed100"));
                listProduct.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return listProduct;
    }

    public Product getProductByID(String productID) {
        Connection conn = null;
        CallableStatement callSt = null;
        Product pro = new Product();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Product_GetByID(?)}");
            callSt.setString(1, productID);
            ResultSet rs = callSt.executeQuery();
            if (rs.next()) {
                pro.setProductID(rs.getString("ProductID"));
                pro.setProductName(rs.getString("ProductName"));
                pro.setContentDetail(rs.getString("ContentDetail"));
                pro.setImage(rs.getString("Image"));
                pro.setPriceImport(rs.getFloat("PriceImport"));
                pro.setPriceExport(rs.getFloat("PriceExport"));
                pro.setDiscount(rs.getInt("Discount"));
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String strFromDate = dateFormat.format(rs.getDate("FromDate"));
                java.sql.Date dateFrom = java.sql.Date.valueOf(strFromDate);
                pro.setFromDate(dateFrom);
                String strToDate = dateFormat.format(rs.getDate("ToDate"));
                java.sql.Date dateTo = java.sql.Date.valueOf(strFromDate);
                pro.setToDate(dateTo);
                pro.setQuantity(rs.getInt("Quantity"));
                pro.setStatus(rs.getBoolean("Status"));
                pro.setCatalogID(rs.getInt("CatalogID"));
                pro.setNumberOfSeat(rs.getInt("NumberOfSeat"));
                pro.setCarType(rs.getBoolean("Cartype"));
                pro.setNumberView(rs.getInt("NumberView"));
                pro.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                pro.setPetrolTankCapacity(rs.getFloat("PetrolTankCapacity"));
                pro.setTimeSpeed100(rs.getFloat("TimeSpeed100"));
            }
            //callSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return pro;
    }

    public boolean insertProduct(Product pro) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        
        try {

            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Product_Insert(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
            callSt.setString(1, pro.getProductID());
            callSt.setString(2, pro.getProductName());
            callSt.setString(3, pro.getContentDetail());
            callSt.setString(4, pro.getImage());
            callSt.setFloat(5, pro.getPriceImport());
            callSt.setFloat(6, pro.getPriceExport());
            callSt.setInt(7, pro.getDiscount());
            callSt.setDate(8, pro.getFromDate());
            callSt.setDate(9, pro.getToDate());
            callSt.setInt(10, pro.getQuantity());
            callSt.setBoolean(11, pro.isStatus());
            callSt.setInt(12, pro.getCatalogID());
            callSt.setInt(13, pro.getNumberOfSeat());
            callSt.setBoolean(14, pro.isCarType());
            callSt.setInt(15,pro.getNumberView());
            callSt.setInt(16, pro.getYearOfManufacture());
            callSt.setFloat(17, pro.getPetrolTankCapacity());
            callSt.setFloat(18, pro.getTimeSpeed100());
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean updateProduct(Product pro) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Product_Update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
            callSt.setString(1, pro.getProductID());
            callSt.setString(2, pro.getProductName());
            callSt.setString(3, pro.getContentDetail());
            callSt.setString(4, pro.getImage());
            callSt.setFloat(5, pro.getPriceImport());
            callSt.setFloat(6, pro.getPriceExport());
            callSt.setInt(7, pro.getDiscount());
            callSt.setDate(8, pro.getFromDate());
            callSt.setDate(9, pro.getToDate());
            callSt.setInt(10, pro.getQuantity());
            callSt.setBoolean(11, pro.isStatus());
            callSt.setInt(12, pro.getCatalogID());
            callSt.setInt(13, pro.getNumberOfSeat());
            callSt.setBoolean(14, pro.isCarType());
            callSt.setInt(15,pro.getNumberView());
            callSt.setInt(16, pro.getYearOfManufacture());
            callSt.setFloat(17, pro.getPetrolTankCapacity());
            callSt.setFloat(18, pro.getTimeSpeed100());

            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }

    public boolean deleteProduct(String productID) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean check = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call product_Delete(?) }");
            callSt.setString(1, productID);
            callSt.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return check;
    }
    
    public List<Product> TopViewProduct() {
        Connection conn = null;
        CallableStatement call = null;
        List<Product> listViewProduct = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            call = conn.prepareCall("{call Product_TopView()}");
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getString("ProductID"));
                pro.setProductName(rs.getString("ProductName"));
                pro.setContentDetail(rs.getString("ContentDetail"));
                pro.setImage(rs.getString("Image"));
                pro.setPriceImport(rs.getFloat("PriceImport"));
                pro.setPriceExport(rs.getFloat("PriceExport"));
                pro.setDiscount(rs.getInt("Discount"));
                pro.setCatalogID(rs.getInt("CatalogID"));
                pro.setFromDate(rs.getDate("FromDate"));
                pro.setToDate(rs.getDate("ToDate"));
                pro.setQuantity(rs.getInt("Quantity"));
                pro.setStatus(rs.getBoolean("Status"));
                pro.setNumberOfSeat(rs.getInt("NumberOfSeat"));
                pro.setCarType(rs.getBoolean("CarType"));
                pro.setNumberView(rs.getInt("NumberView"));
                pro.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                pro.setPetrolTankCapacity(rs.getFloat("PetrolTankCapacity"));
                pro.setTimeSpeed100(rs.getFloat("TimeSpeed100"));
                listViewProduct.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, call);
        }
        return listViewProduct;
    }
    
    public List<Product> TopNewProduct() {
        Connection conn = null;
        CallableStatement call = null;
        List<Product> listNewPro = new ArrayList<>();
        try {
            conn = ConnectionDB.openConnection();
            call = conn.prepareCall("{call Product_TopNew()}");
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getString("ProductID"));
                pro.setProductName(rs.getString("ProductName"));
                pro.setContentDetail(rs.getString("ContentDetail"));
                pro.setImage(rs.getString("Image"));
                pro.setPriceImport(rs.getFloat("PriceImport"));
                pro.setPriceExport(rs.getFloat("PriceExport"));
                pro.setDiscount(rs.getInt("Discount"));
                pro.setCatalogID(rs.getInt("CatalogID"));
                pro.setFromDate(rs.getDate("FromDate"));
                pro.setToDate(rs.getDate("ToDate"));
                pro.setQuantity(rs.getInt("Quantity"));
                pro.setStatus(rs.getBoolean("Status"));
                pro.setNumberOfSeat(rs.getInt("NumberOfSeat"));
                pro.setCarType(rs.getBoolean("CarType"));
                pro.setNumberView(rs.getInt("NumberView"));
                pro.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                pro.setPetrolTankCapacity(rs.getFloat("PetrolTankCapacity"));
                pro.setTimeSpeed100(rs.getFloat("TimeSpeed100"));
                listNewPro.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, call);
        }
        return listNewPro;
    }
    
    public List<Product> searchProduct(String searchByName) {
        Connection conn = null;
        CallableStatement call = null;
        List<Product> lstProductsearch = new ArrayList<Product>();
        try {
            conn = ConnectionDB.openConnection();
            call = conn.prepareCall("{ call  Product_searchByName(?)}");
            call.setString(1, searchByName);
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getString("ProductID"));
                pro.setProductName(rs.getString("ProductName"));
                pro.setContentDetail(rs.getString("ContentDetail"));
                pro.setImage(rs.getString("Image"));
                pro.setPriceImport(rs.getFloat("PriceImport"));
                pro.setPriceExport(rs.getFloat("PriceExport"));
                pro.setDiscount(rs.getInt("Discount"));
                pro.setCatalogID(rs.getInt("CatalogID"));
                pro.setFromDate(rs.getDate("FromDate"));
                pro.setToDate(rs.getDate("ToDate"));
                pro.setQuantity(rs.getInt("Quantity"));
                pro.setStatus(rs.getBoolean("Status"));
                pro.setNumberOfSeat(rs.getInt("NumberOfSeat"));
                pro.setCarType(rs.getBoolean("CarType"));
                pro.setNumberView(rs.getInt("NumberView"));
                pro.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                pro.setPetrolTankCapacity(rs.getFloat("PetrolTankCapacity"));
                pro.setTimeSpeed100(rs.getFloat("TimeSpeed100"));
                lstProductsearch.add(pro);
            }

        } catch (Exception e) {
        } finally {
            ConnectionDB.closeConnection(conn, call);
        }
        return lstProductsearch;
    }
    
    public List<Product> searchByName(String productName){
        Connection conn = null;
        CallableStatement callSt = null;
        List<Product> lstProductsearch = new ArrayList<Product>();
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Product_searchByName(?)}");
            callSt.setString(1, productName);
            ResultSet rs = callSt.executeQuery();
                while (rs.next()) {
                    Product pro = new Product();
                    pro.setProductID(rs.getString("ProductID"));
                    pro.setProductName(rs.getString("ProductName"));
                    pro.setContentDetail(rs.getString("ContentDetail"));
                    pro.setImage(rs.getString("Image"));
                    pro.setPriceImport(rs.getFloat("PriceImport"));
                    pro.setPriceExport(rs.getFloat("PriceExport"));
                    pro.setDiscount(rs.getInt("Discount"));
                    pro.setCatalogID(rs.getInt("CatalogID"));
                    pro.setFromDate(rs.getDate("FromDate"));
                    pro.setToDate(rs.getDate("ToDate"));
                    pro.setQuantity(rs.getInt("Quantity"));
                    pro.setStatus(rs.getBoolean("Status"));
                    pro.setNumberOfSeat(rs.getInt("NumberOfSeat"));
                    pro.setCarType(rs.getBoolean("CarType"));
                    pro.setNumberView(rs.getInt("NumberView"));
                    pro.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                    pro.setPetrolTankCapacity(rs.getFloat("PetrolTankCapacity"));
                    pro.setTimeSpeed100(rs.getFloat("TimeSpeed100"));
                    lstProductsearch.add(pro);
                }
        } catch (Exception e) {
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return lstProductsearch;
    }
    
    public void updateView(String productID){
        Connection conn = null;
        CallableStatement callSt = null;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call Product_InsertView(?)}");
            callSt.setString(1, productID);
            ResultSet rs = callSt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            ConnectionDB.closeConnection(conn, callSt);
        }
    }
}
