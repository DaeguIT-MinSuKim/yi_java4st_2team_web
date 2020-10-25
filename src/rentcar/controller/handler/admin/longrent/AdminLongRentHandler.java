package rentcar.controller.handler.admin.longrent;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;
import rentcar.utils.Paging;

public class AdminLongRentHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("post")) {
			
			String condition = request.getParameter("condition");
			String keyword = request.getParameter("keyword");

			List<LongRent> list = service.searchLongRentList(condition, keyword);
//			System.out.println("검색결과 찍혀라!!!!!!!!!!!!!!!!!!!!!!!!!!" + list);
			
			request.setAttribute("list", list);

			return "/admin/longrent/longrent.jsp";
			
		}else {
				
			String nowPage = request.getParameter("nowPage"); // 현재 페이지
			String cntPerPage = "12"; // 페이지당 몇 개의 글을 보일지 저장
			
			
			// 처음 접속했을 때 초기 세팅
			int total = service.countLongRentByall();
			if (nowPage == null) {
				nowPage = "1";
			}
			
			
			System.out.println("장기렌트 현재 페이지 ===>" + nowPage);
			System.out.println("장기렌트 한 페이지당 나오는 게시물수 ===>" + cntPerPage);
			System.out.println("장기렌트 총게시물 갯수 ===>" + total);
			
			
			// 이후 페이지 클래스로 정리하는 곳
			Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			ArrayList<LongRent> list = service.pagingLongRentByAll(paging);
			
			
			System.out.println(paging);
			System.out.println(list);
	
	
			request.setAttribute("total", total);
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);
			
			
			return "/admin/longrent/longrent.jsp";
		}
	}

}
