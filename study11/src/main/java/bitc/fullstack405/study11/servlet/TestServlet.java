package bitc.fullstack405.study11.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// 서블릿 클래스는 반드시 HttpServlet 클래스를 상속받아 구현함
public class TestServlet extends HttpServlet {

//  부모 클래스인 HttpServlet 에서 상속받은 doGet(), doPost()를 오버라이딩하여 사용함
//  HttpServletRequest : 클라이언트에서 요청한 데이터를 가지고 있는 객체, JSP의 내장 객체 request와 동일함
//  HttpServletResponse : 클라이언트로 응답을 주기 위한 객체, JSP의 내장 객체 response와 동일함
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//    request 영역에 message 라는 이름으로 데이터를 저장
    req.setAttribute("message", "Hello Test Servlet!!");
//    getRequestDispatcher() : request 객체에서 제공하는 이동할 페이지를 설정하는 명령, 실제 View 페이지인 JSP 파일이 있는 위치를 지정
//    forward() : request 객체에서 제공하는 페이지 이동 명령
    req.getRequestDispatcher("/chap12/TestServlet.jsp").forward(req, res);
  }
}












