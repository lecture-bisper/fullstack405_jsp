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

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int idx = Integer.parseInt(req.getParameter("idx"));

    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();

    dao.updateVisitCount(idx);

    MVCBoardDTO board = dao.selectBoardDetail(idx);

    if (dao.isDbOpen()) {
      dao.dbClose();
    }

    req.setAttribute("board", board);

    req.getRequestDispatcher("/MVCBoard/View.jsp").forward(req, resp);
  }
}












