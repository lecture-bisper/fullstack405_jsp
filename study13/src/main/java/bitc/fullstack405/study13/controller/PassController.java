package bitc.fullstack405.study13.controller;

import bitc.fullstack405.study13.database.MVCBoardDAO;
import bitc.fullstack405.study13.database.MVCBoardDTO;
import bitc.fullstack405.study13.utils.FileUtil;
import bitc.fullstack405.study13.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// 게시글 상세보기 화면에서 삭제 및 수정 버튼 클릭 시 접속하는 서블릿
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {

//  View.jsp에서 자바스크립트의 location.href를 통해서 접속했기 때문에 doGet() 호출
//    현재 doGet() 은 단순히 view 파일을 열기 위한 매개체임
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    클라이언트에서 전달받은 데이터 가져오기
    String mode = req.getParameter("mode");
    int idx = Integer.parseInt(req.getParameter("idx"));
    
//    request 영역에 전달받은 데이터를 저장
    req.setAttribute("mode", mode);
    req.setAttribute("idx", idx);

//    view 파일 지정후 forward()를 사용하여 화면 이동
    req.getRequestDispatcher("/MVCBoard/Pass.jsp").forward(req, resp);
  }

//  Pass.jsp에서 form을 통해서 post 방식으로 접속했으므로 doPost()를 호출
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    클라이언트에서 전달받은 데이터 가져오기
    String pass = req.getParameter("pass");
    String mode =req.getParameter("mode");
    int idx = Integer.parseInt(req.getParameter("idx"));

//    게시물 번호와 비밀번호가 일치하는지 확인하기 위해 DAO 객체 생성
    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();

//    dao에서 제공하는 confirmPassword()를 사용하여 일치하는지 결과를 가져옴
    boolean confirmed = dao.confirmPassword(idx, pass);

//    가져온 결과가 true이면, mode 확인, false 이면 이전화면으로 이동
    if (confirmed) {
//      결과가 true이면 mode를 확인하여 수정이나 삭제 로직을 실행함
      if (mode.equals("update")) {
//        mode가 update이면 /mvcboard/edit.do 를 사용하는 서블릿으로 이동
        resp.sendRedirect("/mvcboard/edit.do?idx=" + idx);
      }
//        mode가 delete 이면 파일 게시물 삭제 로직을 시작함
      else if (mode.equals("delete")) {
//        파일 삭제를 위해서 파일이 저장된 경로를 가져옴
        String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");
//        파일 삭제를 위해서 DB에서 현재 게시물의 정보를 가져옴
        MVCBoardDTO board = dao.selectBoardDetail(idx);
//        저장된 파일을 삭제
        FileUtil.deleteFile(board.getsFile(), saveDir);

//        DB에서 저장된 게시물을 삭제하고 결과를 받아움
        int result = dao.deleteBoard(idx);
        if (dao.isDbOpen()) {
          dao.dbClose();
        }

//        삭제 결과를 가지고 정상적으로 삭제되었는지 확인
        if (result == 1) {
//          정상 삭제 시 목록 화면으로 이동
          JSFunction.alertLocation("삭제되었습니다.", "/mvcboard/list.do", resp);
        }
        else {
//          삭제 오류 시 오류 메시지 출력 후 목록 화면으로 이동
          JSFunction.alertLocation("삭제 중 오류가 발생했습니다.", "/mvcboard/list.do", resp);
        }
      }
    }
    else {
      if (dao.isDbOpen()) {
        dao.dbClose();
      }

      JSFunction.alertBack("비밀번호 검증이 실패했습니다.", resp);
    }
  }
}












