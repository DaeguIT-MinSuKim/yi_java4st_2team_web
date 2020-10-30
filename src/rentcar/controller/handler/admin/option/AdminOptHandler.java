package rentcar.controller.handler.admin.option;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Opt;
import rentcar.service.OptService;
import rentcar.utils.Paging;

public class AdminOptHandler implements Command {

	private OptService service = new OptService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		searchAndPaging(request);
		return "/admin/opt/optList.jsp";
	}
	
	void searchAndPaging(HttpServletRequest request) {
		String nowPage = request.getParameter("nowPage"); // 현재 페이지
		String cntPerPage = "12"; // 페이지당 몇 개의 글을 보일지 저장
		
		// 처음 접속했을 때 초기 세팅
		int total = service.countOptByAll();
		if (nowPage == null) {
			nowPage = "1";
		}
		Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		

		if(request.getMethod().equalsIgnoreCase("GET")) {
			ArrayList<Opt> optPaging = service.pagingOptByAll(paging);
			request.setAttribute("optPaging", optPaging);
		} else {
			String condition = request.getParameter("condition");
			String keyword = request.getParameter("keyword");

			List<Opt> optPaging = service.selectSearchPagingOpt(condition, keyword, paging);
			request.setAttribute("optPaging", optPaging);
		}
	}
		
}
