package com.bam.beans;

public class Merchant {
    private int merchantId;
    private String storeName;
    private String kep;
    private String iban;
    private String mersisNo;
    private int taxIdentificationNumberId;
    private String eMail;
    private String password;
    private String phoneNumber;
    private boolean authorization;

    public Merchant(int merchantId, String storeName, String kep, String iban, String mersisNo,
            int taxIdentificationNumberId, String eMail, String password, String phoneNumber, boolean authorization) {
        this.merchantId = merchantId;
        this.storeName = storeName;
        this.kep = kep;
        this.iban = iban;
        this.mersisNo = mersisNo;
        this.taxIdentificationNumberId = taxIdentificationNumberId;
        this.eMail = eMail;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.authorization = authorization;
    }

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getKep() {
        return kep;
    }

    public void setKep(String kep) {
        this.kep = kep;
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public String getMersisNo() {
        return mersisNo;
    }

    public void setMersisNo(String mersisNo) {
        this.mersisNo = mersisNo;
    }

    public int getTaxIdentificationNumberId() {
        return taxIdentificationNumberId;
    }

    public void setTaxIdentificationNumberId(int taxIdentificationNumberId) {
        this.taxIdentificationNumberId = taxIdentificationNumberId;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isAuthorization() {
        return authorization;
    }

    public void setAuthorization(boolean authorization) {
        this.authorization = authorization;
    }

}
