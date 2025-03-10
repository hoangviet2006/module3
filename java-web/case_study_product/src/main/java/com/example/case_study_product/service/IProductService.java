package com.example.case_study_product.service;

import com.example.case_study_product.dto.ProductDto;
import com.example.case_study_product.model.Accessory;
import com.example.case_study_product.model.Product;

import java.util.List;

public interface IProductService {
    List<ProductDto> getAll();

    boolean addProduct(Product product);

    boolean editProduct(int id, Product product);

    boolean deleteProduct(int id);

    List<ProductDto> searchProduct(String model);

    Product findById(int id);
    List<Accessory> getAccessory();
}
