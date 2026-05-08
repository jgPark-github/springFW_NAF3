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
	    // msgType에 데이터가 있다면
	    if (${!empty msgType}) {
	        $("#messageType").attr("class", "modal-content panel-warning");
	        $("#myMessage").modal("show");
	    }
	});

  	function registerCheck(){
  		var memId = $("#memId").val();
  		/* if (memId.trim() === ""){
  			alert("체크할 ID를 입력하세요!");
  			$("#memId").focus();
  			return false;
  		} */
  		
  		 if (memId.trim() === ""){
  		   $("#checkMessage").html("체크할 ID를 입력하세요!");
		   $("#checkType").attr("class","modal-content panel-warning");  	
		   $("#myModal").modal("show");
		   return false;
  		 }
  		
  		$.ajax({
  			url : "${contextPath}/memRegisterCheck.do",
  			type : "get",
  			data : {"memId" : memId},
  			success : function(result){
  				//ID중복체크(0:ID중복, 1:ID 사용가능)
  				alert("result: " +result);
  				if(result == 1){
  					$("#checkMessage").html("사용할 수 있는 아이디입니다.");
  					$("#checkType").attr("class","modal-content panel-success");
  				} else {
  					$("#checkMessage").html("사용할 수 없는 아이디입니다.");
  					$("#checkType").attr("class","modal-content panel-warning");
  				}
  				//모달폼 띄우기
  				$("#myModal").modal("show");
  			},
  			error: function(){
  				alert("error");
  			}
  		})
  	}
  	
  	function passwordCheck(){
  		var memPassWord1 = $("#memPassWord1").val();
  		var memPassWord2 = $("#memPassWord2").val();
  		
  		if (memPassWord1 != memPassWord2){
  			$("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
  		} else {
  			$("#passMessage").html("동일비번");
  			// hidden값에 패스워드저장
  			$("#memPassWord").val(memPassWord1);
  		}
  		
  	}
  	
  	function goInsert(){
  		var memAge=$("#memAge").val();
  		if (memAge==null || memAge=="" || memAge ==0){
  			alert("나이를 입력하세요!!");
  			return false;
  		}
  		document.frm.submit(); //폼에 전송
  	}
  </script>
</head>
<body>


<div class="container">
<!-- 헤더 네이게이션 페이지 include -->
<jsp:include page="../common/header.jsp"></jsp:include>

  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">회원가입</div>
    <div class="panel-body">
    	<form name="frm" action="${contextPath}/memRegister.do" method="post">
    	<input type="hidden" id="memPassWord" name="memPassWord"/>
    		<table class="table table-bordered" style="text-align: center; border:1px solid #dddddd;">
    			<tr>
    				<td style="width:110px; vertical-align: middle;">아이디</td>
    				<td><input id="memId" name="memId" class="form-control" type="text" maxlength="20" placeholder="아이디입력하세요."/></td>
    				<td style="width:110px;"><button type="button" class="btn btn-primary btn-sm" onclick="registerCheck()">중복확인</button></td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">비밀번호</td>
    				<td colspan="2"><input id="memPassWord1" name="memPassWord1" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">비밀번호확인</td>
    				<td colspan="2"><input id="memPassWord2" name="memPassWord2" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 확인하세요."/></td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">사용자 이름</td>
    				<td colspan="2"><input id="memName" name="memName" class="form-control" type="text" maxlength="20" placeholder="이름을 입력하세요."/></td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">나이</td>
    				<td colspan="2"><input id="memAge" name="memAge" class="form-control" type="number" maxlength="20" placeholder="나이를 입력하세요." /></td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">성별</td>
    				<td colspan="2">
    					<div class="form-group" style="text-align: center; margin: 0 auto";>
    						<div class="btn-group" data-toggle="buttons">
    							<label class="btn btn-primary active">
    								<input id="memGender" name="memGender" type="radio" autocomplete="off" value="남자" checked/>남자
    							</label>
    							<label class="btn btn-primary">
    								<input id="memGender" name="memGender" type="radio" autocomplete="off" value="여자"/>여자
    							</label>
    						</div>
    					</div>
    				</td>
    			</tr>
    			<tr>
    				<td style="width:110px; vertical-align: middle;">e-mail</td>
    				<td colspan="2"><input id="memEmail" name="memEmail" class="form-control" type="text" maxlength="20" placeholder="e-mail를 입력하세요." autocomplete="off"/></td>
    			</tr>
    			<tr>
    				<td colspan="3" style="text-align: left;">
    				<span id="passMessage" style="color: red"></span><input type="button" class="btn btn-primary btn-sm pull-right" value="등록" onclick="goInsert();"/>
    				</td>
    			</tr>    			
    		</table>
    	</form>
    </div>
    
    <!-- Modal 다이얼로그창 -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div id="checkType" class="modal-content">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">메시지 확인</h4>
	      </div>
	      <div class="modal-body">
	        <p id="checkMessage"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>    
    <!-- 실패 메시지를 출력(modal) -->
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
    <div class="panel-footer">스프1탄_인프론(박매일)</div>
  </div>
</div>

</body>
</html>