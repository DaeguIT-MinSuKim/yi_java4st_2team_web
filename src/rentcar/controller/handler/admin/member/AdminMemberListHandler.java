package rentcar.controller.handler.admin.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.dto.Member;
import rentcar.service.EventService;
import rentcar.service.MemberService;
import rentcar.utils.Paging;

public class AdminMemberListHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminMemberListHandler");

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
			
			String name = request.getParameter("name");
			String nameDESC = "SELECT * FROM MEMBER ORDER BY " + name + " DESC";
			System.out.println(nameDESC);

			return "/admin/member/memberList.jsp";

		} else {
			System.out.println("POST AdminMemberListHandler");

			return null;

		}

	}

}
