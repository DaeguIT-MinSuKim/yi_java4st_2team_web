package rentcar.controller.handler.event;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.service.EventService;

public class EventWriteHandler implements Command {
	private EventService service = new EventService();

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
			
			ServletContext context = request.getServletContext(); //컨트롤러 인터페이스를 상속받아 처리하는 경우 request 사용
			String uploadFilePath  = context.getRealPath(savePath);
			
			try {
				System.out.println(request);
				MultipartRequest multi = new MultipartRequest(
						request,
						uploadFilePath,
						uploadFileSizeLimit,
						enctype,
						new DefaultFileRenamePolicy()
						);
				Enumeration files = multi.getFileNames();
				
				/*while (files.hasMoreElements()) {
					String file = (String) files.nextElement();
					String file_name = multi.getFilesystemName(file);
					// 중복된 파일일 경우 파일명 변경이 됨
					String ori_file_name = multi.getOriginalFileName(file); // 원본 파일명
					
					System.out.println(file_name);
					System.out.println(ori_file_name);
				}*/
				
				Date now = new Date();
				
				String name = multi.getParameter("title");
				int sale = Integer.parseInt(multi.getParameter("sale"));
				String thumImage = multi.getFilesystemName("uploadfile01");
				String viewImage = multi.getFilesystemName("uploadfile02");
				Date startDate = java.sql.Date.valueOf(multi.getParameter("startDate"));
				Date endDate = java.sql.Date.valueOf(multi.getParameter("endDate"));
				String isEvent = "n";
				
				if (startDate.getTime() <= now.getTime() && endDate.getTime() >= now.getTime()) {
					isEvent = "y";
				}
				
				Event event = new Event();
				event.setName(name);
				event.setSale(sale);
				event.setThumImage(thumImage);
				event.setViewImage(viewImage);
				event.setStartDate(startDate);
				event.setEndDate(endDate);
				event.setIsEvent(isEvent);
				
				System.out.println(event);
				service.insertEvent(event);
				
				
			} catch (Exception e) {
				System.out.println("예외 발생 : "+ e);
			}
			
			response.sendRedirect("event.do");
			return null;
		}
	}

}
