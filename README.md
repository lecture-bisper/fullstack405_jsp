# 풀스택 405반
## JSP 수업 자료

---

1. 1일차 수업 (jspTest, study01)
   1. tomcat 설치하기
   2. JSP 프로젝트 생성
   3. page 지시어 (import, 예외처리, try~catch, errorPage, isErrorPage)
   4. page 지시어 (trimDirectiveWhitespaces, autoFlush)
   5. include 지시어
   6. 내장 객체 - request
2. 2일차 수업 (study02)
   1. getParameter 사용하기
   2. response 객체
   3. out 객체
   4. application 객체
   5. exception 객체
   6. page 영역
3. 3일차 수업 (study03)
   1. request 영역
   2. session 영역
   3. application 영역
   4. 쿠키 사용하기
   5. 쿠키를 사용하여 팝업창 관리하기
   6. 쿠키를 사용하여 id 저장하기
4. 4일차 수업 (dbtest, study04)
   1. 데이터베이스 연동 (jdbc connector 라이브러리 파일 직접 등록)
   2. 데이터베이스 연동 (jdbc connector 빌드 시스템으로 등록)
   3. 데이터베이스에 insert 하기
   4. 데이터베이스에서 select 하기
5. 5일차 수업 (study04)
   1. 데이터베이스에서 update 하기
   2. 데이터베이스에서 delete 하기
   3. PreparedStatement 사용하기
   4. PreparedStatement 재활용하기
   5. DB 접속 개선하기
   6. ConnectionPool 사용하기
6. 6일차 수업 (study06)
   1. 세션 사용해보기
   2. 세션을 통한 로그인 1
   3. 세션을 통한 로그인 2 (DTO, DAO 사용)
   4. 회원 가입 추가
7. 7일차 수업 (study07)
   1. 액션 태그 include
   2. 액션 태그 forward
   3. 액션 태그 useBean, setProperty, getProperty
   4. 액션 태그 param
   5. 회원제 게시판 만들기 (전체 목록 보기, 상세 보기, 글쓰기)
8. 8일차 수업 (study07)
   1. 회원제 게시판 만들기 (글 수정, 글 삭제)
   2. 회원제 게시판 만들기 (DAO, DTO 내용 추가)
   3. 회원제 게시판 만들기 (화면 layout 분리, util 클래스 추가)
   4. 회원제 게시판 만들기 (로그인 구현, 회원 가입 추가)
   5. 회원제 게시판 만들기 (각 페이지에서 회원 로그인 확인)
9. 9일차 수업 (study09)
   1.  EL - 각 영역의 데이터 가져오기, 파라미터 값 가져오기, 객체 데이터 가져오기
   2.  EL 내장 객체 사용하기, 컬렉션 사용하기
   3.  EL에서 연산하기
   4.  EL에서 메소드 호출하기, 정적메소드 호출하기
   5.  JSTL 사용하기, JSTL core의 set
10. 10일차 수업 (study1)
    1.  JSTL core - remove
    2.  JSTL core - if, choose
    3.  JSTL core - forEach, forTokens
    4.  JSTL core - import, redirect, url
    5.  JSTL core - out, catch
    6.  JSTL formatting - formatNumber/parseNumber
    7.  JSTL formatting - formatDate, timezone, locale
11. 11일차 수업 (study11)
    1.  서블릿 사용해보기, 필요한 종속성 추가, web.xml 내용 추가
    2.  @WebServlet 어노테이션으로 서블릿 사용하기
    3.  jsp 페이지와 서블릿으로 로그인페이지 만들기
    4.  하나의 서블릿 파일로 여러개의 요청 처리하기
    5.  서블릿 생명주기
    6.  서블릿과 DB 연동하기
12. 12일차 수업 (study12)
    1.  파일 업로드 : 종속성 추가, DB 접속정보 추가
    2.  파일 업로드 : DB 접속용 부모 클래스 생성, DTO, DAO 클래스 생성
    3.  파일 업로드 : 업로드 된 파일 정보 분석 및 저장용 클래스 생성
    4.  파일 업로드 : 파일 업로드 처리용 서블릿 생성, 사용자 입력 form 생성
    5.  파일 업로드 & 다운로드 : 파일 목록 페이지 생성, 다운로드 처리용 페이지 생성, 자바스크립트 사용 클래스 생성
    6.  파일 업로드 & 다운로드 : 다중 업로드용 form 페이지 생성, 다중 업로드 처리용 서블릿 생성
13. 13일차 수업 (study13)
    1.  MVC2 방식 게시판 : 프로젝트 생성, 종속성 추가, web.xml 설정
    2.  MVC2 방식 게시판 : DB 접속용 클래스, DTO, DAO 추가
    3.  MVC2 방식 게시판 : layout 파일, FileUtil.java, JSFunction.java 추가
    4.  MVC2 방식 게시판 : 서블릿 ListController.java 추가, 뷰 List.jsp 추가
    5.  MVC2 방식 게시판 : 서블릿 WriteController.java 추가, 뷰 Write.jsp 추가
    6.  MVC2 방식 게시판 : 서블릿 ViewController.java 추가, 뷰 View.jsp 추가
    7.  MVC2 방식 게시판 : 서블릿 DownloadController.java 추가, 서블릿 PassController 추가, 뷰 Pass.jsp 추가