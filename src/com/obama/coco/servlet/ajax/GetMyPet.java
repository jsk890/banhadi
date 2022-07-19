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

@WebServlet("/ajax/getMyPet.json")
public class GetMyPet extends HttpServlet{
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	  String userNoStr = req.getParameter("userNo");
	  //김정석 2/7 08:12 추가 try catch문
	  String petNoStr="1";
	  try {
		  petNoStr = req.getParameter("petNo");
	  }catch(Exception e) {
		  
	  }
	//김정석 2/7 08:12 추가
	  if(petNoStr==null) petNoStr="1";

	  
	//  int no = Integer.parseInt(petNoStr);
	  
	  //김정석 2/7 07:40 추가 마이펫리스트 불러오기 
	  int userNo = Integer.parseInt(userNoStr);
	  List<MyPet> petList = MyPetsDAO.selectMyPetList(userNo);
	  
	  
	  Map<String, Object> map = new ConcurrentHashMap<String, Object>();
	  map.put("userNo", userNoStr);
	  map.put("petNo", petNoStr);

	  
	  MyPet mypet = MyPetsDAO.selectMyPet(map);
	  System.out.println("mypet 선택 완료");
	  
	  
	  //김정석 2/7 08:21 추가
	  Map<String, Object> mapList = new ConcurrentHashMap<String, Object>();
	  try {
		  //김정석 전문가상담에서 질문하기 버튼 눌렀을때 
		  //petNo 받는 곳이 없어서
		  //MyPetsDAO.selectMyPet(map)에서 null이 뜨므로
		  //감쌌습니다!
		  mapList.put("mypet", mypet);
	  }catch(Exception e) {
		  
	  }
	  //김정석 2/7 08:21 추가
	  mapList.put("petList", petList);
	  System.out.println("새 맵 생성완료");
	  
	  ObjectMapper mapper = new ObjectMapper();
	  //김정석 2/7 08:32 map -> mapList로 매개변수 변경
	  String json = mapper.writeValueAsString(mapList);
	  System.out.println(json);
	  resp.setContentType("application/json; charset=UTF-8");
	  PrintWriter out = resp.getWriter();
	  out.print(json);
	 
	  
	  
}
}
