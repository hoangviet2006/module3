package com.example.case_study_product.service;

import com.example.case_study_product.model.Orders;
import com.example.case_study_product.repository.BaseRepository;
import com.example.case_study_product.repository.IOrdersRepository;
import com.example.case_study_product.repository.OrdersRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService implements IOrderService {
    IOrdersRepository ordersRepository = new OrdersRepository();
    @Override
    public List<Orders> getOrder() {
        return ordersRepository.getOrder();
    }

    @Override
    public boolean editOrder(int id, Orders orders) {
       Orders orders1 = findById(id);
       if (orders1!=null){
           ordersRepository.editOrder(id,orders);
           return true;
       }
       return false;
    }

    @Override
    public boolean deleteOrder(int id) {
        return ordersRepository.deleteOrder(id);
    }

    @Override
    public List<Orders> searchOrders(String userName) {
        return ordersRepository.searchOrders(userName);
    }

    @Override
    public Orders findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Orders orders= null;
        String query = "select * from orders where id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int findId = resultSet.getInt("id");
                String userName =resultSet.getString("user_name");
                String ordersDate  = resultSet.getString("orders_date");
                double totalPrice = resultSet.getDouble("total_price");
                String status = resultSet.getString("status");
                orders=new Orders(findId,userName,ordersDate,totalPrice,status);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }
}
