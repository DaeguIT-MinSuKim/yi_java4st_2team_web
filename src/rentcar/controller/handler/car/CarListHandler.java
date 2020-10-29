package rentcar.controller.handler.car;

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
import rentcar.dto.Kind;
import rentcar.service.BrandService;
import rentcar.service.CarService;
import rentcar.service.KindService;
import rentcar.utils.Paging;

public class CarListHandler implements Command {
	private CarService service = new CarService();
	private KindService kService = new KindService();
	private BrandService bService = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 처음 접속했을 때 초기 세팅
		List<Kind> kindList = kService.kindList();
		request.setAttribute("kindList", kindList);

		List<Brand> brandList = bService.brandList();
		request.setAttribute("brandList", brandList);

		String nowPage = request.getParameter("nowPage"); // 현재 페이지
		String cntPerPage = "10"; // 페이지당 몇 개의 글을 보일지 저장

		String condition = request.getParameter("opt");
		String keyword;
		
		int total;
		ArrayList<Car> carList = null;
		Paging paging;

		if (nowPage == null) {
			nowPage = "1";
		}

		// 이후 페이지 클래스로 정리하는곳
		if (request.getMethod().equalsIgnoreCase("get")) {
			total = service.countCarByall();
			paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			carList = service.pagingEventByAll(paging);
		} else {
			if( condition.equals("KIND_NAME") ) {
				keyword = request.getParameter("opt3");
			}else if( condition.equals("BRAND_NAME") ) {
				keyword = request.getParameter("opt4");
			}else if( condition.equals("IS_RENTCAR") ) {
				keyword = request.getParameter("opt5");
			}else {
				keyword = request.getParameter("inputSearch");
			}
			total = service.countSearchCarByAll(condition, keyword);
			paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			carList = (ArrayList<Car>) service.searchCarList(condition, keyword, paging);
		}

		System.out.println("현재 페이지 ===>" + nowPage);
		System.out.println("한 페이지당 나오는 게시물수 ===>" + cntPerPage);
		System.out.println("총게시물 갯수 ===>" + total);

		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		request.setAttribute("carList", carList);

		return "admin/car/carList.jsp";
	}
}