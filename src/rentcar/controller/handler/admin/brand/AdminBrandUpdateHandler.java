package rentcar.controller.handler.admin.brand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.service.BrandService;

public class AdminBrandUpdateHandler implements Command {
	private BrandService service = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return null;
		} else {
			System.out.println("POST");
			
			Brand b = new Brand();
			b.setCode((int) request.getAttribute("brandCode"));
			b.setName((String) request.getAttribute("brandName"));
			b.setImage((String) request.getAttribute("brandImage"));
			
			int res = service.updateBrand(b);
			
			
		}
		return null;
	}

}
