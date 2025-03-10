package com.example.case_study_product.model;

import java.time.LocalDate;

public class Product {
    private int id;
    private String code;
    private String brand;
    private String model;
    private double price;
    private String releaseDate;
    private String description;
    private int id_accessory;

    public Product() {
    }

    public Product(int id, String code, String brand, String model, double price, String releaseDate, String description, int id_accessory) {
        this.id = id;
        this.code = code;
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.releaseDate = releaseDate;
        this.description = description;
        this.id_accessory = id_accessory;
    }

    public Product(String code, String brand, String model, double price, String releaseDate, String description, int id_accessory) {
        this.code = code;
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.releaseDate = releaseDate;
        this.description = description;
        this.id_accessory = id_accessory;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId_accessory() {
        return id_accessory;
    }

    public void setId_accessory(int id_accessory) {
        this.id_accessory = id_accessory;
    }
}
