package bitc.fullstack405.study13.controller;

import bitc.fullstack405.study13.database.MVCBoardDAO;
import bitc.fullstack405.study13.database.MVCBoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

//  a 태그로 접속 시 get 방식을 사용하기 때문에 doGet() 을 호출함
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    클라이언트에서 전달한 게시물 번호는 가져옴
    int idx = Integer.parseInt(req.getParameter("idx"));

//    mvcboard 테이블에서 데이터를 가져오기 위한 DAO 객체 생성
    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();

//    게시물 확인시 조회수를 업데이트하기 위하여 dao에서 제공하는 updateVisitCount()를 호출
    dao.updateVisitCount(idx);

//    게시물의 상세 정보를 dao에서 제공하는 selectBoardDetail() 를 호출하여 가져옴
    MVCBoardDTO board = dao.selectBoardDetail(idx);

    if (dao.isDbOpen()) {
      dao.dbClose();
    }

//    DB에서 가져온 정보를 request 영역에 board 라는 이름으로 저장
    req.setAttribute("board", board);
//    view 페이지인 /MVCBoard/View.jsp 를 설정하고 forward()를 사용하여 화면 이동
    req.getRequestDispatcher("/MVCBoard/View.jsp").forward(req, resp);
  }
}












