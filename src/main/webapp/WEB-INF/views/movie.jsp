<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
	<form  action="${contextPath}/movie" method="get" class="text-right mb-5">
	   	<hr>
		<input type="text" name="mv_search" placeholder="영화 검색" autofocus="autofocus">
		<button class="btn btn-primary search_btn">검색</button>
	   	<hr>
  	</form>
	<c:choose>
		<c:when test="${!empty api.items}">
			<div class="row mt-5">
				<c:forEach  begin="0" end="7" items="${api.items}" var="i" varStatus="status">
					<div class="col-md-3 mb-2">
						<a href="${contextPath}/board/viewDetail?listNumber=${status.index}">
							<img class="list_mid" src="${i.image}" alt="">
							<p>${i.title}</p>
						</a>
					</div>
				</c:forEach>
      		</div>
		</c:when>
		<c:otherwise>
			<h1 class="text-center jumbotron bg-light">검색한 영화가 없습니다.</h1>
		</c:otherwise>
	</c:choose>

<%@ include file="layout/footer.jsp" %>

