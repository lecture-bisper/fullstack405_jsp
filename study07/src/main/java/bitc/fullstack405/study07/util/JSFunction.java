package bitc.fullstack405.study07.util;

import jakarta.servlet.jsp.JspWriter;

// JSP 내에서 필요 시 자바스크립트의 alert(), location.href, history.back() 을 쉽게 사용하도록 하는 클래스
public class JSFunction {
//  첫번째 매개변수로 출력할 메시지
//  두번째 매개변수로 이동할 위치
//  세번째 매개변수로 JSP에서 제공하는 html에 내용을 출력하는 out 객체
  public static void alertLocation(String msg, String url, JspWriter out) {
    try {
      String script = "<script>";
      script += "alert('" + msg + "'); ";
      script += "location.href = '" + url + "'; ";
      script += "</script>";
      out.println(script);
    }
    catch (Exception e) {}
  }
  
//  첫번째 매개변수로 출력할 메시지
//  두번째 매개변수로 JSP에서 제공하는 html에 내용을 출력하는 out 객체
  public static void alertBack(String msg, JspWriter out) {
    try {
      String script = "<script>";
      script += "alert('" + msg + "'); ";
      script += "history.back(); ";
      script += "</script>";
      out.println(script);
    }
    catch (Exception e) {}
  }
}












