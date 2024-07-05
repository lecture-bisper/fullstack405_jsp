package bitc.fullstack405.study13.utils;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

import java.io.PrintWriter;

public class JSFunction {

  public static void alertLocation(String msg, String url, HttpServletResponse resp) {
    try {
//      기존에는 jsp에서 제공하는 out 내장 객체를 매개변수로 받아서 사용
//      서블릿 파일은 확장자가 java 이고 java는 out 내장객체가 없음
//      jsp에서 제공하는 out 내장객체는 JspWriter 클래스를 사용하고 있으며, JspWriter는 PrintWriter를 상속받아 구현한 클래스임
//      PrintWriter 객체는 HttpServletResponse 객체를 통해서 받아올 수 있음
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












