<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 3.
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study12.util.JSFunction" %>
<%@ page import="java.io.*" %>

<%
  request.setCharacterEncoding("UTF-8");
//  업로드된 파일이 저장된 위치 지정
  String saveDir = "C:/upload/";
//  클라이언트에서 전달된 저장된 파일명을 가져오기
  String saveFileName = request.getParameter("sName");
//  클라이언트에서 전달된 원본 파일명을 가져오기
  String originalFileName = request.getParameter("oName");

  try {
//    다운로드를 위해서 파일 객체 생성, 저장된 파일명을 기준으로 생성
    File file = new File(saveDir + saveFileName);
//    바이너리 데이터를 받을 수 있는 InputStream 타입의 변수에 자식 클래스인 FileInputStream 타입의 객체를 저장
//    FileInputStream 객체 생성 시 위에서 만든 File 클래스 타입의 객체를 매개변수로 사용함
    InputStream inputStream = new FileInputStream(file);

//    웹 브라우저 정보 확인
    String client = request.getHeader("User-Agent");

//    WOW64는 인터넷 익스플로러를 의미, 인터넷 익스플로러 사용 시 한글 깨짐을 처리
    if (client.indexOf("WOW64") == 1) {
      originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
    }
    else {
      originalFileName = new String(originalFileName.getBytes("KSC5601"), "ISO-8859-1");
    }

//    파일 다운로드를 위해서 서버의 응답 객체인 response 객체 설정
    response.reset();
//    response 객체의 컨텐츠 타입 설정, 파일 전송 방식으로 설정
    response.setContentType("application/octet-stream");
//    response 객체에 파일 다운로드 설정, 원본 파일 이름으로 설정
    response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");
//    다운로드하는 파일의 크기 지정
    response.setHeader("Content-Length", "" + file.length());

    out.clear();

//    response 객체에서 새로운 출력 스트림 생성
    OutputStream outputStream = response.getOutputStream();

//    파일의 크기만큼의 byte 타입의 배열 생성
    byte[] b = new byte[(int) file.length()];
    int readBuffer = 0;

//    inputStream에 저장된 파일정보를 byte 단위로 읽어서 OutputStream에 쓰기
//    더이상 읽어올 데이터가 없을때까지 반복 읽기 및 쓰기
    while ( (readBuffer = inputStream.read(b)) > 0) {
      outputStream.write(b, 0, readBuffer);
    }

//    InputStream 및 OutputStream 닫기
    inputStream.close();
    outputStream.close();
  }
  catch (FileNotFoundException e) {
    JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
  }
  catch (Exception e) {
    JSFunction.alertBack("파일 다운로드 중 오류가 발생했습니다.", out);
  }
%>












