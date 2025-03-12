package com.example.case_study_product.repository;

import com.example.case_study_product.model.Orders;

import java.util.List;

public interface IOrdersRepository {
    List<Orders> getOrder();
    boolean editOrder(int id,Orders orders);
    boolean deleteOrder(int id);
    List<Orders> searchOrders(String userName);
}
