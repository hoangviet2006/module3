package com.example.case_study_product.model;

public class Accessory {
    private  int id;
    private  String name;

    public Accessory() {
    }

    public Accessory(String name) {
        this.name = name;
    }

    public Accessory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
