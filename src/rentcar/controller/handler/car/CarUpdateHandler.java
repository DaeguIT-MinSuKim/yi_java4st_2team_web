package rentcar.controller.handler.car;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Kind;
import rentcar.service.CarService;

public class CarUpdateHandler implements Command {
	private CarService service = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			String no = (String) request.getAttribute("carNo");
			Car car = service.carDetail(no);
			request.setAttribute("car", car);

			return "admin/car/carUpdate.jsp";
		} else {
			System.out.println("POST");
			response.setContentType("text/html; charsert=UTF8");
			PrintWriter out = response.getWriter();

			String savePath = "upload";
			int uploadFileSizeLimit = 5 * 1024 * 1024;
			String enctype = "UTF-8";

			ServletContext context = request.getServletContext(); // 컨트롤러 인터페이스를 상속받아 처리하는 경우 request 사용
			String uploadFilePath = context.getRealPath(savePath);

			try {
				System.out.println(request);
				MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, enctype,
						new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();

				String no = multi.getParameter("carNo");
				String name = multi.getParameter("carName");
				int kindNo = Integer.parseInt(multi.getParameter("carKind"));
				int brandNo = Integer.parseInt(multi.getParameter("carBrand"));
				String remark = multi.getParameter("carRemark");
				String is_rent = multi.getParameter("carIs_rent");
				String image = multi.getParameter("carImage");

				Car c = new Car();
				c.setNo(no);
				c.setName(name);
				c.setKind(new Kind(kindNo));
				c.setBrand(new Brand(brandNo));
				c.setRemark(remark);
				c.setIs_rent(is_rent);
				c.setImage(image);

				int res = service.insertCar(c);
				request.setAttribute("res", res);
			} catch (Exception e) {
				System.out.println("예외 발생 : " + e);
			}
			return "admin/car/carList.jsp";
		}
	}
}
