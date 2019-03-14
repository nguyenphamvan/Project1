package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import connect.DBConnect;
import model.News;

public class NewsDAO {
	
	public ArrayList<News> getListNews() throws SQLException{
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM news";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<News> list = new ArrayList<>();
		while (rs.next()) {
			News news = new News();
			news.setNews_id(rs.getLong("news_id"));
			news.setNews_title(rs.getString("news_title"));
			news.setTime_update(rs.getDate("time_update"));
			news.setContent1(rs.getString("news_content1"));
			news.setContent2(rs.getString("news_content2"));
			news.setImageName(rs.getString("news_image"));
			list.add(news);
		}
		return list;
	}
	
	public News getListNewsById(long news_id) throws SQLException{
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM news WHERE news_id = '"+news_id+"'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		News news = new News();
		while (rs.next()) {
			
			news.setNews_id(rs.getLong("news_id"));
			news.setNews_title(rs.getString("news_title"));
			news.setTime_update(rs.getDate("time_update"));
			news.setContent1(rs.getString("news_content1"));
			news.setContent2(rs.getString("news_content2"));
			news.setImageName(rs.getString("news_image"));
		}
		return news;
	}
	
	public boolean insertNews(News n) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO news(news_title,time_update,news_content1,news_content2,news_image) "
				+ "VALUES(?,?,?,?,?);";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setString(1, n.getNews_title());
			ps.setDate(2, n.getTime_update());
			ps.setString(3, n.getContent1());
			ps.setString(4, n.getContent2());
			ps.setString(5, n.getImageName());
			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
		}
		return false;
	}
	
	public boolean updateNews(News n) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE news SET news_title = ?,time_update = ?,news_content1 = ?,news_content2 = ?,news_image = ?\r\n" + 
				"WHERE news_id = ?;";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setString(1, n.getNews_title());
			ps.setDate(2, n.getTime_update());
			ps.setString(3, n.getContent1());
			ps.setString(4, n.getContent2());
			ps.setString(5, n.getImageName());
			ps.setLong(6, n.getNews_id());
			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
		}
		return false;
	}
	
	public boolean deleteNews(long news_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "DELETE FROM news WHERE news_id = ?";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setLong(1, news_id);
			return ps.executeUpdate()==1;
		} catch (Exception e) {

		}
		
		return false;
	}
	
	public static void main(String[] args) throws SQLException {
		boolean newsDAO = new NewsDAO().updateNews(new News(3,"Facebook Messenger mắc lỗi lạ xuất hiện tin nhắn cũ khiến người dùng bối rối",
				null,
				"Theo phản ánh của nhiều người dùng Facebook thì những ngày gần đây họ bất ngờ nhận được những tin nhắn mà đã được gửi từ cách đây nhiều năm, có trường hợp tin nhắn đã gửi từ cách đây 5 đến 7 năm. Những tin nhắn này bất ngờ xuất hiện trở lại trên công cụ nhắn tin Messenger của Facebook dưới dạng các tin nhắn mới chưa đọc.",
				"Tình trạng này khiến nhiều người dùng Facebook cảm thấy bối rối, thậm chí có trường hợp họ tưởng rằng đó là các tin nhắn vừa được gửi trước khi nhận ra đây là những tin nhắn cũ bất ngờ “đội mồ sống dậy”. Tình trạng này chỉ gặp phải với người dùng Facebook trên web ở máy tính chứ không gặp phải trên ứng dụng Messenger ở di động.\r\n" + 
				"\r\n" + 
				"Đại diện Facebook sau đó đã lên tiếng xác nhận lỗi gặp phải với Messenger trên nền web máy tính và đưa ra lời xin lỗi với người dùng.\r\n" + 
				"\r\n" + 
				"“Một vài người dùng đang nhận được những tin nhắn cũ trên Facebook.com. Chúng tôi đã ghi nhận được vấn đề và đang làm việc tích cực để xử lý vấn đề sớm nhất có thể. Chúng tôi xin lỗi vì sự bất tiện này”, đại diện của Facebook cho biết.",
				"tin-nhan-facebook.jpg"));
		System.out.println(newsDAO);
//		for(News news : newsDAO.getListNews()) {
//			System.out.println(news.getContent1());
//		}
	}

}
