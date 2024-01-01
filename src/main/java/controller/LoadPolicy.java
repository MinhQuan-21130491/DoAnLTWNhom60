package controller;
import model.InforWebsite;
import org.json.JSONObject;
import service.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loadPolicy", value = "/loadPolicy")
public class LoadPolicy extends HttpServlet {
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        int id = Integer.parseInt(request.getParameter("id"));
//        InforWebsite inforWebsite = WebService.getInstance().getInforWebsiteById(id);
//        JSONObject jsonRes = new JSONObject();
//        JSONObject infoJSON = new JSONObject();
//        infoJSON.put("id", inforWebsite.getId());
//        infoJSON.put("guarantee", inforWebsite.getGuarantee());
//        infoJSON.put("exchange", inforWebsite.getExchange());
//        jsonRes.put("inforWeb", infoJSON);
//
//        PrintWriter out = response.getWriter();
//        out.write(jsonRes.toString());
//    }
}
