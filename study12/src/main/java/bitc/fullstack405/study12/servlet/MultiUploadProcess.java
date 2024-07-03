package bitc.fullstack405.study12.servlet;

import bitc.fullstack405.study12.database.MyFileDAO;
import bitc.fullstack405.study12.database.MyFileDTO;
import bitc.fullstack405.study12.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)
@WebServlet("/MultiUploadProcess.do")
public class MultiUploadProcess extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
//      파일이 저장될 위치 직접 지정
      String saveDir = "C:/upload/";
//      원본 파일명 리스트 가져오기, request 객체를 분석하여 업로드된 파일 리스트 여부 확인 및 서버에 저장
      List<String> oriFileNameList = FileUtil.multiUploadFileList(req, saveDir);

//      방법 1 : 저장된 파일명 변경은 반복문으로 처리
//////////////////////////////////////////////////////////////////////
//      for (String oriFileName : oriFileNameList) {
//        //      수정된 파일명 가져오기
//        String saveFileName = FileUtil.renameFile(saveDir, oriFileName);
//
////      파일 정보를 데이터베이스에 등록하기, 반복문으로 처리
//        insertMyFile(req, oriFileName, saveFileName);
//      }
//////////////////////////////////////////////////////////////////////


//      방법 2 : 수정된 파일명 리스트 가져와서 데이터베이스에서 한번에 등록하기
////////////////////////////////////////////////////////////////////////////////////
//      수정된 파일명 리스트를 가져오기
      List<String> saveFileList = FileUtil.renameFileList(saveDir, oriFileNameList);
//      원본 파일명 리스트와 수정된 파일명 리스트를 매개변수로 전달
      insertMyFileList(req, oriFileNameList, saveFileList);
////////////////////////////////////////////////////////////////////////////////////

//      페이지 이동
      resp.sendRedirect("/chap13/FileList.jsp");
    }
    catch (Exception e) {
      e.printStackTrace();
//      오류 발생 시 request 영역에 에러 메세지 추가
      req.setAttribute("errorMessage", "파일 업로드 오류");
//      forward를 통해서 페이지 이동
      req.getRequestDispatcher("/chap13/MultiFileUploadMain.jsp").forward(req, resp);
    }
  }

  //  클라이언트에서 전달한 정보 및 데이터베이스 등록을 위한 메소드
//  매개변수로 request 객체, 원본 파일명, 저장된 파일명을 받아옴
  private void insertMyFile(HttpServletRequest req, String originalFileName, String saveFileName) {
//    클라이언트에서 input 태그를 통해서 전달한 데이터 가져오기
    String title = req.getParameter("title");
//    checkbox 로 데이터를 전달하여 데이터가 배열로 전달되기 때문에 getParameterValues()를 사용하여 배열로 가져옴
    String[] cateArr = req.getParameterValues("cate");
    StringBuffer cateBuff = new StringBuffer();

//    checkbox 로 전달된 데이터가 없을 경우
    if (cateArr == null) {
      cateBuff.append("선택한 항목 없음");
    }
    else {
//      checkbox 로 전달된 데이터가 있으면 반복문으로 모두 가져옴
      for (String item : cateArr) {
        cateBuff.append(item + ", ");
      }
    }

    System.out.println("파일 외 폼값 : " + title + "\n" + cateBuff);

//    클라이언트에서 전달받은 데이터를 데이터베이스에 저장하기 위해 MyFileDTO 클래스 타입의 객체 생성
    MyFileDTO myFile = new MyFileDTO();
//    각각의 데이터 저장
    myFile.setTitle(title);
    myFile.setCate(cateBuff.toString());
    myFile.setOfile(originalFileName);
    myFile.setSfile(saveFileName);

//    데이터베이스의 myfile 테이블을 제어하기 위한 MyFileDAO 클래스 타입의 객체 생성
    MyFileDAO dao = new MyFileDAO();
//    DB연결
    dao.dbOpen();
//    DB에 데이터 추가
    dao.insertFile(myFile);
    dao.dbClose();
  }

  private void insertMyFileList(HttpServletRequest req, List<String> originalFileNameList, List<String> saveFileNameList) {
    String title = req.getParameter("title");
    String[] cateArr = req.getParameterValues("cate");
    StringBuffer cateBuff = new StringBuffer();

    if (cateArr == null) {
      cateBuff.append("선택한 항목 없음");
    }
    else {
      for (String item : cateArr) {
        cateBuff.append(item + ", ");
      }
    }

    System.out.println("파일 외 폼값 : " + title + "\n" + cateBuff);

//    데이터베이스에 등록할 MyFileDTO 클래스 타입의 리스트를 생성
    List<MyFileDTO> myFileList = new ArrayList<>();

//    반복문을 사용하여 리스트에서 데이터 입력, 원본 파일명 리스트의 크기만큼 반복 수행
    for (int i = 0; i < originalFileNameList.size(); i++) {
//      각 항목에 맞는 데이터 입력
      MyFileDTO myFile = new MyFileDTO();
      myFile.setTitle(title);
      myFile.setCate(cateBuff.toString());
      myFile.setOfile(originalFileNameList.get(i));
      myFile.setSfile(saveFileNameList.get(i));

      myFileList.add(myFile);
    }


    MyFileDAO dao = new MyFileDAO();
    dao.dbOpen();
//    MyFileDTO 리스트를 매개변수로 사용
    dao.insertFileList(myFileList);
    dao.dbClose();
  }
}












