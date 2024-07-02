package bitc.fullstack405.study11.servlet;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/LifeCycle.do")
public class LifeCycle extends HttpServlet {

  @PostConstruct
  public void myPostConstruct() {
    System.out.println("myPostConstruct() 호출");
  }

  @Override
  public void init() throws ServletException {
    System.out.println("init() 호출");
  }

  @Override
  public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("service() 호출");
    super.service(req, resp);
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("doGet() 호출");
    req.getRequestDispatcher("/chap12/LifeCycle.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("doPost() 호출");
    req.getRequestDispatcher("/chap12/LifeCycle.jsp").forward(req, resp);
  }

  @Override
  public void destroy() {
    System.out.println("destroy() 호출");
  }

  @PreDestroy
  public void myPreDestroy() {
    System.out.println("myPreDestroy() 호출");
  }
}












