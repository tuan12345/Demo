/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author neo
 */
public class PaymentBank {

    private String merchantName;
    private String accNo;
    private String accName;
    private float paymentAmount;

    public PaymentBank() {
    }

    public PaymentBank(String merchantName, String accNo, String accName, float paymentAmount) {
        this.merchantName = merchantName;
        this.accNo = accNo;
        this.accName = accName;
        this.paymentAmount = paymentAmount;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getAccNo() {
        return accNo;
    }

    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public float getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(float paymentAmount) {
        this.paymentAmount = paymentAmount;
    }
}
