package com.example.mo_hinh_mvc_2sp.model;

public class Student {
    private  int stt;
    private  int id;
    private String name;

    public Student() {
    }


    public Student(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Student(int stt, int id, String name) {
        this.stt = stt;
        this.id = id;
        this.name = name;
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
}
