let movieComment = {
  list: function (mno) {
    console.log("댓글목록");
    console.log("func list : " + mno);
    $.ajax({
      type: "get",
      url: `${contextPath}/comment/list`,
      data: { mno: mno },
      success: function (commentList) {
        commentListRender(commentList);
      },
      error: function () {
        // alert('댓글 목록 조회 실패');
      },
    }); // ajax end
  },

  detail: function (commentVO) {
    $.ajax({
      type: "post",
      url: `${contextPath}/comment/detail`,
      data: commentVO,
      success: function (detail) {
        let output = `<b>${commentVO.id}</b>`;
        /*let kk = $('.comment_content').html(output);
				alert(output);*/
      },
      error: function () {
        alert("댓글 목록 조회 실패");
      },
    }); // ajax end
  },

  write: function (commentVO) {
    $.ajax({
      type: "post",
      url: `${contextPath}/comment/write`,
      data: commentVO,
      success: function (result) {
        $(".comment_content").val("");
        $("#feedback").find("modal-body").html(result);
        $("#feedback").modal("show");
        movieComment.list(commentVO.mno);
      },
      error: function () {
        alert("댓글 등록 에러");
      },
    }); // ajax end
  },

  modify: function () {
    console.log("댓글수정");
  },

  remove: function (commentVO) {
    $.ajax({
      type: "post",
      url: `${contextPath}/comment/remove`,
      data: commentVO,
      success: function (result) {
        alert(result);
        movieComment.list(commentVO.mno);
      },
      error: function () {
        alert("삭제실패");
      },
    });
  },
};

function commentListRender(commentList) {
  let commentDiv = $(".comment_list");
  commentDiv.empty();

  for (let i = 0; i < commentList.length; i++) {
    let commentItem = commentList[i];

    let commentHTML = `<div class="card">
							<div class="card-body">
								<h5 class="card-title">${commentItem.title}</h5>
								<p class="card-text">${commentItem.commentText}</p>
								<p class="card-subtitle">${commentItem.director}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
										<button type="button" class="btn btn-sm btn-outline-secondary" onclick="movieComment.remove({id:${commentItem.id}, mno:${commentItem.mno}})">삭제</button>
									</div>
									<small class="text-muted">${commentItem.commentDate}</small>
								</div>
							</div>
						</div>`;
    commentDiv.append(commentHTML);
  }
}
