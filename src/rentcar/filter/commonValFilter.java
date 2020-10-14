package rentcar.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = { "*.do" }, initParams = { @WebInitParam(name = "encoding", value = "UTF-8") })
public class commonValFilter implements Filter {
	private String enc;

	public commonValFilter() {
	}

	public void destroy() {
		System.out.println("doFilter()");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		/* by 대현
		 * 모든 페이지에 들어가야할 값이 있을 경우 여기에 넣으면 됨 ~!
		 * */
		
//		ex) ↓ 헤더, 레프트 메뉴 값 모든 페이지에 들어감
//		List<String> navMenu = new ArrayList<String>();
//		navMenu.add("Heels");
//		navMenu.add("Boots");
//		navMenu.add("Sandals");
//		navMenu.add("Sneakers");
//		navMenu.add("On Sale");
		
//		request.setAttribute("navMenu", navMenu);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}
}
