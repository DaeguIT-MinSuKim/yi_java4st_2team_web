package rentcar.controller.handler.brand;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Brand;
import rentcar.service.BrandService;
import rentcar.utils.Paging;

public class BrandListHandler implements Command {
	private BrandService service = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage"); // 현재 페이지
		String cntPerPage = "10"; // 페이지당 몇 개의 글을 보일지 저장

		String condition = request.getParameter("opt");
		String keyword;
		
		int total;
		ArrayList<Brand> brandList = null;
		Paging paging;

		if (nowPage == null) {
			nowPage = "1";
		}

		// 이후 페이지 클래스로 정리하는곳
		if (request.getMethod().equalsIgnoreCase("get")) {
			total = service.countBrandByall();
			paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			brandList = service.pagingEventByAll(paging);
		} else {
			keyword = request.getParameter("inputSearch");
			System.out.println("condition > " + condition);
			System.out.println("keyword > " + keyword);
			total = service.countSearchBrandByAll(condition, keyword);
			paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			brandList = (ArrayList<Brand>) service.searchBrandList(condition, keyword, paging);
		}
		System.out.println("현재 페이지 ===>" + nowPage);
		System.out.println("한 페이지당 나오는 게시물수 ===>" + cntPerPage);
		System.out.println("총게시물 갯수 ===>" + total);

		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		request.setAttribute("brandList", brandList);

		return "admin/brand/brandList.jsp";
	}
}
