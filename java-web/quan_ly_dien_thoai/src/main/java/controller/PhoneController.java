package controller;

import model.Phone;
import service.PhoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Phone", value = {"/phone"})
public class PhoneController extends HttpServlet {
    PhoneService phoneService = new PhoneService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                editForm(req, resp);
                break;
            case "delete":
                deleteForm(req, resp);
                break;
            default:
                showPhone(req, resp);
        }
    }

    private void showPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Phone> list = phoneService.getPhone();
        req.setAttribute("list", list);
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void deleteForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id1 = req.getParameter("id");
        if (id1 != null) {
            int idDelete = Integer.parseInt(id1);
            phoneService.deletePhone(idDelete);
        }
        req.setAttribute("list", phoneService.getPhone());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void editForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Phone phone = phoneService.findById(id);
        req.setAttribute("phones", phone);
        req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
                createPhone(req, resp);
                break;
            case "edit":
                editPhone(req, resp);
                break;
            case "search":
                searchPhone(req, resp);
                break;
            default:
                showListForm(req, resp);
        }
    }

    private void searchPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameSearch = req.getParameter("id");
        List<Phone> phoneList = phoneService.searchPhone(nameSearch);
        req.setAttribute("list", phoneList);
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void editPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newName = req.getParameter("name");
        double newPrice = Double.parseDouble(req.getParameter("price"));
        String newType = req.getParameter("type");
        int id1 = Integer.parseInt(req.getParameter("id"));
        Phone phone1 = new Phone(id1,newName, newPrice, newType);
        String id = req.getParameter("id");
        if (id != null) {
            int idDelete = Integer.parseInt(id);
            phoneService.editPhone(idDelete, phone1);
        }
        req.setAttribute("list", phoneService.getPhone());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }

    private void createPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int newId = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String type = req.getParameter("type");
        Phone phone = new Phone(newId, name, price, type);
        phoneService.addPhone(phone);
        resp.sendRedirect("/phone");
    }

    private void showListForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", phoneService.getPhone());
        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }
}
