<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 3.
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page import="bitc.fullstack405.study12.database.MyFileDAO" %>
<%@ page import="bitc.fullstack405.study12.database.MyFileDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>

<%
  // DB 접속 및 제어를 위한 DAO 객체 생성
  MyFileDAO dao = new MyFileDAO();
//    DB 연결
  dao.dbOpen();
//    업로드한 파일 목록을 DB에서 가져오기
  List<MyFileDTO> fileList = dao.selectFileList();
//    DB 연결 해제
  dao.dbClose();

//  request.setAttribute("fileList", fileList);
%>
<c:set var="fileList" value="<%=fileList%>" scope="page"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h3 class="text-center">DB에 등록된 파일 목록 보기</h3>

  <div>
    <ul class="list-group">
      <li class="list-group-item">
        <a href="./FileUploadMain.jsp" target="_blank" class="btn btn-link">파일 등록</a>
      </li>
      <li class="list-group-item">
        <a href="./MultiFileUploadMain.jsp" target="_blank" class="btn btn-link">파일 등록(다중 업로드)</a>
      </li>
    </ul>
  </div>

  <div class="mt-4">
    <table class="table table-hover table-striped">
      <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>카테고리</th>
        <th>원본 파일명</th>
        <th>저장된 파일명</th>
        <th>등록시간</th>
        <th>다운로드</th>
      </tr>
      </thead>
      <tbody>
<%--      스크립틀릿으로 출력 --%>
<%--      <%--%>
<%--        // DB에서 가져온 내용을 view 파일인 FileList.jsp에 출력--%>
<%--        for (MyFileDTO item : fileList) {--%>
<%--      %>--%>
<%--        <tr>--%>
<%--          <td><%=item.getIdx()%></td>--%>
<%--          <td><%=item.getTitle()%></td>--%>
<%--          <td><%=item.getCate()%></td>--%>
<%--          <td><%=item.getOfile()%></td>--%>
<%--          <td><%=item.getSfile()%></td>--%>
<%--          <td><%=item.getPostDate()%></td>--%>
<%--          <td><a href="./Download.jsp?oName=<%=URLEncoder.encode(item.getOfile(), "UTF-8")%>&sName=<%=URLEncoder.encode(item.getSfile(),"UTF-8")%>" class="btn btn-link text-decoration-none">[다운로드]</a></td>--%>
<%--        </tr>--%>
<%--      <%--%>
<%--        }--%>
<%--      %>--%>

<%--      jstl로 출력 --%>
        <c:forEach var="item" items="${fileList}">
          <tr>
            <td>${item.idx}</td>
            <td>${item.title}</td>
            <td>${item.cate}</td>
            <td>${item.ofile}</td>
            <td>${item.sfile}</td>
            <td>${item.postDate}</td>
<%--            업로드된 파일을 다운로드 하기 위해서 Download.jsp로 다운로드 요청 --%>
<%--            파라미터로 원본 파일명과 수정된 파일명을 전달함 --%>
<%--            URLEncoder : URL 로 영어를 전송 시 문제가 없지만 한글은 URL로 전송 시 문자가 깨짐, URLEncoder를 사용하여 한글을 변환하여 전송 --%>
            <td><a href="./Download.jsp?oName=${URLEncoder.encode(item.ofile, "UTF-8")}&sName=${URLEncoder.encode(item.sfile,"UTF-8")}" class="btn btn-link text-decoration-none">[다운로드]</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>











