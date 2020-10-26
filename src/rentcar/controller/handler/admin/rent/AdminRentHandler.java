package rentcar.controller.handler.admin.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Rent;
import rentcar.service.RentService;
import rentcar.utils.Paging;

public class AdminRentHandler implements Command {
	private RentService rentService = new RentService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		searchAndPaging(request);
		return "/admin/rent/rent.jsp";
	}
	
	void searchAndPaging(HttpServletRequest request) {
		// 페이징 (GET + POST 공통)
		String nowPage = request.getParameter("nowPage"); // 현재 페이지
		String cntPerPage = "12"; // 페이지당 몇 개의 글을 보일지 저장
		
		int total = rentService.countRentByAll();
		if (nowPage == null) {
			nowPage = "1";
		}
		Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		
		
		// GET / POST 구분작업 시작
		if(request.getMethod().equalsIgnoreCase("GET")) {
		    // 최초 페이지 접속 + 하단페이징 버튼 클릭 시 여기로
			List<Rent> rentList = rentService.pagingRentByAll(paging);
			request.setAttribute("rentList", rentList);
			
		}else {
			// 검색했을 경우 여기로
			String condition = request.getParameter("condition");
			String keyword = request.getParameter("keyword");
			List<Rent> rentList = rentService.selectSearchAndPaging(condition, keyword, paging);
			request.setAttribute("rentList", rentList);
		}
	}
}
