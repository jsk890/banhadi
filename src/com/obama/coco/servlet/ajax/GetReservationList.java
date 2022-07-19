package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
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

@WebServlet("/ajax/getReservationList.json")
public class GetReservationList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//병원번호를 받아옴 get방식으로
		String hospitalNoStr = req.getParameter("hospitalNo");
		//hospital no에 해당하는 reservation list를 받아옴
		//int hospitalNo = Integer.parseInt(hospitalNoStr);
	
		ObjectMapper mapper = new ObjectMapper();
	
	
			String state = req.getParameter("state");
		
			Map<String,Object> map = new ConcurrentHashMap<String, Object>();
			map.put("state", state);
			map.put("hospitalNo", hospitalNoStr);
	
			List<Reservation> reservationList = ReservationsDAO.selectList(map);
			for(Reservation reservation:reservationList) {
				
				int reservationNo = reservation.getNo();
				List<String> symptomList = ReservationsDAO.selectSymptomList(reservationNo);
				List<Medical> medicalList = ReservationsDAO.selectMedicalList(reservationNo);
				
				reservation.setSymptomList(symptomList);
				reservation.setMedicalList(medicalList);
				System.out.println(reservation);
			}
			//reservationList에 담겨있는 Reservation객체내에는 증상과 진료명 넣어진 상태임
			//그 객체 리스트를 json으로 만들어서 보내줌
			String json = mapper.writeValueAsString(reservationList);
		
		
		//병원번호로 불러온 예약리스트 -> 하나씩 불러서 예약번호를 얻어옴
		//예약번호로 그 예약에 해당하는 증상과 진료명을 리스트로 받아오고, 객체에 속성을 셋팅해줌
		
		
		resp.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		out.print(json);
		

		
	}
	
	
}
