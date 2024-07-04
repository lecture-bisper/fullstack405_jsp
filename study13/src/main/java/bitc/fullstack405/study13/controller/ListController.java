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

@WebServlet("/mvcboard/list.do")
public class ListController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    MVCBoardDAO dao = new MVCBoardDAO();
    dao.dbOpen();
    List<MVCBoardDTO> boardList = dao.selectBoardList();

    if (dao.isDbOpen()) {
      dao.dbClose();
    }

    req.setAttribute("boardList", boardList);

    req.getRequestDispatcher("/MVCBoard/List.jsp").forward(req, resp);
  }
}












