package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchAdminServlet")
public class SearchAdminServlet extends HttpServlet {
	
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyWord = request.getParameter("keyWord");
		String command = request.getParameter("command");
		request.setAttribute("keyWord", keyWord);
		RequestDispatcher rd = null;
		switch (command) {
		case "searchProduct":
			rd = request.getRequestDispatcher("/admin/searchProduct.jsp");
			break;
		case "searchUser":
			rd = request.getRequestDispatcher("/admin/searchUser.jsp");
			break;
		case "searchBill":
			rd = request.getRequestDispatcher("/admin/searchBill.jsp");
			break;

		default:
			break;
		}
		rd.forward(request, response);
		
    	
	}

}
