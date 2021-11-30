package servlet;

import DB.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@WebServlet("/CommodityGroupServlet")
public class CommodityGroupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");

        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();

        String sql = "select * from commodity_group";
        ArrayList<Map<String, String>> list = dbConnection.queryForList(sql);

        Set<String> set = new HashSet<>();
        for (Map<String, String> map : list) {
            set.add(map.get("name"));
        }

        PrintWriter printWriter = response.getWriter();

        if (!set.contains(name)) {
            sql = "insert commodity_group values(null, '" + name + "')";
            dbConnection.update(sql);

            printWriter.println("1 货品类别添加成功");
        } else {
            printWriter.println("0 货品类别已存在");
        }

        printWriter.close();
        dbConnection.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }
}
