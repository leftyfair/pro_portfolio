$(function() {
    // 영화 정보 가져오기
	let title = $('input[name="title"]').val();
    // 댓글 쓰기
    $('.reply_write').on('click', function() {
        let writer = $('.reply_writer').val();
        let content = $('.reply_content').val();

        let MovieCommentVO = {
            writer: writer,
            content: content
        };

        movieComment.write(MovieCommentVO);
    });

    // 댓글 목록
    movieComment.list(title);

    // 댓글 수정 버튼 이벤트
    $('.replyList').on('click', '.reply_modBtn', function() {
        let rno = $(this).closest('div').data('rno');
        let content = $('.reply_content').val();

        let MovieCommentVO = {
            mno: mno,
            content: content
        };

        movieComment.modify(MovieCommentVO);
    });

    // 댓글 삭제 버튼 이벤트
    $('.replyList').on('click', '.reply_delBtn', function() {
        let mno = $(this).closest('div').data('mno');

        let MovieCommentVO = {
            rno: mno
        };

        movieComment.remove(MovieCommentVO);
    });
});