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
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@WebServlet("/insert/Address")
public class Address extends HttpServlet {

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
        sql = "select * from address where name='" + name + "' and type='" + group + "'";

        Set<String> set = new HashSet<>();
        ArrayList<Map<String, String>> maps = dbConnection.queryForList(sql);

        PrintWriter printWriter = response.getWriter();
        if (maps.size() > 0) {
            String json = "{ \"status\": 0, \"message\": " + group + "\"已存在\"}";
            printWriter.print(json);
        } else {
            if (group.equals("仓库")) {
                sql = "insert address values(null, '" + group + "', '" + name + "', '" +
                        address + "', '" + principal + "', " + telephone + ");";
            } else {
                sql = "insert address values(null, '" + group + "', '" + name + "', '" +
                        address + "', null, null);";
            }

            dbConnection.update(sql);
            String json = "{ \"status\": 1, \"message\": \"地址添加成功\"}";
            printWriter.print(json);
        }

        printWriter.close();
        dbConnection.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
