package entity;

import java.sql.Date;


public class Order {
    private int orderID;
    private String orderName;
    private int orderNumber;
    private Date created;
    private Date paymentDate;
    private float totalAmount;
    private int userID;
    private String phone;
    private String email;
    private String address;
    private boolean status;

    public Order() {
    }

    public Order(int orderID, String orderName, int orderNumber, Date created, Date paymentDate, float totalAmount, int userID, String phone, String email, String address, boolean status) {
        this.orderID = orderID;
        this.orderName = orderName;
        this.orderNumber = orderNumber;
        this.created = created;
        this.paymentDate = paymentDate;
        this.totalAmount = totalAmount;
        this.userID = userID;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
