package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.MedicalsDAO;
import com.obama.coco.vo.Medical;

@WebServlet(value="/ajax/medicals.json")
public class Medicals extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String search = req.getParameter("search");
		
		List<Medical> medicals =  MedicalsDAO.searchList("%"+search+"%");
			
		ObjectMapper om = new ObjectMapper();
		try {
			String json = om.writeValueAsString(medicals);
			out.print(json);
		}catch (Exception e) {
			e.printStackTrace();
		}


	}
}
