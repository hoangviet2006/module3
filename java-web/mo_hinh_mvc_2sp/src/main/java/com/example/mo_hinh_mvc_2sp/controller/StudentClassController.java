package com.example.mo_hinh_mvc_2sp.controller;

import com.example.mo_hinh_mvc_2sp.model.Student;
import com.example.mo_hinh_mvc_2sp.dto.StudentDto;
import com.example.mo_hinh_mvc_2sp.repository.StudentClassRepository;
import com.example.mo_hinh_mvc_2sp.service.StudentClassService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Student", value = {"/student"})
public class StudentClassController extends HttpServlet {
    StudentClassService studentClassService = new StudentClassService();
    StudentClassRepository studentClassRepository = new StudentClassRepository();

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
                String checkStt = req.getParameter("stt");
                if (checkStt != null) {
                    int stt = Integer.parseInt(checkStt);
                    StudentDto studentClass = studentClassRepository.findById(stt);
                    req.setAttribute("studentClass", studentClass);
                }
                req.getRequestDispatcher("/view/update.jsp").forward(req, resp);
                break;
            case "delete":
                String check = req.getParameter("stt");
                if (check!=null){
                    int stt = Integer.parseInt(check);
                    studentClassRepository.deleteStudent(stt);
                }
                req.setAttribute("list", studentClassService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            default:
                req.setAttribute("list", studentClassService.getAll());
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
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                Student student = new Student(id,name);
                studentClassService.addStudent(student);
                resp.sendRedirect("/student");
                break;
            case "update":
                int sttEdit = Integer.parseInt(req.getParameter("stt"));
                int idEdit = Integer.parseInt(req.getParameter("id"));
                String nameEdit = req.getParameter("name");
                Student student1 = new Student(sttEdit, idEdit, nameEdit);
                studentClassService.updateStudent(sttEdit, student1);
                req.setAttribute("list", studentClassService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "search":
                String nameSearch= req.getParameter("name");
                List<StudentDto> list = studentClassService.searchStudent(nameSearch);
                req.setAttribute("list",list);
                req.getRequestDispatcher("/view/list.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("list", studentClassService.getAll());
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }
}
