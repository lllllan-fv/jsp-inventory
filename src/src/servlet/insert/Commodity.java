package servlet.insert;

import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

@WebServlet("/insert/Commodity")
public class Commodity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String type = request.getParameter("type");
        String name = request.getParameter("name");

        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();

        String sql = "select * from commodity where name='" + name + "'";
        ArrayList<Map<String, String>> maps = dbConnection.queryForList(sql);

        PrintWriter printWriter = response.getWriter();
        if (maps.size() > 0) {
            String json = "{ \"status\": 0, \"message\": \"货品已存在\" }";
            printWriter.println(json);
        } else {
            sql = "insert commodity values(null, '" + type + "', '" + name + "')";
            dbConnection.update(sql);

            String json = "{ \"status\": 1, \"message\": \"添加成功\" }";
            printWriter.println(json);
        }

        printWriter.close();
        dbConnection.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
