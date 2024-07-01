<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 리다이렉트 시 전달할 데이터, request 영역에 저장, 이 데이터는 리다이렉트로 열린 페이지에서 확인할 수 없음 --%>
<c:set var="requestVar" value="리다이렉트한 데이터" scope="request"></c:set>
<c:redirect url="./inc/OtherPage.jsp">
  <c:param name="user_param1" value="출판사"></c:param>
  <c:param name="user_param2" value="골든레빗"></c:param>
</c:redirect>











