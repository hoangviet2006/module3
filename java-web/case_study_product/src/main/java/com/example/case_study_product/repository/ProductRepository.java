package com.example.case_study_product.repository;

import com.example.case_study_product.dto.ProductDto;
import com.example.case_study_product.model.Accessory;
import com.example.case_study_product.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final static String SELECT_ALL = "select product.id,product. `code`,product.brand, product.model,product.price,product.release_date,product.description,accessory.`name` from product left join accessory on product.id_accessory=accessory.id";
    private final static String ADD_NEW = "insert into product (`code`, brand,model,price,release_date,description,id_accessory) value(?,?,?,?,?,?,?)";
    private final static String EDIT = "update product set  `code`=?, brand=?,model=?,price=?,release_date=?,description=?,id_accessory=? WHERE id=?";
    private final static String DELETE = "delete from product where id=?";
    private final static String SEARCH = "SELECT p.*, a.name FROM product p LEFT JOIN accessory a ON p.id_accessory = a.id WHERE p.model LIKE ?";

    @Override
    public List<ProductDto> getAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<ProductDto> productDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("code");
                String brand = resultSet.getString("brand");
                String model = resultSet.getString("model");
                double price = resultSet.getDouble("price");
                String releaseDate = resultSet.getString("release_date");
                String description = resultSet.getString("description");
                String nameAccessory = resultSet.getString("name");
                ProductDto productDto = new ProductDto(id,code,brand,model,price,releaseDate,description,nameAccessory);
                productDtoList.add(productDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDtoList;
    }

    @Override
    public boolean addProduct(Product product) {
       Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, product.getCode());
            preparedStatement.setString(2, product.getBrand());
            preparedStatement.setString(3, product.getModel());
            preparedStatement.setDouble(4,product.getPrice());
            preparedStatement.setString(5,product.getReleaseDate());
            preparedStatement.setString(6,product.getDescription());
            preparedStatement.setInt(7,product.getId_accessory());
            int row = preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean editProduct(int id, Product product) {
            Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(EDIT);
            preparedStatement.setString(1,product.getCode());
            preparedStatement.setString(2,product.getBrand());
            preparedStatement.setString(3,product.getModel());
            preparedStatement.setDouble(4,product.getPrice());
            preparedStatement.setString(5,product.getReleaseDate());
            preparedStatement.setString(6,product.getDescription());
            preparedStatement.setInt(7,product.getId_accessory());
            preparedStatement.setInt(8,product.getId());
            int row=preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            int row =preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public List<ProductDto> searchProduct(String model) {
        List<ProductDto> newProduct = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement  =connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + model + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idSearch = resultSet.getInt("id");
                String codeSearch = resultSet.getString("code");
                String brandSearch = resultSet.getString("brand");
                String modelSearch = resultSet.getString("model");
                double priceSearch = resultSet.getDouble("price");
                String releaseDateSearch = resultSet.getString("release_date");
                String descriptionSearch = resultSet.getString("description");
                int idAccessorySearch = resultSet.getInt("id_accessory");
                String nameAccessorySearch = resultSet.getString("name");
                ProductDto productDto = new ProductDto(idSearch,codeSearch,brandSearch,modelSearch,priceSearch,releaseDateSearch,descriptionSearch,idAccessorySearch,nameAccessorySearch);
                newProduct.add(productDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newProduct;
    }

    @Override
    public List<Accessory> getAccessory() {
        String SELECT_ACCESSORY = "select * from accessory";
        List<Accessory> accessoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement  = connection.prepareStatement(SELECT_ACCESSORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Accessory accessory = new Accessory(id,name);
                accessoryList.add(accessory);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accessoryList;
    }
}
