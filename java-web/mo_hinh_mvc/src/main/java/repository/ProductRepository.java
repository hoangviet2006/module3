package repository;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final static String SELECT_ALL = "select * from product";
    private final static String ADD_NEW = "insert into product (`code`, `name`, price, amount, `description`, `status`) value(?,?,?,?,?,?)";
    private final static String UPDATE = "update product set code=?, name=?, price=?, amount=?, description=?, status=? WHERE id=?";
    private final static String DELETE = "delete from product where id=?";
    private final static String SEARCH = "SELECT * FROM product WHERE name LIKE ?";

    @Override
    public List<Product> getAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("code");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int amount = resultSet.getInt("amount");
                String description = resultSet.getString("description");
                String status = resultSet.getString("status");
                Product product = new Product(id, code, name, price, amount, description, status);
                products.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    @Override
    public boolean addProduct(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, product.getCode());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getAmount());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getStatus());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean editProduct(int id, Product product) {
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, product.getCode());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getAmount());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getStatus());
            preparedStatement.setInt(7, product.getId());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("lỗi");
        }
        return false;
    }

    @Override
    public List<Product> searchProduct(String name) {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("code");
                String name1 = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int amount = resultSet.getInt("amount");
                String description = resultSet.getString("description");
                String status = resultSet.getString("status");
                Product product = new Product(id, code, name1, price, amount, description, status);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public Product findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Product product = null;
        try {
            String query = "SELECT * FROM product WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String code = resultSet.getString("code");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int amount = resultSet.getInt("amount");
                String description = resultSet.getString("description");
                String status = resultSet.getString("status");
                product = new Product(id, code, name, price, amount, description, status);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

}
