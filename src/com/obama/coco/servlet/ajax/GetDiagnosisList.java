package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.obama.coco.dao.OpinionsDAO;
import com.obama.coco.dao.ReservationsDAO;
import com.obama.coco.util.PaginateUtil;
import com.obama.coco.vo.Medical;
import com.obama.coco.vo.Opinion;
import com.obama.coco.vo.PageVO;
import com.obama.coco.vo.Reservation;

@WebServlet("/ajax/diagnosisList.json")
public class GetDiagnosisList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String userNoStr = req.getParameter("userNo");
	    String petNoStr = req.getParameter("petNo");
	    String pageNoStr = req.getParameter("pageNo");
	    String numPageStr = req.getParameter("numPage");
		System.out.println("유저번호는 "+userNoStr +" 펫 번호는 "+petNoStr);
		int userNo = Integer.parseInt(userNoStr);
		int petNo = Integer.parseInt(petNoStr);
		int pageNo = Integer.parseInt(pageNoStr);
		int numPage = Integer.parseInt(numPageStr);
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("petNo", petNoStr);
		map.put("userNo", userNoStr);
		int total = ReservationsDAO.selectTotal(map);
		int numBlock = 5;
		
		PageVO pageVO = new PageVO(pageNo, numPage);
		int start = pageVO.getStart();
		int end = pageVO.getEnd();
		
		map.put("start", start);
		map.put("end", end);
		List<Reservation> reservationList = ReservationsDAO.paginateReservationsListByPet(map);
		//List<Reservation> reservationList = ReservationsDAO.selectReservationListByPet(map);
		String url = "/myPetHome.jsp";
		String param = "page="; // 파라미터
		
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
		
		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> paginatemap = new ConcurrentHashMap<String, Object>();
		paginatemap.put("paginate", paginate);
		mapList.add(paginatemap);
		for(Reservation reservation : reservationList) {
			Map<String, Object> jsonMap = new ConcurrentHashMap<String, Object>();
			jsonMap.put("reservationDate", reservation.getReservationsDate());
			jsonMap.put("hospitalName",reservation.getHospitalName());
			jsonMap.put("reservationNo", reservation.getNo());
			int reservationNo = reservation.getNo();
			List<Medical> medicalList = ReservationsDAO.selectMedicalList(reservationNo);
			reservation.setMedicalList(medicalList);
			jsonMap.put("totalPrice",reservation.getTotalPrice());
			jsonMap.put("medicalList", medicalList);
			reservation.setMedicalList(medicalList);
			
			Opinion result = OpinionsDAO.selectOpinion(reservationNo);
			jsonMap.put("doctorName",result.getDoctorName());
			
			
			mapList.add(jsonMap);
			
			
		}//for end
		
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(mapList);
	
		
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(json);
		
		
		
	}
}
