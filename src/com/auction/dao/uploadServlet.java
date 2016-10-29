package com.auction.dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.auction.utils.DBHelper;
import com.auction.utils.Tools;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * 
 * @author weijia
 * @func 处理文件的上传
 */
@WebServlet("/uploadServlet")
public class uploadServlet extends HttpServlet {
	private static final long serialVersionUID = -4385597224138999842L;
	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "upload";
	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 10; // 10MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/html;charset=UTF-8");
		//存储拍品信息
		String auction_name=null;
		Double starting_price=0.0;
		Double reserve_price = 0.0;
		Double markup= 1.0;
		String owner_name = null;
		String contact_phone = null;
		String password = null;
		Boolean isContactSecrecy=false;
		String description = null;
		String img_url = null;
		
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 如果不是则停止
			PrintWriter writer = response.getWriter();
			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
			return;
		}
		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// 构造临时路径来存储上传的文件
		// 这个路径相对当前应用的目录
		String uploadPath = getServletContext().getRealPath("./")
				+ File.separator + UPLOAD_DIRECTORY;

		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = Tools.getTime() + ".jpg";//new File(item.getName()).getName();
                        img_url = UPLOAD_DIRECTORY+"/"+fileName;	//图片地址
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        //System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                    }
                    //获取表单中非文件的值
                    if (item.isFormField()) {
    					String formname = item.getFieldName();// 获取form中的名字
    					String formcontent = new String(item.getString("UTF-8"));
    					if(formname.equals("auction_name"))
    						auction_name=formcontent;
    					if(formname.equals("starting_price"))
    						starting_price = Double.parseDouble(formcontent);
    					if(formname.equals(reserve_price))
    						reserve_price = Double.parseDouble(formcontent);
    					if(formname.equals("markup"))
    						markup = Double.parseDouble(formcontent);
    					if(formname.equals("owner_name"))
    						owner_name = formcontent;
    					if(formname.equals("contact_phone"))
    						contact_phone = formcontent;
    					if(formname.equals("password"))
    						password = formcontent;
    					if(formname.equals("isContactSecrecy"))
    						isContactSecrecy=(formcontent.equals("on")?true:false);
    					if(formname.equals("description"))
    						description = formcontent;
    				}
                }
            }
            //将信息发布到数据库中
            DBHelper.postAuction(auction_name,starting_price,reserve_price,img_url,markup,owner_name,contact_phone,password,isContactSecrecy,description);
            request.setAttribute("isSuccess",true);
        } catch (Exception ex) {
        	request.setAttribute("isSuccess", false);
            request.setAttribute("reason",ex.getMessage());
            ex.printStackTrace();
        }
		
			
        // 跳转到 message.jsp
        getServletContext().getRequestDispatcher("/upload_complete.jsp").forward(
                request, response);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
