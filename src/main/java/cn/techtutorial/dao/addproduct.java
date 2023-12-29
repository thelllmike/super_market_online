package cn.techtutorial.dao;

import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;

/**
 * Servlet implementation class addproduct
 */
@WebServlet("/addproduct")
@MultipartConfig
public class addproduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public addproduct() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        
        // Get the image part
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        
        // Defines the path where you want to save the image
        String savePath = getServletContext().getRealPath("/product-image") + File.separator + fileName;

        // Checks if the directories exist
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        // Saves the file on the server's filesystem
        filePart.write(savePath + File.separator);
        
        // Inserts the product details into the database, using the fileName for the image
        int adb = Products.insertProduct(name, category, price, fileName);

        if (adb == 1) {
            // If insert is successful, redirect or forward to a success page
            response.sendRedirect("admin.jsp"); // Assuming you have a 'success.jsp' for success messages
        } else {
            // If insert is unsuccessful, redirect or forward to an error page
            response.sendRedirect("unsuccess.jsp"); // Assuming you have an 'unsuccess.jsp' for error messages
        }
    }
}
