package servlet.insert;

import DB.DBConnection;
import bean.RecordData;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/insert/Record")
public class Record extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();

        BufferedReader reader = request.getReader();
        PrintWriter printWriter = response.getWriter();
        DBConnection dbConnection = new DBConnection();
        dbConnection.createConnection();

        String s = reader.readLine();
        RecordData recordData = gson.fromJson(s, RecordData.class);

        int i = insertRecord(dbConnection, recordData);

        List<RecordData.Detail> table = recordData.getTable();
        for (RecordData.Detail detail : table) {
            insertDetail(dbConnection, detail, i);
        }

        printWriter.println("{ \"status\": 1, \"message\": \"操作成功\" }");

        reader.close();
        printWriter.close();
        dbConnection.close();

    }

    private int insertRecord(DBConnection dbConnection, RecordData recordData) {
        StringBuffer sql = new StringBuffer("");

        String in = recordData.getStorehouse_in();
        String out = recordData.getStorehouse_out();
        String cus = recordData.getCustomer();
        String sup = recordData.getSupplier();

        sql.append("insert record values(null");
        sql.append(", '").append(recordData.getInvoice_type()).append("'");
        sql.append(", ").append(in.equals("") ? "null" : in);
        sql.append(", ").append(out.equals("") ? "null" : out);
        sql.append(", ").append(cus.equals("") ? "null" : cus);
        sql.append(", ").append(sup.equals("") ? "null" : sup);
        sql.append(", '").append(recordData.getDealer()).append("'");
        sql.append(", '").append(recordData.getDate()).append("'");
        sql.append(")");

        dbConnection.update(sql.toString());

        sql = new StringBuffer("select max(id) id from record");
        ArrayList<Map<String, String>> maps = dbConnection.queryForList(sql.toString());
        return Integer.parseInt(maps.get(0).get("id"));
    }

    private void insertDetail(DBConnection dbConnection, RecordData.Detail detail, int i) {
        StringBuffer sql = new StringBuffer("");

        sql.append("insert record_details values(").append(i);
        sql.append(", ").append(detail.getCommodity());
        sql.append(", ").append(detail.getPrice());
        sql.append(", ").append(detail.getQuantity());
        sql.append(")");

        dbConnection.update(sql.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
