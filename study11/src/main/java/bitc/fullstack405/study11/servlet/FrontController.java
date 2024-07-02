package bitc.fullstack405.study11.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// 클라이언트에서 접속할 URL 주소 설정, URL이 .one으로 끝나는 URL 요청은 모두 FrontController 서블릿이 처리함
@WebServlet(value = "*.one")
public class FrontController extends HttpServlet {

//  a 태그를 통해서 접속 시 get 방식으로 서버에 요청하므로 doGet() 메소드를 호출
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//    getRequestURI : 서버 주소를 제외한 모든 주소 출력
    String uri = req.getRequestURI();
//    가져온 uri에서 / 를 문자열의 뒤에서부터 검색하여 몇번째 index에 있는지 확인
    int lastSlash = uri.lastIndexOf("/");
//    검색된 / 의 index 위치부터 모든 문자열을 복사함
    String commandStr = uri.substring(lastSlash);

//    제어문을 사용하여 조건에 데이터를 request 영역에 저장
    if (commandStr.equals("/regist.one")) {
      registFunc(req);
    }
    else if (commandStr.equals("/login.one")) {
      loginFunc(req);
    }
    else if (commandStr.equals("/freeboard.one")) {
      freeboardFunc(req);
    }

//    request 영역에 데이터 추가
    req.setAttribute("uri", uri);
    req.setAttribute("commandStr", commandStr);

//    클라이언트의 웹 브라우저에 표시될 view 파일을 설정하고 해당 파일로 이동
    req.getRequestDispatcher("/chap12/FrontController.jsp").forward(req, res);
  }

  private void registFunc(HttpServletRequest req) {
    req.setAttribute("resultValue", "<h4>회원가입</h4>");
  }

  private void loginFunc(HttpServletRequest req) {
    req.setAttribute("resultValue", "<h4>로그인</h4>");
  }

  private void freeboardFunc(HttpServletRequest req) {
      req.setAttribute("resultValue", "<h4>자유게시판</h4>");
  }
}












