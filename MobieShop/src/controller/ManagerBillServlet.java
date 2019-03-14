package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDAO;
import dao.ProductDAO;
import model.Product;

@WebServlet("/ManagerBillServlet")
public class ManagerBillServlet extends HttpServlet {
		private final BillDAO billDAO = new BillDAO();
		private final ProductDAO productDAO = new ProductDAO();
       
   
    public ManagerBillServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        long billID = Long.parseLong( request.getParameter("bill_id"));
        String status = request.getParameter("status");
        try {
			billDAO.updateBill(billID, new Timestamp(new Date().getTime()), status);
		} catch (SQLException e) {
			e.printStackTrace();
		}
        response.sendRedirect("admin/manager_bill.jsp");

		doGet(request, response);
	}

}
