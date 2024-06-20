<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오후 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // ajax 통신으로 전달한 데이터를 가져오기
//  html의 form을 통한 데이터 전달 시와 동일하게 사용할 수 있음
  String chkVal = request.getParameter("inactiveToday");

  if (chkVal != null && chkVal.equals("1")) {
//    쿠키 생성
    Cookie cookie = new Cookie("PopupClose", "off");
//    현재 경로 가져오기
    cookie.setPath(request.getContextPath());
//    쿠키를 클라이언트에 저장하고 있을 기간 설정, 시간을 초(sec)로 계산
//    60(초) * 60(분) * 24(시간) = 하루 24시간
    cookie.setMaxAge(60 * 60 * 24);
//    응답 객체인 response에 쿠키 저장
    response.addCookie(cookie);
    out.print("쿠키 : 하루 동안 열지 않음");
  }
%>











