package bitc.fullstack405.study11.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// @WebServlet : tomcat 서버에 클라이언트에서 요청시 사용하는 URL과 서블릿 클래스를 등록하는 어노테이션
@WebServlet(name = "testServlet2", value = "/TestServlet2.do")
public class TestServlet2 extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    req.setAttribute("msg", "안녕하세요");

    req.getRequestDispatcher("/chap12/TestServlet.jsp").forward(req, res);
  }
}












