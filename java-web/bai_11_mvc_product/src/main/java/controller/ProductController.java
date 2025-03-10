package controller;

import model.Product;
import repository.ProductRepository;
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
                ListProduct(req,resp);
                break;
            case "edit":
                formEdit(req, resp);
                break;
            case "delete":
                formDelete(req, resp);
                break;
            default:
                showProduct(req, resp);
        }
    }

    private void formDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String checkId = req.getParameter("id");
        if (checkId != null) {
            int idDelete = Integer.parseInt(checkId);
            productService.deleteProduct(idDelete);
        }
        req.setAttribute("list",productService.getProduct());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void formEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);

    }

    private void ListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            case "search":
                searchProduct(req, resp);
                break;
            default:
                showProduct(req, resp);
        }
    }

    private void showProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", productService.getProduct());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameSearch = req.getParameter("nameSearch");
        List<Product> searchList = productService.searchProduct(nameSearch);
        req.setAttribute("list", searchList);
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String description = req.getParameter("description");
        int id1 = Integer.parseInt(req.getParameter("id"));
        Product productEdit = new Product(id1, name, price, quantity, description);
        String idEdit = req.getParameter("id");
        if (idEdit != null) {
            int id = Integer.parseInt(idEdit);
            productService.editProduct(id, productEdit);
        }
        req.setAttribute("list", productService.getProduct());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int newId = productService.getProduct().size();
        String newName = req.getParameter("name");
        double newPrice = Double.parseDouble(req.getParameter("price"));
        int newQuantity = Integer.parseInt(req.getParameter("quantity"));
        String newDescription = req.getParameter("description");
        Product product = new Product(newId+1, newName, newPrice, newQuantity, newDescription);
        productService.addProduct(product);
        resp.sendRedirect("/product");
    }
}
