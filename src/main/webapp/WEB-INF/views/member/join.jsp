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
</head>
<body>


<div class="container">
<!-- 헤더 네이게이션 페이지 include -->
<jsp:include page="../common/header.jsp"></jsp:include>

  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">회원가입</div>
    <div class="panel-body">
    	<form action="${contextPath}/memRegister.do" method="post">
    		<table class="table table-bordered" style="text-align: center; board:1px solid #dddddd;">
    			<tr>
    				<td style="width:110px; vertical-align: middle;">아이디</td>
    				<td><input id="memID" name="memID" class="form-control" type="text" maxlength="20" placeholder="아이디입력하세요."/></td>
    				<td style="width:110px;"><button class="btn btn-primary btn-sm" onclick="registerCheck()">중복확인</button></td>
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
    				<td colspan="2"><input id="memAge" name="memAge" class="form-control" type="text" maxlength="20" placeholder="나이를 입력하세요."/></td>
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
    				<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
    				</td>
    			</tr>    			
    		</table>
    	</form>
    </div>
    <div class="panel-footer">스프1탄_인프론(박매일)</div>
  </div>
</div>

</body>
</html>