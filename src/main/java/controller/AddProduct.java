package controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet(name = "addProduct", value = "/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String name = request.getParameter("nameProduct");
        String priceImport = request.getParameter("priceImpProductAdd");
        String price = request.getParameter("priceProductAdd");
        String savePath = "D:\\ltw\\DoAn\\DoanLTWNhom60\\src\\main\\webapp\\Products";
        File folder = new File(savePath);
        for (Part part : request.getParts()) {
            if (isFilePart(part)) {
                String fileName = extractFileName(part);
                String newFileName = generateUniqueIdentifier()+"_"+ fileName;
                File fileSave = new File(savePath + File.separator + newFileName);
                if (fileName != null && !fileName.isEmpty()) {
                   // ProductService.getInstance().insertProduct()
                }

                part.write(savePath + File.separator + newFileName);
            }
        }

        request.getRequestDispatcher("Success.jsp").forward(request, response);
    }

    private boolean isFilePart(Part part) {
        return part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty();
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return null;
    }
    public static String generateUniqueIdentifier() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

}
