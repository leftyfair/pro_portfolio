<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${contextPath}/resources/js/board/review.js"></script>
<script src="${contextPath}/resources/js/reply/movieReply.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/detailImage.css">
<div class="row">
	<div class="col-4">
		<img class="img-fluid" src="${movieMap.image}">
	</div>
	<div class="col">
		<div class="row">
			<div class="col">
				<div>
                    <h4>${movieMap.title}</h4>
                    <p>${movieMap.subtitle}</p>
                    <p>관람객 평점<img class="mx-1" src="${contextPath}/resources/image/rating.png">${movieMap.userRating}</p>
                    <p><b>개봉일</b> : ${movieMap.pubDate} 개봉</p>
                    <p><b>감독</b> : ${movieMap.director}</p>
                    <p><b>출연</b> : ${movieMap.actor}</p>
                </div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="replyForm">
					<table class="table">
						<tr>
							<td class="col-md-1 text-center align-middle">
								<b>${auth.id}</b>
								<input type="hidden" class="reply_writer form-control ml-2" value="${auth.id}">
							</td>
							<td class="col-md-9">
								<textarea rows="3" class="form-control reply_content" placeholder="댓글을 작성해주세요."></textarea>
							</td>
							<td colspan="2"><button class="btn btn-primary btn-lg row-1 reply_write">댓글등록</button></td>
						</tr>
					</table>
				</div>
				<div class="replyList">
					<div class="card">
						<div class="card-header bg-warning text-white">댓글목록</div>
						<div class="card-body">
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="../layout/footer.jsp"%>