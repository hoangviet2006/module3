package com.example.case_study_product.repository;

import com.example.case_study_product.dto.ProductDto;
import com.example.case_study_product.model.Accessory;
import com.example.case_study_product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDto> getAll();
    boolean addProduct(Product product);
    boolean editProduct(int id,Product product);
    boolean deleteProduct(int id);
    List<ProductDto> searchProduct(String model);
    List<Accessory> getAccessory();
}
