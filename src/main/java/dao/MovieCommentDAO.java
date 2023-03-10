package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import common.ConnectionUtil;
import domain.MovieCommentVO;

public class MovieCommentDAO {

	 private DataSource dataSource;

	    public MovieCommentDAO() {
	        dataSource = ConnectionUtil.getDataSource();
	    }

	    public void insertComment(MovieCommentVO vo) {
	        String query = "INSERT INTO movie_comments (id, mno, title, diretor, comment_text) VALUES (?, ?, ?, ?, ?)";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query);) {
	            pstmt.setInt(1, vo.getId());
	            pstmt.setInt(2, vo.getMno());
	            pstmt.setString(3, vo.getTitle());
	            pstmt.setString(4, vo.getDirector());
	            pstmt.setString(5, vo.getCommentText());
	            pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public void updateComment(MovieCommentVO vo) {
	        String query = "UPDATE movie_comments SET title=?, diretor=?, comment_text=? WHERE id=?";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query);) {
	            pstmt.setString(1, vo.getTitle());
	            pstmt.setString(2, vo.getDirector());
	            pstmt.setString(3, vo.getCommentText());
	            pstmt.setInt(4, vo.getId());
	            pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public void deleteComment(int id) {
	        String query = "DELETE FROM movie_comments WHERE id=?";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query);) {
	            pstmt.setInt(1, id);
	            pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public List<MovieCommentVO> getCommentList(int mno) {
	        List<MovieCommentVO> list = new ArrayList<>();
	        String query = "SELECT * FROM movie_comments WHERE mno=?";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query);
	             ResultSet rs = pstmt.executeQuery();) {
	            pstmt.setInt(1, mno);
	            while (rs.next()) {
	                MovieCommentVO vo = MovieCommentVO.builder()
	                        .id(rs.getInt("id"))
	                        .mno(rs.getInt("mno"))
	                        .title(rs.getString("title"))
	                        .director(rs.getString("diretor"))
	                        .commentText(rs.getString("comment_text"))
	                        .commentDate(rs.getDate("comment_date"))
	                        .build();
	                list.add(vo);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
}
