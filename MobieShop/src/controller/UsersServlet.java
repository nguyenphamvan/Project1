package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import dao.UsersDAO;
import model.Users;
import tools.MD5;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	UsersDAO usersDAO = new UsersDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		String url = "";
		try {
			switch (command) {
			case "destroysession":
				url = "/index.jsp";
				session.removeAttribute("user");
				break;
			}
		} catch (Exception e) {
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		String url = "";
		Users users = new Users();
		HttpSession session = request.getSession();
		switch (command) {
		case "Register":
			users.setUserID(new java.util.Date().getTime());
			users.setUserName(request.getParameter("yourname"));
			users.setUserPhone(request.getParameter("yourphone"));
			users.setUserAddress(request.getParameter("youraddress"));
			users.setUserPass(MD5.encryption(request.getParameter("yourpass")));
			users.setUserBirth(request.getParameter("yourbirth"));
			users.setUserSex(request.getParameter("sex"));
			users.setUserRole(false);
			try {
				usersDAO.insertUser(users);
				session.setAttribute("user", users);
				url = "/index.jsp";
			} catch (SQLException e) {

				e.printStackTrace();
			}

			break;
			case "login":
				try {
					users = usersDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("pass")));
					if (users != null) {
						session.setAttribute("user", users);
						url = "/index.jsp";
					} else {
						request.setAttribute("error", "Email hoac mat khau khong dung!");
						url = "/login.jsp";
					}
				} catch (SQLException e) {
	
					e.printStackTrace();
				}
	
				break;
		case "updateInfo":
			try {
				Users user = new Users(Integer.parseInt(request.getParameter("user_id")),
						request.getParameter("youremail"), null, request.getParameter("yourname"),
						request.getParameter("yourphone"), request.getParameter("yourbirth"),
						request.getParameter("youraddress"), request.getParameter("sex"), false);
				usersDAO.updateUserInfo(user);
				session.setAttribute("user", users);
				url = "/profile.jsp";
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "updatePassword":
			try {
				Users u = (Users) session.getAttribute("user");
				if(MD5.encryption(request.getParameter("old_pass")).equals(u.getUserPass())) {
					if(request.getParameter("new_pass").equals(request.getParameter("confirm_newpass"))) {
						usersDAO.updateUserPass(MD5.encryption(request.getParameter("new_pass")),u.getUserID());
						url = "/profile.jsp";
						Users user = usersDAO.getUserByEmail(u.getUserEmail());
						session.setAttribute("user", user);
					}else {
						request.setAttribute("error2", "Mat khau nhap lai khong khop!");
						url = "/changePassword.jsp";
					}
				}
				else {
					request.setAttribute("error", "Mat khau cu khong dung!");
					url = "/changePassword.jsp";
				}
				
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
//		response.sendRedirect(url);

	}

}
