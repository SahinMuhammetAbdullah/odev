package post;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/FileUploadServlet")
@MultipartConfig
public class Post extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        Collection<Part> parts = req.getParts();
        
        File uploadDir = new File(System.getProperty("user.home") + "/Desktop/Files/");
      
        if (!uploadDir.exists()) {
           uploadDir.mkdir();
        }
        
        for (Part part : parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                part.write(uploadDir + File.separator + fileName);
            }
        }
        
        // Setting response content type
        res.setContentType("text/html");
        
        // Writing response message
        PrintWriter out = res.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Yükleme Başarılı');");
        out.println("window.location = '/Post/index.jsp';"); // Redirect to another page if needed
        out.println("</script>");
    }
}
