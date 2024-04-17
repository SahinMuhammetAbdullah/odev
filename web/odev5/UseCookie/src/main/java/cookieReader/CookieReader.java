package cookieReader;

import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.CookieStore;
import java.net.HttpCookie;
import java.util.List;

public class CookieReader {
    public static void main(String[] args) {
        CookieManager manager = new CookieManager();
        CookieHandler.setDefault(manager);

        // Çerezleri al
        CookieStore cookieJar = manager.getCookieStore();
        List<HttpCookie> cookies = cookieJar.getCookies();

        // Çerezleri ekrana bastır
        for (HttpCookie cookie : cookies) {
            System.out.println("Ad: " + cookie.getName());
            System.out.println("Değer: " + cookie.getValue());
            System.out.println("Etki Alanı: " + cookie.getDomain());
            System.out.println("Yol: " + cookie.getPath());
            System.out.println("Zaman Damgası: " + cookie.getMaxAge());
            System.out.println("----------------------------------");
        }
    }
}
