package service;

import java.util.List;

import dao.MovieCommentDAO;
import domain.MovieCommentVO;

public class MovieCommentService {
	
	private MovieCommentDAO dao = new MovieCommentDAO();
	
	public void insertComment(MovieCommentVO vo) {
		dao.insertComment(vo);
	}
	
	public void updateComment(MovieCommentVO vo) {
		dao.updateComment(vo);
	}
	
	public void deleteComment(int id) {
		dao.deleteComment(id);
	}
	
	public List<MovieCommentVO> getCommentList(int mno) {
		return dao.getCommentList(mno);
	}
	
}
