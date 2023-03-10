package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import api.MovieApi;
import dao.MovieDao;

@WebServlet("/movie")
public class MainController extends HttpServlet {
	
	private MovieApi movieApi;
	private MovieDao movieDao; 
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		movieApi = new MovieApi();
		movieDao = (MovieDao) config.getServletContext().getAttribute("movieDao");
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			mainApi(request);
 			request.getRequestDispatcher("/WEB-INF/views/movie.jsp").forward(request, response);
	}
	
	public void mainApi(HttpServletRequest request) {
		String clientId = "Cw6IJAYORJJLDXtt_aks"; //애플리케이션 클라이언트 아이디
		String clientSecret = "5Do36SK6y7"; //애플리케이션 클라이언트 시크릿
		
		
		Integer num1 = 0;
		Integer num2 = 0;
		String mvSearch = request.getParameter("mv_search");
		String text = null;
		try {
			if (mvSearch == null) {
				text = URLEncoder.encode("ㅒ", "UTF-8");
			} else {
				text = URLEncoder.encode(mvSearch, "UTF-8");
			}
		    num1 = 2022;
		    num2 = 2023;
		} catch (UnsupportedEncodingException e) {
		    throw new RuntimeException("검색어 인코딩 실패",e);
		}
		
		String result = "";
		
		String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text /*+ "&yearfrom=" + num1 + "&yearto=" + num2 */; // JSON 결과
		//String apiURL = "https://openapi.naver.com/v1/search/movie.xml?query="+ text; // XML 결과
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = movieApi.get(apiURL, requestHeaders);
		Map fromJson = new Gson().fromJson(responseBody, Map.class);
		List<Map<String, String>> movieList = (List<Map<String, String>>) fromJson.get("items");

		// 이 방식은 검색이 기능 없을때 했음.
		// 문제점 - 검색한 뒤 또 다른걸 검색해서 상세 들어가면 기존의 데이터가 계속 있음
		// 슬랭덩크 -> 매트릭스 : 상세클릭(슬램덩크)
//		if(movieDao.getMovieList().isEmpty()) {
//			movieDao.getMovieList().addAll(movieList);
//		}
		
		// 조건을 없애고 기존의 데이터를 clear() 해줘서 비워줌
		movieDao.getMovieList().clear();
		movieDao.getMovieList().addAll(movieList);
		request.setAttribute("api",fromJson);
	}
}
