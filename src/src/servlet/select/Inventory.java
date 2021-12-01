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

@WebServlet("/select/Inventory")
public class Inventory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter printWriter = response.getWriter();
        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();

        String sql = " select * from view_inventory";
        ArrayList<Map<String, String>> maps = dbConnection.queryForList(sql);

        boolean first = true;
        StringBuffer json = new StringBuffer("{ \"status\": 1, \"message\": \"玛卡巴卡\", \"code\": [");
        for (Map<String, String> map : maps) {
            if (!first) json.append(", ");
            first = false;

            json.append("{");
            boolean flag = false;
            for (Map.Entry<String, String> entry : map.entrySet()) {
                if (flag) json.append(", ");
                flag = true;

                json.append(" \"").append(entry.getKey()).append("\": \"").append(entry.getValue()).append("\"");
            }
            json.append("}");
        }
        json.append("] }");

        printWriter.println(json);

        printWriter.close();
        dbConnection.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
