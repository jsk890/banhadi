package com.obama.coco.servlet.ajax;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.obama.coco.dao.RepliesDAO;
import com.obama.coco.util.PaginateUtil;
import com.obama.coco.vo.PageVO;
import com.obama.coco.vo.Reply;

@WebServlet("/ajax/getQuestionReplies.json")
public class GetQuestionReplies extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 받아오기
		String questionNoStr = req.getParameter("questionNo");
		
		//페이징처리 파라미터 받아오기
		String pageNoStr = req.getParameter("pageNo");
		String numPageStr = req.getParameter("numPage");
		
		System.out.println("질문번호는 "+questionNoStr);
		
		//형변환
		int questionNo = Integer.parseInt(questionNoStr);
		int pageNo = Integer.parseInt(pageNoStr);
		int numPage = Integer.parseInt(numPageStr);
		
	
		int numBlock = 5; //보일 페이지의 개수
		
		PageVO pageVO = new PageVO (questionNo, pageNo, numPage);
		
		
		//replies에 select구문을 사용한 객체들을 넣어준다. 
		List<Reply> replies = RepliesDAO.selectPageList(pageVO);
		
		int total = RepliesDAO.selectTotal(questionNo);
		System.out.println(total);
		
		String url = "/counsellingAnswercompleted.jsp";
		
		
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		
		Map<String , Object> map = new HashMap<String, Object>();
		
		map.put("replies",replies);
		map.put("paginate",paginate);
		
		
		//http프로토콜의 header에 json을 설정해준다.
		resp.setContentType("application/json;charset=UTF-8");
		
		//http프로토콜 body에 들어갈 구문
		PrintWriter out = resp.getWriter();

		ObjectMapper om = new ObjectMapper();
		
		//replies를 String타입으로 변환해준다.
		String json = om.writeValueAsString(map);
		
		out.print(json);
		
		
	}//doGet() end
	
}
