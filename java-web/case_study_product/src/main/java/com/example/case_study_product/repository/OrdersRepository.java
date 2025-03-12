package com.example.case_study_product.repository;

import com.example.case_study_product.model.Orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdersRepository implements IOrdersRepository {
    private final static String SELECT_ALL = "select * from orders";
    private final static String EDIT = "update orders set user_name=?,orders_date=?,total_price=?,status=? where id=?";
    private final static String DELETE = "delete from orders where id=?";
    private final static String SEARCH = "select * from orders where  user_name like ?";
    @Override
    public List<Orders> getOrder() {
        Connection connection = BaseRepository.getConnectDB();
        List<Orders> ordersList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String userName = resultSet.getString("user_name");
                String orderDate = resultSet.getString("orders_date");
                double totalPrice = resultSet.getDouble("total_price");
                String status = resultSet.getString("status");
                Orders orders = new Orders(id,userName,orderDate,totalPrice,status);
                ordersList.add(orders);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ordersList;
    }

    @Override
    public boolean editOrder(int id, Orders orders) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setString(1,orders.getUserName());
            preparedStatement.setString(2,orders.getOrderDate());
            preparedStatement.setDouble(3,orders.getTotalPrice());
            preparedStatement.setString(4,orders.getStatus());
            preparedStatement.setInt(5,orders.getId());
            int row = preparedStatement.executeUpdate();
            return  row==1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteOrder(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            int row = preparedStatement.executeUpdate();
            return row==1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public List<Orders> searchOrders(String userName) {
        List<Orders> newOrder = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+userName+"%");
            ResultSet resultSet=  preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String nameUser=  resultSet.getString("user_name");
                String ordersDate = resultSet.getString("orders_date");
                double totalPrice = resultSet.getDouble("total_price");
                String status = resultSet.getString("status");
                Orders orders = new Orders(id,nameUser,ordersDate,totalPrice,status);
                newOrder.add(orders);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newOrder;
    }
}
