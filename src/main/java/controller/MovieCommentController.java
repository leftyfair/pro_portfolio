package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.MovieCommentVO;
import service.MovieCommentService;

@WebServlet("/comment/*")
public class MovieCommentController extends HttpServlet {

    private MovieCommentService service;
    private Gson gson;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        service = new MovieCommentService();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String contextPath = request.getContextPath();
        String pathInfo = request.getPathInfo();
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();

        if (pathInfo == null || pathInfo.equals("/")) {
            out.print(gson.toJson("잘못된 요청입니다."));
        } else if (pathInfo.equals("/list")) {
            String mno = request.getParameter("mno");
            List<MovieCommentVO> commentList = service.getCommentList(Integer.parseInt(mno));
            out.print(gson.toJson(commentList));
        } else if (pathInfo.equals("/write")) {
            int mno = Integer.parseInt(request.getParameter("mno"));
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            String commentText = request.getParameter("commentText");

            MovieCommentVO vo = MovieCommentVO.builder()
                    .mno(mno)
                    .title(title)
                    .director(director)
                    .commentText(commentText)
                    .build();

            service.insertComment(vo);
            out.print(gson.toJson("댓글 등록 성공"));
        } else if (pathInfo.equals("/update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String commentText = request.getParameter("commentText");

            MovieCommentVO vo = MovieCommentVO.builder()
                    .id(id)
                    .commentText(commentText)
                    .build();

            service.updateComment(vo);
            out.print(gson.toJson("댓글 수정 성공"));
        } else if (pathInfo.equals("/delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.deleteComment(id);
            out.print(gson.toJson("댓글 삭제 성공"));
        } else {
            out.print(gson.toJson("잘못된 요청입니다."));
        }

        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}