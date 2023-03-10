let apiMovie = {
	
	list : function () {
		$.ajax({
			/*
			type : 'get',
			url : 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
			data : {
				key : '88c59aa27ae6bacdf7780d55660dc441',
				targetDt : '20221201',
				itemPerPage : '10'
			},
			success : function(result) {
				console.log(result);
			},
			error : function() {
				console.log("실패");
			}
			*/
			
			type : 'get',
			url : 'https://openapi.naver.com/v1/search/blog.json',
			data : {
				H : "X-Naver-Client-Id: {Cw6IJAYORJJLDXtt_aks}",
				H : "X-Naver-Client-Secret: {5Do36SK6y7}"
			},
			success : function(result) {
				console.log(result);
			},
			error : function() {
				console.log("실패");
			}
		});
	},
}



