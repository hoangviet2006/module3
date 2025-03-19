package com.example.bai_lam_them.model;

public class Pig {
    private int id;
    private String codePig;
    private String importedDate;
    private double importedWeight;
    private String exportedDate;
    private double exportedWeight;
    private String status;
    private int idOrigin;

    public Pig() {
    }

    public Pig(int id, String codePig, String importedDate, double importedWeight, String exportedDate, double exportedWeight, String status, int idOrigin) {
        this.id = id;
        this.codePig = codePig;
        this.importedDate = importedDate;
        this.importedWeight = importedWeight;
        this.exportedDate = exportedDate;
        this.exportedWeight = exportedWeight;
        this.status = status;
        this.idOrigin = idOrigin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodePig() {
        return codePig;
    }

    public void setCodePig(String codePig) {
        this.codePig = codePig;
    }

    public String getImportedDate() {
        return importedDate;
    }

    public void setImportedDate(String importedDate) {
        this.importedDate = importedDate;
    }

    public double getImportedWeight() {
        return importedWeight;
    }

    public void setImportedWeight(double importedWeight) {
        this.importedWeight = importedWeight;
    }

    public String getExportedDate() {
        return exportedDate;
    }

    public void setExportedDate(String exportedDate) {
        this.exportedDate = exportedDate;
    }

    public double getExportedWeight() {
        return exportedWeight;
    }

    public void setExportedWeight(double exportedWeight) {
        this.exportedWeight = exportedWeight;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIdOrigin() {
        return idOrigin;
    }

    public void setIdOrigin(int idOrigin) {
        this.idOrigin = idOrigin;
    }
}
