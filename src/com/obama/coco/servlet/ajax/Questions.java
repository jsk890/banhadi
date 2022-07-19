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
import com.obama.coco.dao.HospitalPhotosDAO;
import com.obama.coco.dao.QuestionsDAO;
import com.obama.coco.dao.SpeciesDAO;
import com.obama.coco.vo.Hospital;
import com.obama.coco.vo.Question;

@WebServlet("/ajax/questions.json")
public class Questions extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		//req로 파라미터를 받을때 : ajax로 연결 시킨 data 이름과 동일하게 설정
		//String answer = req.getParameter("type");
		String search = "";
		String species = "1";
		//int speciesNo = Integer.parseInt(species);
		String type = "t";
		String period = "365";
		String filter = "questionLike";
		String rownum = "4";
		
		try {
			search = req.getParameter("search");
			species = req.getParameter("species");
			//speciesNo = Integer.parseInt(species);
			type = req.getParameter("type");
			period = req.getParameter("period");
			filter = req.getParameter("filter");
			rownum = req.getParameter("rownum");
		}catch(Exception e) {
			
		}
		
		
		map.put("search","%"+search+"%");
		map.put("species",species);
		map.put("type",type);
		map.put("period", period);
		map.put("order",filter);
		map.put("rownum", rownum);
		
		
		
		
		List<Question> list = QuestionsDAO.selectQuestionList(map);
		
		if(type.equals("t")) {
		
			for(Question question : list) {
				question.setUsefulCnt(QuestionsDAO.selectUsefulCount(question.getNo()));
				//System.out.println(QuestionsDAO.selectUsefulCount(question.getNo()));
			}
		}
		
		//System.out.println("검색 갯수 세기");
		Question question = new Question("%"+search+"%", Integer.valueOf(species), period,type);
		//System.out.println(search+species+period+type);
		int searchCount = QuestionsDAO.selectQuestionCount(question);
		//System.out.println(searchCount);
		
		
		//System.out.println("새 맵 생성");
		Map<String, Object> listMap = new ConcurrentHashMap<String, Object>();
		//json에 표시될 key값, key에 담을 value값
		listMap.put("list", list);
		listMap.put("species", SpeciesDAO.selectSpecies());
		listMap.put("selectedSpecies",species);
		listMap.put("search",search);
		listMap.put("searchCnt", searchCount);


		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(listMap);
		out.println(json);
		
	}
}
