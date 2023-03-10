<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
	
	<div class="text-center mb-5">
		<hr>
		<h1>자유게시판</h1>
		<hr>
	</div>
	
	<form id="listForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>파일</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${list}" var="b">
			
				<tr>
					<td>${b.bno }</td>
					<td>
						<a href="${contextPath }/board/detail?bno=${b.bno}">${b.title }
							<b>${b.replyCount != 0 ? '['+=b.replyCount +=']':''}</b>
						</a>
					</td>
					<td>${b.writer }</td>
					<td>${b.imageFileName }</td>
					<td>${b.writeDate }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<a href="${contextPath}/board/writeForm" class="btn btn-primary">글쓰기</a>


<%@ include file="../layout/footer.jsp" %>