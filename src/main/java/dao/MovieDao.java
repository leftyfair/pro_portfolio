package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MovieDao {
	private List<Map<String, String>> movieList = new ArrayList<Map<String,String>>();
	
	public Map<String, String> findByIndex(int idx) {
		return movieList.get(idx);
	}
}
