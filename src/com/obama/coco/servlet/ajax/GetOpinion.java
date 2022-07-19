package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.OpinionsDAO;
import com.obama.coco.vo.Opinion;

@WebServlet("/ajax/getOpinion.json")
public class GetOpinion extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String reservationNoStr = req.getParameter("reservationNo");
		int reservationNo = Integer.parseInt(reservationNoStr);
		
		Opinion opinion = OpinionsDAO.selectOpinion(reservationNo);
		if(opinion.getDiagnosis()==null) {
			opinion.setDiagnosis("진료내용을 입력하세요.");
			
		}
		
		if(opinion.getNotice()==null) {
			opinion.setDiagnosis("유의사항을 입력하세요.");
			
		}
		
		if(opinion.getPrescription()==null) {
			opinion.setDiagnosis("처방내역을 입력하세요.");
			
		}
	
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(opinion);
		resp.setContentType("application/json; charset=UTF-8");
	
		PrintWriter out = resp.getWriter();
		out.print(json);
		
		
		
	}//doGet end
}
