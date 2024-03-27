package registerData;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserRegister")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Form verilerini al
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String eposta = request.getParameter("eposta");
        String sifre = request.getParameter("sifre");

        // Şifreyi maskeli bir şekilde göster
        String maskelenmisSifre = maskleSifre(sifre);

        // Verileri ekrana yaz
        response.setContentType("text/html");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h2>Kayıt Bilgileri:</h2>");
        response.getWriter().println("<p>Ad: " + ad + "</p>");
        response.getWriter().println("<p>Soyad: " + soyad + "</p>");
        response.getWriter().println("<p>Eposta: " + eposta + "</p>");
        response.getWriter().println("<p>Şifre: " + maskelenmisSifre + "</p>");
        response.getWriter().println("</body></html>");

        // Tarayıcı modelini al ve ekrana mesaj kutusu olarak göster
        String userAgent = request.getHeader("User-Agent");
        String tarayiciModeli = "Bilinmiyor";

        if (userAgent != null) {
            if (userAgent.contains("Chrome")) {
                tarayiciModeli = "Google Chrome";
            } else if (userAgent.contains("Firefox")) {
                tarayiciModeli = "Mozilla Firefox";
            } else if (userAgent.contains("Edge")) {
                tarayiciModeli = "Microsoft Edge";
            } else if (userAgent.contains("Safari")) {
                tarayiciModeli = "Apple Safari";
            }
        }

        response.getWriter().println("<script>alert('Tarayıcı Modeli: " + tarayiciModeli + "');</script>");

    }

    // Şifreyi maskeler
    private String maskleSifre(String sifre) {
        StringBuilder masked = new StringBuilder();
        for (int i = 0; i < sifre.length(); i++) {
            masked.append("*");
        }
        return masked.toString();
    }
}
