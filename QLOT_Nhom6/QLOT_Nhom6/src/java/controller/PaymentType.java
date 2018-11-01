/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.*;

/**
 *
 * @author neo
 */
public class PaymentType {
    private int paymentTypeID;
    private String paymentTypeName;
    private String description;
    private boolean status;

    public PaymentType() {
    }

    public PaymentType(int paymentTypeID, String paymentTypeName, String description, boolean status) {
        this.paymentTypeID = paymentTypeID;
        this.paymentTypeName = paymentTypeName;
        this.description = description;
        this.status = status;
    }

    public int getPaymentTypeID() {
        return paymentTypeID;
    }

    public void setPaymentTypeID(int paymentTypeID) {
        this.paymentTypeID = paymentTypeID;
    }

    public String getPaymentTypeName() {
        return paymentTypeName;
    }

    public void setPaymentTypeName(String paymentTypeName) {
        this.paymentTypeName = paymentTypeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
