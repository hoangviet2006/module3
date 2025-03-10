package com.example.case_study_product.service;

import com.example.case_study_product.dto.ProductDto;
import com.example.case_study_product.model.Accessory;
import com.example.case_study_product.model.Product;
import com.example.case_study_product.repository.BaseRepository;
import com.example.case_study_product.repository.ProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    ProductRepository productRepository = new ProductRepository();
    @Override
    public List<ProductDto> getAll() {
        return productRepository.getAll();
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    @Override
    public boolean editProduct(int id, Product product) {
            Product product1 = findById(id);
            if (product1!=null){
                productRepository.editProduct(id,product);
                return true;

            }
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

    @Override
    public List<ProductDto> searchProduct(String model) {
        return productRepository.searchProduct(model);
    }

    @Override
    public Product findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Product product = null;
        String query  = "select * from product where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int findId = resultSet.getInt("id");
                String code = resultSet.getString("code");
                String brand = resultSet.getString("brand");
                String model = resultSet.getString("model");
                double price = resultSet.getDouble("price");
                String releaseDate = resultSet.getString("release_date");
                String description = resultSet.getString("description");
                int idAccessory = resultSet.getInt("id_accessory");
                product = new Product(findId,code,brand,model,price,releaseDate,description,idAccessory);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            return product;
    }

    @Override
    public List<Accessory> getAccessory() {
        return productRepository.getAccessory();
    }
}
