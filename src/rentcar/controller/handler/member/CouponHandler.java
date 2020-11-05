package rentcar.controller.handler.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.dto.Member;
import rentcar.service.EventService;

public class CouponHandler implements Command {

	private EventService eventService = new EventService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");

		// 보유중인 쿠폰
		ArrayList<Event> memberCoupon = eventService.selectEventBoxFindMemberCoupon(loginUser.getId());
		ArrayList<Event> memberCouponUse = eventService.selectEventBoxFindMemberCouponEnd(loginUser.getId(), "y");
		ArrayList<Event> memberCouponExpiration = eventService.selectEventBoxFindMemberCouponEnd(loginUser.getId(), "e");
		
		request.setAttribute("memberCoupon", memberCoupon);
		request.setAttribute("memberCouponUse", memberCouponUse);
		request.setAttribute("memberCouponExpiration", memberCouponExpiration);
		
		
		return "/member/coupon.jsp";
	}

}
