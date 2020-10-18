package rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
