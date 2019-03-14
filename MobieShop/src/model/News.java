package model;

import java.sql.Date;

public class News {
	private long news_id;
	private String new_title;
	private Date time_update;
	private String content1;
	private String content2;
	private String imageName;
	
	
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public News(long news_id, String news_title, Date time_update, String content1,String content2, String imageName) {
		super();
		this.news_id = news_id;
		this.new_title = news_title;
		this.time_update = time_update;
		this.content1 = content1;
		this.content2 = content2;
		this.imageName = imageName;
	}
	public long getNews_id() {
		return news_id;
	}
	public void setNews_id(long news_id) {
		this.news_id = news_id;
	}
	public String getNews_title() {
		return new_title;
	}
	public void setNews_title(String news_title) {
		this.new_title = news_title;
	}
	public Date getTime_update() {
		return time_update;
	}
	public void setTime_update(Date time_update) {
		this.time_update = time_update;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	
	

}
