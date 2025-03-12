package com.example.case_study_product.service;

import com.example.case_study_product.model.Orders;

import java.util.List;

public interface IOrderService {
    List<Orders> getOrder();
    boolean editOrder(int id,Orders orders);
    boolean deleteOrder(int id);
    List<Orders> searchOrders(String userName);
    Orders findById(int id);
}
