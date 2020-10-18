package rentcar.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = { "/*" }, initParams = { @WebInitParam(name = "encoding", value = "UTF-8") })
public class charIncodingFilter implements Filter {
	private String enc;

	public charIncodingFilter() {
	}

	public void destroy() {
		System.out.println("doFilter()");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFilter(FilterConfig fConfig)");
		request.setCharacterEncoding(enc);
		response.setCharacterEncoding(enc);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("init(FilterConfig fConfig)");
		enc = fConfig.getInitParameter("encoding");
		if (enc == null) {
			enc = "UTF-8";
		}
	}
	
}
