package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.HospitalsDAO;
import com.obama.coco.dao.ReservationsDAO;
import com.obama.coco.vo.Calendar;
import com.obama.coco.vo.Hospital;
import com.obama.coco.vo.Medical;
import com.obama.coco.vo.Reservation;

@WebServlet("/ajax/getAllReservationList.json")
public class GetAllReservationList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//병원번호를 받아옴 get방식으로
		String hospitalNoStr = req.getParameter("hospitalNo");
		//hospital no에 해당하는 reservation list를 받아옴
		int hospitalNo = Integer.parseInt(hospitalNoStr);
		List<Calendar> calendarJson = new ArrayList<Calendar>();
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("받아온state는 " + req.getParameter("state"));
		
		List<Reservation> reservationList = ReservationsDAO.selectAllList(hospitalNo);
		System.out.println("list받아옴" + reservationList);
		
			for(Reservation reservation: reservationList) {
				char reservationTypeStr = reservation.getState();
				System.out.println(reservationTypeStr);
				String reservationType = "";
				
				if(reservationTypeStr=='t') {
					reservationType="예약완료";
				}else if(reservationTypeStr=='f') {
					reservationType="예약신청";
				}else {
					reservationType="진료완료";
				}// if~else if~else end
				
				System.out.println(reservationType);
				String reservationTitle = reservation.getPetName()+" "+reservationType;
				
				System.out.println(reservationTitle);
				Timestamp reservationDate = reservation.getReservationsDate();
				System.out.println("날짜도 얻어옴 " + reservationDate);
				Calendar calendar = new Calendar(reservationTitle,reservationDate);
				System.out.println(calendar);
				calendarJson.add(calendar);
				
				System.out.println(calendarJson);
			
			
			}//for end
			String json = mapper.writeValueAsString(calendarJson);
	
		
		//병원번호로 불러온 예약리스트 -> 하나씩 불러서 예약번호를 얻어옴
		//예약번호로 그 예약에 해당하는 증상과 진료명을 리스트로 받아오고, 객체에 속성을 셋팅해줌
		
		
		resp.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		

		
	}
	
	
}
