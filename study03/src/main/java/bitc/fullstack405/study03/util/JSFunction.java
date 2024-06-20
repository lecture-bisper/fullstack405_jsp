package bitc.fullstack405.study03.util;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
//  정적 메소드로 선언
//  첫번째 매개변수를 알람창에 출력할 메세지
//  두번째 매개변수는 이동하고자 하는 URL
//  세번째 매개변수는 jsp에서 자동 선언된 out 내장객체
  public static void alertLocation(String msg, String url, JspWriter out) {
    try {
//      자바스크립트를 사용하기 위해서 문자열로 생성
      String script = "<script>";
//      자바스크립트의 alert() 메소드로 웹 화면에서 알림창 출력
      script += "alert('" + msg + "');";
//      location.href : 자바스크립트에서 제공하는 페이지 이동 명령어, a 태그와 같은 기능
      script += "location.href = '" + url + "';";
      script += "</script>";
//      jsp의 out 객체를 사용하여 html에 자바스크립트 내용을 출력
      out.println(script);
    }
    catch (Exception e) {}
  }

//  정적 메소드로 선언
//  첫번째 매개변수는 알림창에 출력할 메세지
//  두번째 매개변수는 jsp에서 자동 선언된 out 내장객체
  public static void alertBack(String msg, JspWriter out) {
    try {
//      자바스크립트를 사용하기 위해서 문자열로 선언
      String script = "<script>";
//      알림창 출력
      script += "alert('" + msg + "');";
//      history.back() : 자바스크립트에서 제공하는 뒤로 가기 명령
      script += "history.back()";
      script += "</script>";
//      jsp의 out 객체를 사용하여 html에 자바스크립트 내용을 출력
      out.println(script);
    }
    catch (Exception e) {}
  }

}












