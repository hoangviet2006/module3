package com.example.case_study_product.controller;

import com.example.case_study_product.dto.ProductDto;
import com.example.case_study_product.model.Accessory;
import com.example.case_study_product.model.Product;
import com.example.case_study_product.service.IProductService;
import com.example.case_study_product.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product",value = {"/admin"})
public class ProductController extends HttpServlet {
    IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                List<Accessory> accessoryList = productService.getAccessory();
                req.setAttribute("accessoryList",accessoryList);
                req.getRequestDispatcher("/view/create.jsp").forward(req,resp);
                break;
            case "update":
                String checkId = req.getParameter("id");
                if (checkId!=null){
                    int id  = Integer.parseInt(checkId);
                    Product product = productService.findById(id);
                    req.setAttribute("product",product);
                }
                req.getRequestDispatcher("/view/update.jsp").forward(req,resp);
                break;
            case "delete":
               String check=req.getParameter("id");
               if (check!=null){
                   int id =Integer.parseInt(check);
                   productService.deleteProduct(id);
               }
               req.setAttribute("list",productService.getAll());
               req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list",productService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String code = req.getParameter("code");
                String brand = req.getParameter("brand");
                String model = req.getParameter("model");
                double  price = Double.parseDouble(req.getParameter("price"));
                String release_date = req.getParameter("release_date");
                String description = req.getParameter("description");
                int id_accessory = Integer.parseInt(req.getParameter("id_accessory"));
                Product product = new Product(code,brand,model,price,release_date,description,id_accessory);
                productService.addProduct(product);
                resp.sendRedirect("/admin");
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                String codeUpdate = req.getParameter("code");
                String brandUpdate = req.getParameter("brand");
                String modelUpdate = req.getParameter("model");
                double  priceUpdate = Double.parseDouble(req.getParameter("price"));
                String release_dateUpdate = req.getParameter("release_date");
                String descriptionUpdate = req.getParameter("description");
                int id_accessoryUpdate = Integer.parseInt(req.getParameter("id_accessory"));
                Product product1 = new Product(idUpdate,codeUpdate,brandUpdate,modelUpdate,priceUpdate,release_dateUpdate,descriptionUpdate,id_accessoryUpdate);
                productService.editProduct(idUpdate,product1);
                req.setAttribute("list",productService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            case "search":
                String modelSearch =req.getParameter("model");
                List<ProductDto> productDtoList = productService.searchProduct(modelSearch);
                req.setAttribute("list",productDtoList);
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list",productService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
        }
    }
}
