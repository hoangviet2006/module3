import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculator", value = {"/chiet-khau"})
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int gia=Integer.parseInt(req.getParameter("gia"));
        int chietkhau = Integer.parseInt(req.getParameter("chietkhau"));

        double ti_le_chiet_khau = gia * chietkhau * 0.01;
        String str= req.getParameter("mota");
        req.setAttribute("ti_le_chiet_khau", ti_le_chiet_khau);
        req.setAttribute("mota",str);
        req.getRequestDispatcher("/hienthi.jsp").forward(req,resp);
        req.getRequestDispatcher("/hienthi.jsp").forward(req,resp);
    }
}
