package bitc.fullstack405.study11.servlet;

import bitc.fullstack405.study11.database.MemberDAO;
import bitc.fullstack405.study11.database.MemberDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// @WebServlet를 사용하여 tomcat 서버에 서블릿으로 등록, URL도 등록
@WebServlet("/MemberAuth.mvc")
public class MemberAuth extends HttpServlet {
// web.xml에 있는 데이터를 가져오기 위해서 선언
//  ServletContext app;
  
//  데이터베이스를 컨트롤하기 위한 DAO 클래스 타입의 객체 선언
  MemberDAO dao;

  @Override
  public void init() throws ServletException {
//    app = this.getServletContext();
//    dao = new MemberDAO(app);
//    jsp의 application 내장 객체 정보를 가져옴
    dao = new MemberDAO(this.getServletContext());
//    DB 연결
    dao.dbOpen();
  }

//  init() 메소드가 호출 완료 시 동작
//  매개변수로 request, response 내장 객체를 가져옴
  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    web.xml 에 있는 데이터 가져오기
    String adminId = this.getServletContext().getInitParameter("admin_id");
//    클라이언트에서 전달한 데이터 가져오기
    String userId = req.getParameter("id");
    String userPw = req.getParameter("pass");

//    클라이언트에서 가져온 사용자를 사용하여 dao에서 제공하는 getMemberInfo() 메소드를 호출
//    DAO를 통해서 가져온 결과를 MemberDTO 클래스 타입의 객체에 저장
    MemberDTO member = dao.getMemberInfo(userId, userPw);

//    DTO 객체에 저장된 데이터 가져오기
    String memberName = member.getName();

//    가져온 데이터가 있는지 확인
    if (memberName != null) {
//      가져온 데이터가 있을 경우 web.xml에서 가져온 관리자 id와 같은지 확인
      if (adminId.equals(userId)) {
//        가져온 데이터를 setAttribute()로 request 영역에 저장
        req.setAttribute("authMessage", adminId + "는 관리자입니다.");
      }
      else {
        req.setAttribute("authMessage", memberName + " 회원님 반갑습니다.");
      }
    }
    else {
      req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
    }

//    포워드할 뷰 페이지를 지정하고 forward()를 사용하여 페이지 이동
    req.getRequestDispatcher("/chap12/MemberAuth.jsp").forward(req, resp);
  }

  @Override
  public void destroy() {
    dao.dbClose();
  }
}












