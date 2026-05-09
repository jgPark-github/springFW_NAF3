<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		    // msgType에 데이터가 있다면 메시지 팝업(로그인관련된 메시지가 있다면 팝업)
		    if (${!empty msgType}) {
		        $("#messageType").attr("class", "modal-content panel-warning");
		        $("#myMessage").modal("show");
		    }
		});
  </script>
  
</head>
<body>

<div class="container">

<!-- 헤더 네이게이션 페이지 include -->
<jsp:include page="../common/header.jsp"></jsp:include>

  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">로그인화면</div>
    <div class="panel-body">
    	<form action="${contextPath}/memLogin.do" method="post">
    		<!-- <input type="hidden" id="memPassWord" name="memPassWord"/> -->
    		<table class="table table-bordered" style="text-align: center; border:1px solid #dddddd;">
    			<tr>
    				<td style="width:110px; vertical-align: middle;">아이디</td>
    				<td><input id="memId" name="memId" class="form-control" type="text" maxlength="20" placeholder="아이디입력하세요."/></td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">비밀번호</td>
    				<td colspan="2"><input id="memPassWord" name="memPassWord" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>
    			</tr>
    			<tr>
    				<td colspan="2" style="text-align: left;">
    				<input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인"/>
    				</td>
    			</tr>    			
    		</table>
    	</form>

    <!-- 로그인 성공/실패시 메시지 팝업 -->
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
	
    </div>
    <div class="panel-footer">스프1탄_인프론(박매일)</div>
  </div>
</div>

</body>
</html>