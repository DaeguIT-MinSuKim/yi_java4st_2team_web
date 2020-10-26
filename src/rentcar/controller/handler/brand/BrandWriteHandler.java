package rentcar.controller.handler.brand;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.service.BrandService;

public class BrandWriteHandler implements Command {
	private BrandService service = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			
			return "admin/brand/brandWrite.jsp";
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

				String name = multi.getParameter("name");
				String image = multi.getFilesystemName("uploadfile");

				Brand b = new Brand();
				b.setName(name);
				b.setImage(image);

				int res = service.insertBrand(b);
				request.setAttribute("res", res);
			} catch (Exception e) {
				System.out.println("예외 발생 : " + e);
			}
			return "brandList.do";
		}
	}
}
