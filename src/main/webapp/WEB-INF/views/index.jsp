<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Context Path 저장 -->
<c:set var="contextPath" value= "${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	 $(document).ready(function() {
	    // msgType에 데이터가 있다면 로그인성공메시지를 띄운다
	    if (${!empty msgType}) {
	        $("#messageType").attr("class", "modal-content panel-success");
	        $("#myMessage").modal("show");
	    }
	 });
	</script>
</head>
<body>

<div class="container">
<!-- 헤더 네이게이션 페이지 include -->
<jsp:include page="common/header.jsp"></jsp:include>
<%-- 로그인 안됐을 때 --%>
  <c:if test ="${empty mvo}"> 
  <h2>Spring MVC03</h3>
  </c:if>
<%-- 로그인 됐을 때 --%>
  <c:if test ="${!empty mvo}">
  <label>[사진삽입] "${mvo.memName}"님 방문을 환영합니다</label>
  </c:if>
  
  <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
  <p>Only when the button is clicked, the navigation bar will be displayed.</p>
</div>

    <div id="myMessage" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
</body>
</html>
