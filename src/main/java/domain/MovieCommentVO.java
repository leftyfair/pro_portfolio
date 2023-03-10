package domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MovieCommentVO {
	private int id;
	private int mno;
	private String title;
	private String director;
	private String commentText;
	private Date commentDate;
}