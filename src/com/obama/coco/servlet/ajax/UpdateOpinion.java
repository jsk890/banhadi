package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.OpinionsDAO;
import com.obama.coco.dao.ReservationsDAO;
import com.obama.coco.vo.Opinion;

@WebServlet("/ajax/updateOpinion.json")
public class UpdateOpinion extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String reservationNoStr = req.getParameter("reservationNo");
		String diagnosisStr = req.getParameter("diagnosis");
		String noticeStr = req.getParameter("notice");
		String prescriptionStr = req.getParameter("prescription");
		String userNoStr = req.getParameter("userNo");
		int reservationNo = Integer.parseInt(reservationNoStr);
		int userNo = Integer.parseInt(userNoStr);
		String state = req.getParameter("state");
		System.out.println(reservationNoStr);
		
		Opinion opinion = new Opinion();
		opinion.setReservationNo(reservationNo);
		opinion.setNotice(noticeStr);
		opinion.setDiagnosis(diagnosisStr);
		opinion.setPrescription(prescriptionStr);
		opinion.setUserNo(userNo);
		
		if(state.equals("t")) {
			int result = ReservationsDAO.updateStateToComplete(reservationNo);
			int insertResult = OpinionsDAO.insert(opinion);
		}else if(state.equals("c")) {
			int updateResult = OpinionsDAO.update(opinion);
		}

		PrintWriter out = resp.getWriter();
		out.print("{\"result\":"+1+"}");
	
		
	
	}
	
}
