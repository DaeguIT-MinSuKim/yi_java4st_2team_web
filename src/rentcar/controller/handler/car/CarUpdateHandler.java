package rentcar.controller.handler.car;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Kind;
import rentcar.service.BrandService;
import rentcar.service.CarService;
import rentcar.service.KindService;

public class CarUpdateHandler implements Command {
	private CarService service = new CarService();
	private KindService kService = new KindService();
	private BrandService bService = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			String no = request.getParameter("carNo");
			Car car = service.carDetail(no);
			request.setAttribute("car", car);
			
			List<Kind> kindList = kService.kindList();
			request.setAttribute("kindList", kindList);
			
			List<Brand> brandList = bService.brandList();
			request.setAttribute("brandList", brandList);
			
			return "admin/car/carUpdate.jsp";
		} else {
			System.out.println("POST");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int kindNum = 0;
			
			Cookie[] cookies = request.getCookies();  // 쿠키 조회하기
			for(Cookie cookie:cookies){
			    if( cookie.getName().equals("kindNum")) {
			    	kindNum = Integer.parseInt(cookie.getValue());
			    	
			    	int uploadFileSizeLimit = 5 * 1024 * 1024;
					String enctype = "UTF-8";
					String savePath = "images/rentcar/" + kindNum;
					
					try {
						MultipartRequest multi = new MultipartRequest(request, 
								request.getServletContext().getRealPath(savePath),
								uploadFileSizeLimit, enctype,
								new DefaultFileRenamePolicy());
						Enumeration files = multi.getFileNames();
						
						String no = multi.getParameter("carNo");
						String name = multi.getParameter("carName");
						int kindNo = Integer.parseInt(multi.getParameter("kind"));
						int brandNo = Integer.parseInt(multi.getParameter("brand"));
						String remark = multi.getParameter("remark");
						String image = multi.getFilesystemName("image");
						
						Car c = service.carDetail(no);
						c.setName(name);
						c.setKind(new Kind(kindNo));
						c.setBrand(new Brand(brandNo));
						c.setRemark(remark);
						if (image != null) {
							c.setImage(image);
						}
						
						int res = service.updateCar(c);
						request.setAttribute("res", res);
						
						response.sendRedirect("carList.do");
					} catch (Exception e) {
						System.out.println("예외 발생 : " + e);
					}
			    }
			}
			return null;
		}
	}
}
