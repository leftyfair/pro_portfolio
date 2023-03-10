<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/detailImage.css">
${movieMap }
        <div class="text-center mb-5">
			<hr>
         	<h1 class="text-center">${movieMap.title}</h1>
			<hr>
		</div>
        <div class="row">
            <div class="col-4"><img class="img-fluid" src="${movieMap.image}" alt=""></div>
            <div class="col-8">
                <div>
                    <h4>${movieMap.title}</h4>
                    <p>${movieMap.subtitle}</p>
                    <p>관람객 평점<img class="mx-1" src="${contextPath}/resources/image/rating.png">${movieMap.userRating}</p>
                    <p><b>개봉일</b> : ${movieMap.pubDate} 개봉</p>
                    <p><b>감독</b> : ${movieMap.director}</p>
                    <p><b>출연</b> : ${movieMap.actor}</p>
                </div>
                <div>
                   <p><b>영화링크</b> : <a href="${movieMap.link}" target="_blank">${movieMap.link}</a></p>
                </div>
                <div>
                   <a href="${contextPath}/board/reviewDetail?listNumber=${idx}"><button class="btn btn-primary">REVIEW</button></a>
                   <a href="https://www.lottecinema.co.kr/NLCHS/Ticketing" target="_blank"><button class="btn btn-danger ml-3">예매하기</button></a>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center my-5">
            <a class="btn btn-secondary prev" href="${contextPath}/board/viewDetail?listNumber=${idx - 1}">< Prev</a>
            <a class="btn btn-secondary next ml-3">Next > </a>
        </div>
        
<%@ include file="../layout/footer.jsp" %>


<script>
/* $(function() {
	$('.next').click(function() {
			$(this).attr('href', '${contextPath}/board/viewDetail?listNumber=${idx + 1}');
	});
}); */
</script>
