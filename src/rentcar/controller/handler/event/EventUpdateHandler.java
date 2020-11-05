package rentcar.controller.handler.event;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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
import rentcar.service.TransactionService;

public class EventUpdateHandler implements Command {
	private EventService service = new EventService();
	private TransactionService transactionService = new TransactionService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			String code = request.getParameter("code").trim();
			Event event = service.getEvent(code);
			
			request.setAttribute("event", event);
			System.out.println("수정 : "+ event);
			
			return "/event/event_update.jsp";
		} else {
			
			response.setContentType("text/html; charsert=UTF8");
			PrintWriter out = response.getWriter();
			
			String savePath = "upload";
			int uploadFileSizeLimit = 5 * 1024 * 1024;
			String enctype = "UTF-8";
			
			ServletContext context = request.getServletContext(); //컨트롤러 인터페이스를 상속받아 처리하는 경우 request 사용
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

				Date now = new Date();
				
				String code = multi.getParameter("code");
				String name = multi.getParameter("title");
				int sale = Integer.parseInt(multi.getParameter("sale"));
				String thumImage = multi.getFilesystemName("uploadfile01");
				String viewImage = multi.getFilesystemName("uploadfile02");
				Date startDate = java.sql.Date.valueOf(multi.getParameter("startDate"));
				String endDate[] = multi.getParameter("endDate").split("-");
				String isEvent = "n";
				
				Calendar cal = Calendar.getInstance();
				cal.set(Integer.parseInt(endDate[0]), Integer.parseInt(endDate[1])-1, Integer.parseInt(endDate[2]), 23, 59, 59);
				cal.set(Calendar.MILLISECOND, 0);
				
				
				Event event = service.getEvent(code);
				event.setName(name);
				event.setSale(sale);
				event.setStartDate(startDate);
				event.setEndDate(cal.getTime());
				if (thumImage != null) {					
					event.setThumImage(thumImage);
				}
				if (viewImage != null) {					
					event.setViewImage(viewImage);
				}

				
				if (startDate.getTime() <= now.getTime() && event.getEndDate().getTime() >= now.getTime()) {
					isEvent = "y";
				}
				event.setIsEvent(isEvent);

				// service.updateEvent(event);
				transactionService.updateEvnetAndEventBox(event);
				
				
			} catch (Exception e) {
				System.out.println("예외 발생 : "+ e);
			}
			
			response.sendRedirect("event.do");
			return null;
		}
	}

}
