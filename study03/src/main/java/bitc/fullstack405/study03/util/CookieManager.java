package bitc.fullstack405.study03.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {

//  정적 메소드로 선언
//  HttpServletResponse : 클라이언트의 요청에 대한 서버의 응답을 전달하기 위한 response 내장 객체
//  첫번째 매개변수로 jsp에서 response 내장 객체를 받음
//  두번째 매개변수로 쿠키 이름을 받음
//  세번째 매개변수로 쿠키 값을 받음
//  네번째 매개변수로 쿠키가 클라이언트에 저장되어 있는 시간을 받음
  public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
//    쿠키 생성
    Cookie cookie = new Cookie(cName, cValue);
//    현재 위치로 경로 설정
    cookie.setPath("/");
//    클라이언트에서 쿠키가 저장되어 있는 시간 설정
    cookie.setMaxAge(cTime);
//    response 내장 객체에 쿠키 저장
    response.addCookie(cookie);
  }

//  정적 메소드로 선언
//  HttpServletRequest : 클라이언트의 요청 시 클라이언트에서 전달되는 데이터를 저장하고 있는 request 클래스
//  첫번째 매개변수로 request 내장객체를 받음
//  두번째 매개변수로 쿠키명을 받음
  public static String readCookie(HttpServletRequest request, String cName) {
    String cookieValue = ""; // 쿠키값을 저장할 변수

//    사용자 요청 정보가 포함된 request 내장 객체에서 모든 쿠키 정보를 가져옴
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie item : cookies) {
//        쿠키명 가져오기
        String cookieName = item.getName();
//        request 내장객체에서 가져온 쿠키명과 매개변수로 전달받은 쿠키명을 비교
        if (cookieName.equals(cName)) {
//          쿠키명이 같으면 내장객체에 저장된 쿠키값을 변수에 저장
          cookieValue = item.getValue();
        }
      }
    }

    return cookieValue;
  }

//  정적 메소드로 선언
//  첫번째 매개변수로 내장객체 response를 받음
//  두번째 매개변수로 쿠키명을 받음
  public static void deleteCookie(HttpServletResponse response, String cName) {
//    쿠키는 삭제명령어가 따로 없고 setMaxAge(0) 으로 설정하여 쿠키를 삭제
//    첫번째 매개변수로 받아온 response를 전달하고, 두번째 매개변수로 삭제할 쿠키명을 입력
//    쿠키를 삭제할 예정이기 때문에 쿠키값 필요없음
//    쿠키를 삭제하기 위해서 쿠키 저장시간을 0으로 설정
    makeCookie(response, cName, "", 0);
  }
}












