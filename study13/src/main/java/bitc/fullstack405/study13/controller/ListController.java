package bitc.fullstack405.study13.controller;

import bitc.fullstack405.study13.database.MVCBoardDAO;
import bitc.fullstack405.study13.database.MVCBoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

// 게시판 목록 페이지를 사용하기 위한 서블릿 클래스
// 사용자가 접속할 url 설정
@WebServlet("/mvcboard/list.do")
public class ListController extends HttpServlet {

//  게시판 목록 페이지에서 보여줄 내용을 DB에서 가져와서 request 영역에 저장
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    DAO 객체 생성
    MVCBoardDAO dao = new MVCBoardDAO();
//    DB 연결
    dao.dbOpen();
//    게시판 전체 목록을 dao의 selectBoardList()를 사용하여 가져옴
    List<MVCBoardDTO> boardList = dao.selectBoardList();

//    DB 연결 종료
    if (dao.isDbOpen()) {
      dao.dbClose();
    }

//    request 영역에 boardList 란 이름으로 저장
    req.setAttribute("boardList", boardList);

//    클라이언트에 화면 출력을 위해서 뷰 파일을 /MVCBoard/List.jsp 으로 지정 후 forward() 를 사용하여 화면 이동함
    req.getRequestDispatcher("/MVCBoard/List.jsp").forward(req, resp);
  }
}












