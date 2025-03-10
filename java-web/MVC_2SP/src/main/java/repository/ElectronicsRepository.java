package repository;

import model.Electronics;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static jdk.javadoc.internal.doclets.formats.html.markup.HtmlStyle.details;

public class ElectronicsRepository implements IElectronicsRepository {
    private final static String SELECT_ALL = "select Product.id,Product.`name`,Product.`price`,details.information from Product left join details on product.id= details.product_id";
    private final static String ADD_NEW = "insert into product ( `name`, price) value(?,?)";
    private final static String EDIT = "update product set  `name`=?, price=? WHERE id=?";
    private final static String DELETE = "delete from product where id=?";
    private final static String SEARCH = "SELECT * FROM product WHERE `name` LIKE ?";

    @Override
        public List<Product> getElectronics() {
            Connection connection = BaseRepository.getConnectDB();
            List<Product> productList = new ArrayList<>();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    double price = resultSet.getDouble("price");
                    String information = resultSet.getString("information");
                    Product product = new Product(id, name, price,information);
                    productList.add(product);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return productList;
        }

    @Override
    public boolean addElectronics(Electronics electronics) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, electronics.getName());
            preparedStatement.setDouble(2, electronics.getPrice());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public boolean editElectronics(int id, Electronics electronics) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setString(1, electronics.getName());
            preparedStatement.setDouble(2, electronics.getPrice());
            preparedStatement.setInt(3, electronics.getId());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteElectronics(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            return row == 1;

        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public List<Product> searchElectronics(String name) {
        List<Product> electronicsList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int searchId = resultSet.getInt("id");
                String searchName = resultSet.getString("name");
                double searchPrice = resultSet.getDouble("price");
                String informationSearch = resultSet.getString("information");
                Product electronics = new Product(searchId,searchName,searchPrice,informationSearch);
                electronicsList.add(electronics);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return electronicsList;
    }

    @Override
    public Electronics findById(int id) {
            Connection connection = BaseRepository.getConnectDB();
            Electronics electronics = null;
            String query  = "select * from product where id = ?";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1,id);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    int idProduct = resultSet.getInt("id");
                    String nameProduct = resultSet.getString("name");
                    double priceProduct = resultSet.getDouble("price");
                    electronics=new Electronics(idProduct,nameProduct,priceProduct);
                    break;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return electronics;
    }
}
