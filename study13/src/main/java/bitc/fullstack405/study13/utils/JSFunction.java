package bitc.fullstack405.study13.utils;

import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.util.concurrent.ExecutionException;

public class JSFunction {

  public static void alertLocation(String msg, String url, HttpServletResponse resp) {
    try {
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();

      String script = "<script>";
      script += "alert('" + msg + "'); ";
      script += "location.href = '" + url + "'; ";
      script += "</script>";

      out.println(script);
    }
    catch (Exception e) { }
  }

  public static void alertBack(String msg, HttpServletResponse resp) {
    try {
      resp.setContentType("text/html; charset=utf-8");
      PrintWriter out = resp.getWriter();

      String script = "<script>";
      script += "alert('" + msg + "'); ";
      script += "history.back(); ";
      script += "</script>";

      out.println(script);
    }
    catch (Exception e) {
      System.out.println("오류 발생 - " + e.getMessage());
    }
  }
}












