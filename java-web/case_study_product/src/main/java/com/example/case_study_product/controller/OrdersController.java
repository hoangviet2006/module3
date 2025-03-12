package com.example.case_study_product.controller;

import com.example.case_study_product.dto.ProductDto;
import com.example.case_study_product.model.Accessory;
import com.example.case_study_product.model.Orders;
import com.example.case_study_product.model.Product;
import com.example.case_study_product.service.IOrderService;
import com.example.case_study_product.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "orders", value = {"/order"})
public class OrdersController extends HttpServlet {
    IOrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                String idCheck = req.getParameter("id");
                if (idCheck != null) {
                    int id = Integer.parseInt(idCheck);
                    Orders orders = orderService.findById(id);
                    req.setAttribute("findOrder", orders);
                }
                req.getRequestDispatcher("/view/updateOrder.jsp").forward(req, resp);
                break;
            case "delete":
                String check = req.getParameter("id");
                if (check != null) {
                    int id = Integer.parseInt(check);
                    orderService.deleteOrder(id);
                }
                req.setAttribute("order", orderService.getOrder());
                req.getRequestDispatcher("/view/order.jsp").forward(req, resp);
                break;
            default:
                req.setAttribute("order", orderService.getOrder());
                req.getRequestDispatcher("/view/order.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                String userName = req.getParameter("user_name");
                String ordersDate = req.getParameter("orders_date");
                double totalPrice = Double.parseDouble(req.getParameter("total_price"));
                String status = req.getParameter("status");
                Orders orders = new Orders(id, userName, ordersDate, totalPrice, status);
                orderService.editOrder(id, orders);
                req.setAttribute("order", orderService.getOrder());
                req.getRequestDispatcher("/view/order.jsp").forward(req, resp);
                break;
            case "search":
                String userNameSearch = req.getParameter("user_name");
                List<Orders> ordersList = orderService.searchOrders(userNameSearch);
                req.setAttribute("order",ordersList);
                req.getRequestDispatcher("/view/order.jsp").forward(req,resp);
                break;
            default:

        }
    }
}
