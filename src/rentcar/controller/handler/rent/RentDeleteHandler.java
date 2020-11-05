package rentcar.controller.handler.rent;

import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import rentcar.controller.Command;
import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.dao.impl.OptBoxDaoImpl;
import rentcar.dao.impl.RentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.dto.Member;
import rentcar.dto.Rent;
import rentcar.service.EventService;
import rentcar.service.OptBoxService;
import rentcar.service.RentService;

public class RentDeleteHandler implements Command {

	private RentService rentService = new RentService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("GET")) {
			int rentNo = Integer.parseInt(request.getParameter("rentNo"));
			int res = rentService.updateRent_isRent(rentNo); // 삭제하려고 했으나 반납유무 y로 수정함
			response.getWriter().print(res);
			return null;
		}
		
		return null;
	}
	
}