<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 24.
  Time: 오후 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="dbConn.jsp"%>

<%-- 여러개의 데이터를 한번에 입력 시 --%>

<%
  // 입력할 데이터 생성
  List<Map<String, String>> datas = new ArrayList<Map<String, String>>();

  for (int i = 11; i <= 20; i++) {
    Map<String, String> user = new HashMap<String, String>();
    user.put("id", "test" + i);
    user.put("pass", "1234");
    user.put("name", "테스터" + i);

    datas.add(user);
  }
%>

<%-- Statement 를 사용하여 여러개의 데이터를 한번에 입력 시 --%>
<%--<%--%>
<%--  try {--%>
<%--//    for문을 사용하여 Statement 객체를 10번 생성--%>
<%--//    실제 데이터베이스의 성능이 떨어지게 됨--%>
<%--    for (int i = 0; i < datas.size(); i++) {--%>
<%--      Statement stmt = null;--%>
<%--      String sql = "INSERT INTO member (id, pass, name, regidate) ";--%>
<%--      sql += "VALUES ('"+ datas.get(i).get("id") +"', '"+ datas.get(i).get("pass") +"', '"+ datas.get(i).get("name") +"', now()) ";--%>

<%--      stmt = conn.createStatement();--%>
<%--      stmt.executeUpdate(sql);--%>
<%--      stmt.close();--%>
<%--    }--%>
<%--  }--%>
<%--  catch (SQLException e) {--%>

<%--  }--%>
<%--  finally {--%>
<%--    if (conn != null) {--%>
<%--      conn.close();--%>
<%--    }--%>
<%--  }--%>
<%--%>--%>

<%-- 여러개의 데이터를 PreparedStatement로 입력 시  (1 번 방식) --%>
<%--<%--%>
<%--  try {--%>
<%--//    위의 Statement 방식과 동일하기 때문에 데이터베이스의 성능이 떨어짐--%>
<%--    for (int i = 0; i <= datas.size(); i++) {--%>
<%--      PreparedStatement pstmt = null;--%>
<%--      String sql = "INSERT INTO member (id, pass, name, regidate) ";--%>
<%--      sql += "VALUES (?, ?, ?, now()) ";--%>

<%--      pstmt = conn.prepareStatement(sql);--%>
<%--      pstmt.setString(1, datas.get(i).get("id"));--%>
<%--      pstmt.setString(2, datas.get(i).get("pass"));--%>
<%--      pstmt.setString(3, datas.get(i).get("name"));--%>

<%--      pstmt.executeUpdate();--%>
<%--      pstmt.close();--%>
<%--    }--%>
<%--  }--%>
<%--  catch (SQLException e) {--%>
<%--    out.println(e.getMessage());--%>
<%--  }--%>
<%--  finally {--%>
<%--    if (conn != null) { conn.close(); }--%>
<%--  }--%>

<%--%>--%>

<%-- 여러개의 데이터를 PreparedStatement로 입력 시  (2 번 방식) --%>
<%
  PreparedStatement pstmt = null;
  String sql = "INSERT INTO member (id, pass, name, regidate) ";
  sql += "VALUES (?, ?, ?, now()) ";

//    clearParameters() : PreparedStatement 사용하여 여러 번 데이터를 수정하여 입력 시 setXXX() 메소드를 사용하여 ? 에 입력한 데이터를 삭제
//    addBatch() : PreparedStatement 사용하여 여러 번 데이터를 수정하여 입력 시 executeUpdate()로 여러번 데이터베이스로 sql문을 전달하는 것이 아닌 메모리 상에 저장해놓고 executeBatch() 호출 시 한번에 전달하는 방식
//    executeBatch() : addBatch() 를 사용하여 데이터를 메모리에 저장해 놓은 것을 데이터베이스로 한번에 전달
  try {
    pstmt = conn.prepareStatement(sql);

//    반복문으로 executeUpdate()와 clearParameters()를 반복 실행
//    for (int i = 0; i < datas.size(); i++) {
//      pstmt.setString(1, datas.get(i).get("id"));
//      pstmt.setString(2, datas.get(i).get("pass"));
//      pstmt.setString(3, datas.get(i).get("name"));
//      pstmt.executeUpdate();
//      pstmt.clearParameters();
//    }

//    반복문을 사용하여 addBatch()와 clearParameters() 를 반복 실행하여 메모리에 데이터를 반복적으로 저장
    for (int i = 0; i < datas.size(); i++) {
      pstmt.setString(1, datas.get(i).get("id"));
      pstmt.setString(2, datas.get(i).get("pass"));
      pstmt.setString(3, datas.get(i).get("name"));
      pstmt.addBatch();
      pstmt.clearParameters();
    }
//    executeBatch() 를 실행하여 addBatch()로 메모리에 저장된 모든 내용을 한번에 데이터베이스로 전달
    pstmt.executeBatch();
  }
  catch (SQLException e) {
    out.println(e.getMessage());
  }
  finally {
    if (pstmt != null) { pstmt.close(); }
    if (conn != null) { conn.close(); }
  }
%>











