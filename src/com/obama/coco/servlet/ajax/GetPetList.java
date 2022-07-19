package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.MyPetsDAO;
import com.obama.coco.vo.MyPet;

@WebServlet("/ajax/getPetList.json")
public class GetPetList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userNoStr = req.getParameter("userNo");
		int userNo = Integer.parseInt(userNoStr);
		
		List<MyPet> myPetList = MyPetsDAO.selectMyPetList(userNo);
		//System.out.println(myPetList.size());
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(myPetList);
		
		resp.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.print(json);
		
		
		
		
	}
}
