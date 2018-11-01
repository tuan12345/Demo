
package entity;

import java.sql.Date;


public class Product {
    private String productID;
    private String productName;
    private String contentDetail;
    private String image;
    private float priceImport;
    private float priceExport;
    private int discount;
    private Date fromDate;
    private Date toDate;
    private int quantity;
    private boolean status;
    private int catalogID;
    private int numberOfSeat;
    private boolean carType;
    private int numberView;
    private int yearOfManufacture;
    private float petrolTankCapacity;
    private float timeSpeed100;

    public Product() {
    }

    public Product(String productID, String productName, String contentDetail, String image, float priceImport, float priceExport, int discount, Date fromDate, Date toDate, int quantity, boolean status, int catalogID, int numberOfSeat, boolean carType, int numberView, int yearOfManufacture, float petrolTankCapacity, float timeSpeed100) {
        this.productID = productID;
        this.productName = productName;
        this.contentDetail = contentDetail;
        this.image = image;
        this.priceImport = priceImport;
        this.priceExport = priceExport;
        this.discount = discount;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.quantity = quantity;
        this.status = status;
        this.catalogID = catalogID;
        this.numberOfSeat = numberOfSeat;
        this.carType = carType;
        this.numberView = numberView;
        this.yearOfManufacture = yearOfManufacture;
        this.petrolTankCapacity = petrolTankCapacity;
        this.timeSpeed100 = timeSpeed100;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getContentDetail() {
        return contentDetail;
    }

    public void setContentDetail(String contentDetail) {
        this.contentDetail = contentDetail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPriceImport() {
        return priceImport;
    }

    public void setPriceImport(float priceImport) {
        this.priceImport = priceImport;
    }

    public float getPriceExport() {
        return priceExport;
    }

    public void setPriceExport(float priceExport) {
        this.priceExport = priceExport;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCatalogID() {
        return catalogID;
    }

    public void setCatalogID(int catalogID) {
        this.catalogID = catalogID;
    }

    public int getNumberOfSeat() {
        return numberOfSeat;
    }

    public void setNumberOfSeat(int numberOfSeat) {
        this.numberOfSeat = numberOfSeat;
    }

    public boolean isCarType() {
        return carType;
    }

    public void setCarType(boolean carType) {
        this.carType = carType;
    }

    public int getNumberView() {
        return numberView;
    }

    public void setNumberView(int numberView) {
        this.numberView = numberView;
    }

    public int getYearOfManufacture() {
        return yearOfManufacture;
    }

    public void setYearOfManufacture(int yearOfManufacture) {
        this.yearOfManufacture = yearOfManufacture;
    }

    public float getPetrolTankCapacity() {
        return petrolTankCapacity;
    }

    public void setPetrolTankCapacity(float petrolTankCapacity) {
        this.petrolTankCapacity = petrolTankCapacity;
    }

    public float getTimeSpeed100() {
        return timeSpeed100;
    }

    public void setTimeSpeed100(float timeSpeed100) {
        this.timeSpeed100 = timeSpeed100;
    }

}
