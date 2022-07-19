package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet("/ajax/registerMyPet.json")
public class RegisterMyPet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userNoStr = req.getParameter("userNo");
		int userNo = Integer.parseInt(userNoStr);
		
		String petNoStr = req.getParameter("petNo");
		int petNo = Integer.parseInt(petNoStr);
		System.out.println(petNoStr + "나는야 펫번호스트링");
	
		String speciesNoStr = req.getParameter("speciesNo");
		int speciesNo = Integer.parseInt(speciesNoStr);
		
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String picture = req.getParameter("picture");
		
		String weightStr = req.getParameter("weight");
		int weight = Integer.parseInt(weightStr);
		
		String specific = req.getParameter("specific");
		String birthdayStr = req.getParameter("birthday");
		System.out.println(birthdayStr+"생일도받았지롱");
		Date birthday = Date.valueOf(birthdayStr);
		 MyPet selectedpet = null;
		
		
		if(petNoStr.equals("-1")) {
		//	System.out.println("펫 번호가 -1일때 여기옴 실제 펫번호는 : " +petNoStr);
		//System.out.println(petNoStr.equals("-1"));
		MyPet myPet = new MyPet(userNo, speciesNo, weight, name, picture, specific, birthday, gender);
		int result =  MyPetsDAO.registerMyPet(myPet);
		selectedpet = MyPetsDAO.selectMyNewPet(userNo);
		}else {
			//System.out.println("펫 번호가 존재할때 여기옴 실제 펫번호는 : " +petNoStr);
			//System.out.println(petNoStr.equals("-1"));
		MyPet myPet = new MyPet(petNo, speciesNo, weight, name, picture, specific, gender, birthday);
		int result = MyPetsDAO.updateMyPet(myPet);
		 Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		  map.put("userNo", userNoStr);
		  map.put("petNo", petNoStr);
		  
		  selectedpet = MyPetsDAO.selectMyPet(map);
		  
		}// if else end
		
		 ObjectMapper mapper = new ObjectMapper();
		  String json = mapper.writeValueAsString(selectedpet);
		  
		  resp.setContentType("application/json; charset=UTF-8");
		  PrintWriter out = resp.getWriter();
		  out.print(json);
		 
		
		
		
				
			
			
	}//doGet end
}
