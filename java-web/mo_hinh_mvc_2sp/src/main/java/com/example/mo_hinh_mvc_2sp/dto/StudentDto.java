package com.example.mo_hinh_mvc_2sp.dto;

public class StudentDto {
    private  int stt;
    private  int id;
    private String name;
    private String class_name;

    public StudentDto(int stt, int id, String name, String class_name) {
        this.stt = stt;
        this.id = id;
        this.name = name;
        this.class_name = class_name;
    }

    public StudentDto() {
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
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

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }
}
