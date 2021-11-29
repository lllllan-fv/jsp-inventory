package servlet;

import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String group = request.getParameter("group");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String principal = request.getParameter("principal");
        String telephone = request.getParameter("telephone");

        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();

        String sql = "";
        if (group.equals("仓库")) {
            sql = "insert address values(null, '" + group + "', '" + name + "', '" +
                    address + "', '" + principal + "', " + telephone + ");";
        } else {
            sql = "insert address values(null, '" + group + "', '" + name + "', '" +
                    address + "', null, null);";
        }

        dbConnection.update(sql);
        dbConnection.close();

        PrintWriter printWriter = response.getWriter();
        printWriter.print("success");
        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
