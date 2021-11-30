package servlet.select;

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

@WebServlet("/select/CommodityGroup")
public class CommodityGroup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();
        String sql = "select * from commodity_group";
        ArrayList<Map<String, String>> maps = dbConnection.queryForList(sql);
        dbConnection.close();

        boolean first = true;
        StringBuffer json = new StringBuffer("{ \"status\": 1, \"code\": [");
        for (Map<String, String> map : maps) {
            if (!first) json.append(",");
            first = false;
            json.append("{");
            json.append("\"id\":").append(map.get("id")).append(", ");
            json.append("\"name\": \"").append(map.get("name")).append("\"");
            json.append("}");
        }
        json.append("] }");

        PrintWriter printWriter = response.getWriter();
        printWriter.println(json);
        printWriter.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
