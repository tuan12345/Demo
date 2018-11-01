/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author neo
 */
public class Payment {
    private int paymentID;
    private int orderID;
    private Date created;
    private boolean status;
    private int paymentTypeID;

    public Payment() {
    }

    public Payment(int paymentID, int orderID, Date created, boolean status, int paymentTypeID) {
        this.paymentID = paymentID;
        this.orderID = orderID;
        this.created = created;
        this.status = status;
        this.paymentTypeID = paymentTypeID;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getPaymentTypeID() {
        return paymentTypeID;
    }

    public void setPaymentTypeID(int paymentTypeID) {
        this.paymentTypeID = paymentTypeID;
    }
    
}
