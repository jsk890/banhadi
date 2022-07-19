package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.HospitalsDAO;
import com.obama.coco.dao.ReservationsDAO;
import com.obama.coco.vo.Hospital;
import com.obama.coco.vo.Medical;
import com.obama.coco.vo.Reservation;

@WebServlet("/ajax/getReservation.json")
public class GetReservation extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String reservationNoStr = req.getParameter("reservationNo");
		
		int reservationNo = Integer.parseInt(reservationNoStr);
		Reservation reservation = ReservationsDAO.selectOne(reservationNo);
		
		List<String> symptomList = ReservationsDAO.selectSymptomList(reservationNo);
		List<Medical> medicalList = ReservationsDAO.selectMedicalList(reservationNo);
			
		reservation.setSymptomList(symptomList);
		reservation.setMedicalList(medicalList);
			
	
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = mapper.writeValueAsString(reservation);
		
		resp.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		
		
	}
	
	
}
