package controller;

import model.ImportedGoods;
import service.ImportedGoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ImportedGoods", value = {"/import"})
public class ImportedGoodsController extends HttpServlet {
    ImportedGoodsService importedGoodsService = new ImportedGoodsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/import_goods/create.jsp").forward(req, resp);
                break;
            case "delete":
                String id1 = req.getParameter("id");
                if (id1 != null) {
                    int idDelete = Integer.parseInt(id1);
                    importedGoodsService.delete(idDelete);
                }
                req.setAttribute("list", importedGoodsService.getAll());
                req.getRequestDispatcher("/view/import_goods/list.jsp").forward(req,resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                ImportedGoods importedGoods = importedGoodsService.findById(id);
                req.setAttribute("importedGoods",importedGoods);
                req.getRequestDispatcher("/view/import_goods/edit.jsp").forward(req, resp);
                break;
            default:
                req.setAttribute("list", importedGoodsService.getAll());
                req.getRequestDispatcher("/view/import_goods/list.jsp").forward(req, resp);
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
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                ImportedGoods importedGoods = new ImportedGoods(id, name, price);
                importedGoodsService.add(importedGoods);
                req.setAttribute("list", importedGoodsService.getAll());
                req.getRequestDispatcher("/view/import_goods/list.jsp").forward(req, resp);
                break;
            case "delete":
//             String id1 = req.getParameter("id");
//                if (id1 != null) {
//                    int idDelete = Integer.parseInt(id1);
//                    importedGoodsService.delete(idDelete);
//                }
//                req.setAttribute("list", importedGoodsService.getAll());
//                req.getRequestDispatcher("list.jsp").forward(req,resp);
                 break;
            case "edit":
                int idSp= Integer.parseInt(req.getParameter("id"));
                String newName = req.getParameter("name");
                double newPrice = Double.parseDouble(req.getParameter("price"));
                ImportedGoods importedGoods1 = new ImportedGoods(idSp,newName, newPrice);
                String id2=req.getParameter("id");
                if (id2!=null){
                    int idEdit=Integer.parseInt(id2);
                    importedGoodsService.edit(idEdit,importedGoods1);
                }
                req.setAttribute("list", importedGoodsService.getAll());
                req.getRequestDispatcher("/view/import_goods/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list", importedGoodsService.getAll());
                req.getRequestDispatcher("/view/import_goods/list.jsp").forward(req, resp);
        }
    }
}
