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

public class AdminRentHandler_backup201025 implements Command {
	private RentService rentService = new RentService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			// 최초 접속 + 다른 페이지 이동시 여기로
			
			// 렌트 리스트
//			List<Rent> rentList = rentService.selectRentByAll();
//			request.setAttribute("rentList", rentList);
			
			// 페이징
			String nowPage = request.getParameter("nowPage"); // 현재 페이지
			String cntPerPage = "12"; // 페이지당 몇 개의 글을 보일지 저장
			
			// 처음 접속했을 때 초기 세팅
			int total = rentService.countRentByAll();
			if (nowPage == null) {
				nowPage = "1";
			}
			
//			System.out.println("단기렌트 현재 페이지 ===>" + nowPage);
//			System.out.println("단기렌트 한 페이지당 나오는 게시물수 ===>" + cntPerPage);
//			System.out.println("단기렌트 총게시물 갯수 ===>" + total);
			
			
			// 이후 페이지 클래스로 정리하는 곳
			Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			List<Rent> rentList = rentService.pagingRentByAll(paging);
			
//			System.out.println(paging);
//			System.out.println(list);

			request.setAttribute("total", total);
			request.setAttribute("paging", paging);
			request.setAttribute("rentList", rentList);

			return "/admin/rent/rent.jsp";
			
		}else { // POST
			// 검색 시 여기로 
			
			// 페이징
			String nowPage = request.getParameter("nowPage"); // 현재 페이지
			String cntPerPage = "12"; // 페이지당 몇 개의 글을 보일지 저장
			
			int total = rentService.countRentByAll();
			if (nowPage == null) {
				nowPage = "1";
			}

			// 단기렌트 검색
			String condition = request.getParameter("condition");
			String keyword = request.getParameter("keyword");
			
//			System.out.println("condition >> " + condition);
//			System.out.println("keyword >> " + keyword);
			
			Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			List<Rent> rentList = rentService.selectSearchAndPaging(condition, keyword, paging);
			
			request.setAttribute("total", total);
			request.setAttribute("paging", paging);
			request.setAttribute("rentList", rentList);
			
			return "/admin/rent/rent.jsp";
		}
	}

}
