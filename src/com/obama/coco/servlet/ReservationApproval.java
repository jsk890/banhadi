package com.obama.coco.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.ReservationsDAO;

@WebServlet("/reservationApproval.obama")
public class ReservationApproval extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String result = req.getParameter("approvalResult");
		String reservationNoStr = req.getParameter("reservationNo");
		String userNoStr = req.getParameter("userNo");
		int userNo = Integer.parseInt(userNoStr);
		int reservationNo = Integer.parseInt(reservationNoStr);
		int hospitalNo = Integer.parseInt(req.getParameter("hospitalNo"));
		
		System.out.println(result);
		
		if(result.equals("reject")) {
			//System.out.println("reject");
			int rejectResult = ReservationsDAO.updateStateToReject(reservationNo);
			System.out.println("rejectResult는" +rejectResult);
		}else {
			//System.out.println("accept");
			int acceptResult = ReservationsDAO.updateStateToTrue(reservationNo);
			System.out.println("acceptResult는" +acceptResult);
			
		}
		
		resp.sendRedirect("/reservationHome.jsp?no="+hospitalNo+"&userNo="+userNo);
		
		
	}
}
