package rentcar.controller.handler.event;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentcar.controller.Command;

public class EventWriteHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("get");
			
			return "/event/event_write.jsp";
		} else {
			System.out.println("post");
			
			response.setContentType("text/html; charsert=UTF8");
			PrintWriter out = response.getWriter();
			
			String savePath = "upload";
			int uploadFileSizeLimit = 5 * 1024 * 1024;
			String enctype = "UTF-8";
			
			ServletContext context = request.getSession().getServletContext(); //컨트롤러 인터페이스를 상속받아 처리하는 경우 request.getSession() 사용
			String uploadFilePath  = context.getRealPath(savePath);
			
			try {
				MultipartRequest multi = new MultipartRequest(
						request,
						uploadFilePath,
						uploadFileSizeLimit,
						enctype,
						new DefaultFileRenamePolicy()
						);
				Enumeration files = multi.getFileNames();
				while (files.hasMoreElements()) {
					String file = (String) files.nextElement();
					String file_name = multi.getFilesystemName(file);
					// 중복된 파일일 경우 파일명 변경이 됨
					String ori_file_name = multi.getOriginalFileName(file); // 원본 파일명
					
					out.print("<br>업로드된 파일명 : "+ file_name);
					out.print("<br>원본 파일명 : "+ ori_file_name);
					out.print("<hr>");
				}
			} catch (Exception e) {
				System.out.println("예외 발생 : "+ e);
			}
			
			return null;
		}
	}

}
