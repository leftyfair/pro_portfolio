<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="auth" value="${sessionScope.auth}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/common.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	const contextPath = "${contextPath}";
	let auth = {
			id : "${auth.id}", 
			grade : "${auth.grade}"
	}
</script>

<style>
	body {
			background-image: url("${contextPath }/resources/image/backImg.jpg");
			background: cover;
		}
</style>
<script src="${contextPath}/resources/js/common.js"></script>
</head>
<body data-spy="scroll" data-target=".replyForm">
<div class="container bg-white pb-3">
	<div class="d-flex justify-content-between mb-5">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" href="${contextPath}/home">HOME</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/movie">영화검색</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/board/list">자유게시판</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="https://www.lottecinema.co.kr/NLCHS/" target="_blank" rel="noopener noreferrer"><img alt="롯데시네마" style="width: 100px" src="${contextPath}/resources/image/lottecinema.png"></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="https://www.lottecinema.co.kr/NLCHS/Ticketing" target="_blank" rel="noopener noreferrer">예매하기</a>
			</li>
		</ul>
		<!-- 로그인, 로그아웃 회원가입 -->
  <ul class="nav nav-tabs">
    <c:if test="${empty auth }">
	    <li class="nav-item"> <!-- 세션값이 없을 때 -->
	      <a class="nav-link" href="${contextPath }/member/joinForm">회원가입</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="${contextPath }/member/loginForm">로그인</a>
	    </li>
    </c:if>
    
  <c:if test="${not empty auth }"> <!-- 세션값이 있을 때 -->
    <li class="nav-item">
    	<span class="nav-link"><b>${auth.id }</b>님 로그인 중</span>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/myPage">나의정보보기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/logout">로그아웃</a>
    </li>
  </c:if>
  </ul>
</nav>
</div>
</html>
