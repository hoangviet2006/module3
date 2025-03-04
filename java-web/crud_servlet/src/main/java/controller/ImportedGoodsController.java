package controller;

import model.ImportedGoods;
import service.ImportedGoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ImportedGoods", value = {"/import"})
public class ImportedGoodsController extends HttpServlet {
    ImportedGoodsService importedGoodsService = new ImportedGoodsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("getAll",importedGoodsService.getAll());
        req.getRequestDispatcher("view.jsp").forward(req,resp);
    }

}
