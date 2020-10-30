package rentcar.controller.handler.admin.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.MemberService;
import rentcar.utils.Paging;

public class AdminMemberListHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminOptHandler");

			String nowPage = request.getParameter("nowPage"); // 현재 페이지
			String cntPerPage = "12"; // 페이지당 몇 개의 글을 보일지 저장

			// 처음 접속했을 때 초기 세팅
			int total = service.countMemberByAll();
			if (nowPage == null) {
				nowPage = "1";
			}

			System.out.println("현재 페이지 > " + nowPage);
			System.out.println("한 페이지 당 게시물 개수 > " + cntPerPage);
			System.out.println("총 게시물 개수 > " + total);

			Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
			ArrayList<Member> memberPaging = service.pagingMemberByAll(paging);

			request.setAttribute("total", total);
			request.setAttribute("paging", paging);
			request.setAttribute("memberPaging", memberPaging);

			return "/admin/member/memberList.jsp";

		} else {
			System.out.println("POST AdminOptHandler");

			String condition = request.getParameter("condition");
			String keyword = request.getParameter("keyword");

			List<Member> memberPaging = service.selectSearchMember(condition, keyword);
			request.setAttribute("memberPaging", memberPaging);

			return "/admin/member/memberList.jsp";

		}

	}

}
