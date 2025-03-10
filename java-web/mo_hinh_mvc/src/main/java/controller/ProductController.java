package controller;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product", value = {"/product"})
public class ProductController extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
                break;
            case "edit":
                String checkId = req.getParameter("id");
                if (checkId != null) {
                    int id = Integer.parseInt(checkId);
                    Product product = productService.findById(id);
                    req.setAttribute("product", product);
                }
                req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
                break;
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                productService.deleteProduct(idDelete);
                req.setAttribute("list", productService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            default:
                List<Product> productList = productService.getAll();
                req.setAttribute("list", productList);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
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
                int id = productService.getAll().size();
                System.out.println(id);
                String code = req.getParameter("code");
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                int amount = Integer.parseInt(req.getParameter("amount"));
                String description = req.getParameter("description");
                String status = req.getParameter("status");
                Product product = new Product(id, code, name, price, amount, description, status);
                productService.addProduct(product);
                resp.sendRedirect("/product");
                break;
            case "edit":
                int editId = Integer.parseInt(req.getParameter("id"));
                String editCode = req.getParameter("code");
                String editName = req.getParameter("name");
                double editPrice = Double.parseDouble(req.getParameter("price"));
                int editAmount = Integer.parseInt(req.getParameter("amount"));
                String editDescription = req.getParameter("description");
                String editStatus = req.getParameter("status");
                Product product1 = new Product(editId, editCode, editName, editPrice, editAmount, editDescription, editStatus);
                productService.editProduct(editId, product1);
                req.setAttribute("list", productService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "search":
                String searchName =req.getParameter("name");
                List<Product> productList = productService.searchProduct(searchName);
                req.setAttribute("list",productList);
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            default:
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }
}
