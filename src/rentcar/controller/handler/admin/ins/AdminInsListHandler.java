package rentcar.controller.handler.admin.ins;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Event;
import rentcar.dto.Ins;
import rentcar.dto.Kind;
import rentcar.dto.LongRent;
import rentcar.service.BrandService;
import rentcar.service.CarService;
import rentcar.service.InsService;
import rentcar.service.KindService;
import rentcar.utils.Paging;

public class AdminInsListHandler implements Command {
	private InsService service = new InsService();	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		List<Ins> insList = service.selectInsByAll();
//		request.setAttribute("insList", insList);
		
		String nowPage = request.getParameter("nowPage"); //현재페이지
		String cntPerPage = "10"; //페이지당 몇 개의 글을 보일지 저장
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		
		
		int total = 0;
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			//처음 접속했을 때 초기 세팅
			total = service.countInsByAll();
		}else {
			total = service.countSearchInsByAll(condition, keyword);
		}
		
		if(nowPage == null) {
			nowPage = "1";
		}
		
		//이후 페이지 클래스로 정리하는 곳
		Paging paging = new Paging(Integer.parseInt(nowPage),total, Integer.parseInt(cntPerPage));
		
		ArrayList<Ins> insList= null;
		if (request.getMethod().equalsIgnoreCase("get")) {
			insList = service.pagingInsByAll(paging);
		} else { // POST
		
			insList = (ArrayList<Ins>) service.selectSearhPaging(condition, keyword, paging);
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
			request.setAttribute("method", "post");
		}
		
		System.out.println("현재 페이지 ===>" + nowPage);
		System.out.println("한 페이지당 나오는 게시물수 ===>" + cntPerPage);
		System.out.println("총게시물 갯수 ===>" + total);
		
		System.out.println(paging);
		System.out.println(insList);

		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		request.setAttribute("insList", insList);
		
		return "admin/ins/ins.jsp";
	}
}