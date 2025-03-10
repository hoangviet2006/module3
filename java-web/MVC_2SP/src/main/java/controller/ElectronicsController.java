package controller;

import model.Electronics;
import model.Product;
import repository.ElectronicsRepository;
import service.ElectronicsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Electronics", value = {"/product"})
public class ElectronicsController extends HttpServlet {
    ElectronicsService electronicsService = new ElectronicsService();
    ElectronicsRepository electronicsRepository = new ElectronicsRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
                break;
            case "edit":
                String idCheck = req.getParameter("id");
                if (idCheck != null) {
                    int id = Integer.parseInt(idCheck);
                    Electronics electronics = electronicsRepository.findById(id);
                    req.setAttribute("electronics", electronics);
                }
                req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
                break;
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                electronicsService.deleteElectronics(idDelete);
                req.setAttribute("list", electronicsService.getElectronics());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            default:
                List<Product> productList = electronicsService.getElectronics();
                req.setAttribute("list",productList);
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
            case "add":
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                Electronics electronics = new Electronics(id, name, price);
                electronicsService.addElectronics(electronics);
                resp.sendRedirect("/product");
                break;
            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                String nameEdit = req.getParameter("name");
                double priceEdit = Double.parseDouble(req.getParameter("price"));
                Electronics electronics1 = new Electronics(idEdit, nameEdit, priceEdit);
                electronicsService.editElectronics(idEdit, electronics1);
                req.setAttribute("list", electronicsService.getElectronics());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "search":
                String nameSearch = req.getParameter("name");
                List<Product> electronicsList = electronicsService.searchElectronics(nameSearch);
                req.setAttribute("list", electronicsList);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            default:
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }

    }
}
