<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Context Path 저장 -->
<c:set var="contextPath" value= "${pageContext.request.contextPath}" />

<!-- 상단헤더 네비게이션 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">스프1탄</a>
    </div>
    
    <!-- 최초 토글은닫힘상태고 -->
    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 이부분은 토글버튼 클릭할때 마다 메뉴가 접었다 펴졌다함 -->
      <ul class="nav navbar-nav">
      <!-- index.jsp 초기화면으로 간다 -->
        <li class="active"><a href="${contextPath}/">Home</a></li> <!-- 마우스올리면 글자가 반전됨 -->
        <li><a href="boardMain.do">게시판</a></li>
        <li><a href="#">Page 2</a></li>
      </ul>
     
      <c:if test="${empty mvo}"> <!-- 로그인 하지않음 -->
	      <ul class="nav navbar-nav navbar-right">
	        <!-- <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
	        <!-- <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
	        
	        <!-- drop-down방식 -->
	        <li class="dropdown"> 
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">접속하기 <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">로그인</a></li>
	            <li><a href="#">회원가입</a></li>
	          </ul>
	        </li>
	      </ul>
      </c:if>
      <c:if test="${!empty mvo}"> <!-- 로그인 함 -->
	      <ul class="nav navbar-nav navbar-right">
	        <!-- <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
	        <!-- <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
	        
	        <!-- drop-down방식 -->
	        <li class="dropdown"> 
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">회원정보수정</a></li>
	            <li><a href="#">프로필사진등록</a></li>
	            <li><a href="#">로그아웃</a></li>
	          </ul>
	        </li>
	      </ul>
      </c:if>
    </div>
    
  </div>
</nav>
<!-- 상단헤더 네비게이션 ED-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>