package bitc.fullstack405.study11.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/LoginProcess.do")
public class LoginProcess extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    클라이언트에서 전달한 데이터를 request 객체에서 가져옴
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

    if (userId.equals("test1") && userPw.equals("1234")) {
//      request 영역에 데이터 저장
      request.setAttribute("userId", userId);
      request.setAttribute("userPw", userPw);
      request.setAttribute("userName", "테스트 유저 1");

//      getRequestDispatcher를 통해서 뷰 페이지를 설정, forward를 통해서 페이지 이동,
      request.getRequestDispatcher("/chap12/LoginOK.jsp").forward(request, response);
    }
    else {
      response.sendRedirect("/chap12/LoginFail.jsp");
    }
  }
}












