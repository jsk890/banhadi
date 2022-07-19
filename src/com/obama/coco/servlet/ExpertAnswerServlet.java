package com.obama.coco.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.ExpertAnswerDAO;
import com.obama.coco.dao.MedicalAnswersDAO;
import com.obama.coco.vo.ExpertAnswer;
import com.obama.coco.vo.MedicalAnswer;
@WebServlet("/writeAnswer.coco")
public class ExpertAnswerServlet extends HttpServlet{



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String userNo = req.getParameter("userNo");
		String questionNo = req.getParameter("questionNo");
		String contents = req.getParameter("contents");
		

		
		ExpertAnswer expertAnswer = new ExpertAnswer(Integer.parseInt(userNo), Integer.parseInt(questionNo), contents);
		ExpertAnswerDAO.insertAnswer(expertAnswer);
		try {
			String[] medicalsNos =req.getParameterValues("medicalsNo");
			for (String medicalsNo : medicalsNos) {

				MedicalAnswer medicalAnswer = new MedicalAnswer(Integer.valueOf(medicalsNo), expertAnswer.getNo());
			
				MedicalAnswersDAO.insertMedicalAnswers(medicalAnswer);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		
		resp.sendRedirect("/counsellingAnswercompleted.jsp?questionNo="+questionNo);
	}
}
