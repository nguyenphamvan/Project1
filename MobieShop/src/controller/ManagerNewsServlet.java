package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import dao.CategoryDAO;
import dao.NewsDAO;
import model.Category;
import model.News;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet("/ManagerNewsServlet")
public class ManagerNewsServlet extends HttpServlet {
	private static final String UPLOAD_DIR = "imageProduct";
       
	NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String news_id = request.getParameter("news_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    newsDAO.deleteNews(Long.parseLong(news_id));
                    url = "admin/manager_news.jsp";
                    break;
            }
        } catch (Exception e) {
        }
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(request, response);
        response.sendRedirect("/MobieShop/"+url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String news_id = request.getParameter("news_id");
        String title = request.getParameter("title");
        String content1 = request.getParameter("content1");
        String content2 = request.getParameter("content2");
        String imageName = uploadFile(request);

        String url = "";
        try {
            
                switch (command) {
                    case "insert":
                        newsDAO.insertNews(new News(System.currentTimeMillis(),title,new java.sql.Date(System.currentTimeMillis()),content1,content2,imageName));
                        url = "admin/manager_news.jsp";
                        break;
                    case "update":
                        newsDAO.updateNews(new News( Long.parseLong(news_id),title,new java.sql.Date(System.currentTimeMillis()),content1,content2,imageName));
                        url = "admin/manager_news.jsp";
                        break;
                }
        } catch (Exception e) {
        }
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(request, response);
        response.sendRedirect("/MobieShop/"+url);

    }
    
    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
        	
        	DiskFileItemFactory factory = new DiskFileItemFactory();
        	
        	 factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        	
            Part filePart = request.getPart("image");

            fileName = (String) getFileName(filePart);
           

            String applicationPath = getServletContext().getRealPath("");

            //File.separator: \ 
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
