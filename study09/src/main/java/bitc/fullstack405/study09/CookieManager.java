package bitc.fullstack405.study09;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
  public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
    Cookie cookie = new Cookie(cName, cValue);
    cookie.setPath("/");
    cookie.setMaxAge(cTime);
    response.addCookie(cookie);
  }

  public static String readCookie(HttpServletRequest request, String cName) {
    String cookieValue = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        String cookieName = cookie.getName();
        if (cookieName.equals(cName)) {
          cookieValue = cookie.getValue();
        }
      }
    }
    return cookieValue;
  }

  public static void deleteCookie(HttpServletResponse response, String cName) {
    makeCookie(response, cName, "", 0);
  }
}












