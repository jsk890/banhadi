package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.CounsellingsDAO;
import com.obama.coco.servlet.ajax.parent.Controllers;
import com.obama.coco.vo.Question;

@WebServlet("/ajax/QuestionRankTop.json")
public class QuestionRankTop extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		List<Question> list = CounsellingsDAO.selectRankTop();
		
		System.out.println(list);
		
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		System.out.println(json);
				
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(json);
		
		
	}//doGet
}//QuestionRankTop
	
	/*
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			/*Map<String,Object> params	= getParamMap(request);
			
			Map<String,Object> result	= CounsellingDAO.selectRankTop(params);
			
			Map<String,Object> ajax	= new HashMap<String,Object>();
			ajax.put("result", result);
			
			ObjectMapper mapper = new ObjectMapper();
			
			String json = mapper.writeValueAsString(result);
					
			PrintWriter out = response.getWriter();
			out.print(json);
			
			// TODO Auto-generated method stub
			
	}
}*/
