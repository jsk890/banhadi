package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.MyPetsDAO;
import com.obama.coco.vo.MyPet;

@WebServlet("/ajax/mypet.json")
public class Mypets extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println("servlet.ajax.Mypets.java");
		

		Map<String, Integer> map = new ConcurrentHashMap<String, Integer>();
		
		//req로 파라미터를 받을때 : ajax로 연결 시킨 data 이름과 동일하게 설정
		String userNo = req.getParameter("userNo");
//		map.put("userNo",Integer.valueOf(userNo));

		
		
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		
		
		List<MyPet> list = MyPetsDAO.selectMypetList(Integer.valueOf(userNo));
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(list);
		out.println(json);

	}

}
