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

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String mode = req.getParameter("mode");
    int idx = Integer.parseInt(req.getParameter("idx"));

    req.setAttribute("mode", mode);
    req.setAttribute("idx", idx);

    req.getRequestDispatcher("/MVCBoard/Pass.jsp").forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String pass = req.getParameter("pass");
    String mode =req.getParameter("mode");
    int idx = Integer.parseInt(req.getParameter("idx"));

    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();

    boolean confirmed = dao.confirmPassword(idx, pass);

    if (confirmed) {
      if (mode.equals("update")) {
        resp.sendRedirect("/mvcboard/edit.do?idx=" + idx);
      }
      else if (mode.equals("delete")) {
        String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");
        MVCBoardDTO board = dao.selectBoardDetail(idx);
        FileUtil.deleteFile(board.getsFile(), saveDir);

        int result = dao.deleteBoard(idx);
        if (dao.isDbOpen()) {
          dao.dbClose();
        }

        if (result == 1) {
          JSFunction.alertLocation("삭제되었습니다.", "/mvcboard/list.do", resp);
        }
        else {
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












