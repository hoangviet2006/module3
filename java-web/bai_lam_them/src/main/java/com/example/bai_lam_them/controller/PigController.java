package com.example.bai_lam_them.controller;

import com.example.bai_lam_them.dto.PigDto;
import com.example.bai_lam_them.model.Origin;
import com.example.bai_lam_them.model.Pig;
import com.example.bai_lam_them.service.IPigService;
import com.example.bai_lam_them.service.PigService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Pig", value = {"/pig"})
public class PigController extends HttpServlet {
    IPigService pigService = new PigService();

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
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                Pig pigDto = pigService.findById(id);
                req.setAttribute("pigDto", pigDto);
                req.getRequestDispatcher("/view/update.jsp").forward(req, resp);
                break;
            case "delete":
                String check = req.getParameter("id");
                if (check != null) {
                    int idDelete = Integer.parseInt(check);
                    pigService.deletePig(idDelete);
                    req.setAttribute("list", pigService.getPig());
                }
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "searchName":
                List<Origin> origin = pigService.findName();
                req.setAttribute("nameOrigin", origin);
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list", pigService.getPig());
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
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                String code = req.getParameter("code_pig");
                String importDate = req.getParameter("imported_date");
                double importWeight = Double.parseDouble(req.getParameter("imported_weight"));
                String exportDate = req.getParameter("exported_date");
                double exportWeight = Double.parseDouble(req.getParameter("exported_weight"));
                String status = req.getParameter("status");
                int id_origin = Integer.parseInt(req.getParameter("id_origin"));
                Pig pigDto = new Pig(id, code, importDate, importWeight, exportDate, exportWeight, status, id_origin);
                pigService.editPig(id, pigDto);
                req.setAttribute("list", pigService.getPig());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "searchCode":
                String codeSearch = req.getParameter("code");
                List<PigDto> list = pigService.searchCode(codeSearch);
                req.setAttribute("list", list);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "searchName":
                String statusSearch = req.getParameter("name");
                List<PigDto> pigDtoList = pigService.searchOrigin(statusSearch);
                req.setAttribute("list", pigDtoList);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
//                String nameSearch = req.getParameter("name");
//                List<Origin> origins = pigService.searchOrigin(nameSearch);
//                req.setAttribute("status", pigDtoList);
//                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
//                break;

            default:
                req.setAttribute("list", pigService.getPig());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }

    }
}
