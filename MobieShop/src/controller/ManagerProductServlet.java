package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.ProductDAO;
import model.Product;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)

@WebServlet("/ManagerProductServlet")
public class ManagerProductServlet extends HttpServlet {
	ProductDAO productDAO = new ProductDAO();
	// Tên folder dẫn ảnh vào
	private static final String UPLOAD_DIR = "imageProduct";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		String product_id = request.getParameter("product_id");

		String url = "";
		try {
			switch (command) {

			case "delete":
				productDAO.deleteProduct(Long.parseLong(product_id));
				url = "/admin/manager_product.jsp";
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		String tenSanPham = request.getParameter("tenSanPham");
		long idNSX = Long.parseLong(request.getParameter("idNSX"));
		String anh1 = uploadFile(request, "anh1");
		String anh2 = uploadFile(request, "anh2");
		String anh3 = uploadFile(request, "anh3");
		String hdh = request.getParameter("hdh");
		String camara = request.getParameter("camara");
		String cpu = request.getParameter("cpu");
		String ram = request.getParameter("ram");
		String rom = request.getParameter("rom");
		long donGia = Long.parseLong(request.getParameter("donGia"));
		long quantity = Long.parseLong(request.getParameter("quantity"));

		String url = "";

		try {

			switch (command) {
			case "insert":
				productDAO.insertProduct(new Product(new Date().getTime(), idNSX, tenSanPham, anh1, anh2, anh3, hdh,
						camara, cpu, ram, rom, donGia, quantity));
				url = "/admin/manager_product.jsp";
				break;
			case "update":
				productDAO.updateProduct(new Product(Long.parseLong(request.getParameter("product_id")), idNSX,
						tenSanPham, anh1, anh2, anh3, hdh, camara, cpu, ram, rom, donGia, quantity));
				url = "/admin/manager_product.jsp";
				break;

			}
		} catch (Exception e) {
		}

		response.sendRedirect("/MobieShop/" + url);

	}

	private String uploadFile(HttpServletRequest request, String anh) throws IOException, ServletException {
		String fileName = "";
		try {

			DiskFileItemFactory factory = new DiskFileItemFactory();

			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			Part filePart = request.getPart(anh);

			fileName = (String) getFileName(filePart);

			String applicationPath = getServletContext().getRealPath("");

			// File.separator: \
			String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;

			File uploadDir = new File(basePath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			InputStream inputStream = null;
			OutputStream outputStream = null;
			try {
				File outputFilePath = new File(basePath + fileName);
				inputStream = filePart.getInputStream();
				outputStream = new FileOutputStream(outputFilePath);
				int read = 0;
				final byte[] bytes = new byte[1024];
				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
			} catch (Exception e) {
				e.printStackTrace();
				fileName = "";
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}
			}
		} catch (Exception e) {
			fileName = "";
		}
		return fileName;
	}

	private String getFileName(Part part) {
		final String partHeader = part.getHeader("content-disposition");
		System.out.println("*****partHeader :" + partHeader);
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
