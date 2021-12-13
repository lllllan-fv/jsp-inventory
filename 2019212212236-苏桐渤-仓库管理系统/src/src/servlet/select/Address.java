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

@WebServlet("/select/Address")
public class Address extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter printWriter = response.getWriter();
        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();

        String sql = "select * from address";
        ArrayList<Map<String, String>> maps = dbConnection.queryForList(sql);

        boolean first = true;
        StringBuffer json = new StringBuffer("{");
        json.append(" \"status\": 1, \"message\": \"歪匕八卜\", \"code\": [");
        for (Map<String, String> map : maps) {
            if (!first) json.append(", ");
            first = false;

            json.append("{");
            json.append(" \"id\": ").append(map.get("id"));
            json.append(", \"type\": \"").append(map.get("type")).append("\"");
            json.append(", \"name\": \"").append(map.get("name")).append("\"");
            json.append(", \"address\": \"").append(map.get("address")).append("\"");
            json.append("}");
        }
        json.append(" ] }");

        printWriter.println(json);

        printWriter.close();
        dbConnection.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
