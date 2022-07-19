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
import com.obama.coco.dao.FacilitiesDAO;
import com.obama.coco.dao.HospitalMedicalsDAO;
import com.obama.coco.dao.HospitalPhotosDAO;
import com.obama.coco.dao.MyPetsDAO;
import com.obama.coco.dao.ReviewsDAO;
import com.obama.coco.util.PaginateUtil;
import com.obama.coco.vo.Facility;
import com.obama.coco.vo.Hospital;
import com.obama.coco.vo.MyPet;
import com.obama.coco.vo.PageVO;

@WebServlet("/ajax/hospitalMedicals.json")
public class HospitalMedicals extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("servlet.ajax.HospitalMedicals.java");
		resp.setContentType("application/json; charset=UTF-8");
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		PrintWriter out = resp.getWriter();
		

		
		int userNo = 13;
		try {
			userNo = Integer.parseInt(req.getParameter("userNo"));
		}catch(Exception e) {
			
		}
		
		
		//페이지 설정
		int pageNo = 1; //시작페이지
		int numPage = 10; //페이지당 보여질 게시물 수
		int total = 0; //전체 게시물 수
		int numBlock = 5; // 페이지바에 최대로 보여질 숫자 갯수
		String url = "/diagnosisList.jsp"; //다시 이동할 페이지 주소 (현재페이지)
		String param= "pageNo=";// 값을 넣어줄 파라미터
		
		//페이지네이트용 페이지 스트링 변환
		String pageStr = req.getParameter("pageNo");
		try{
			pageNo = Integer.parseInt(pageStr);
		}catch(Exception e){
		}
		
		//페이지네이트 페이지 계산
		PageVO pageVO = new PageVO(pageNo, numPage);
		map.put("start", pageVO.getStart());
		map.put("end", pageVO.getEnd());

		
		//필터값 받아오기
		//스트링으로 받기 : ajax에 연결된 key값
		String species = "1";
		String emergency = "f";
		String diagnosis = "";
		String dateStr = "1609834327000";
		//Timestamp date = Timestamp.valueOf(dateStr) ;
		String[] facilitiesParam = req.getParameterValues("facility[]");
		//String[] facilities = new String[3];
		String minPrice = "0";
		String maxPrice = "1500000";
		
		//Timestamp date = Timestamp.valueOf(dateStr);
		// 
		int parking=0;
		int bed=0;
		int hotel=0;
		
		try {

			species = req.getParameter("species");
			emergency = req.getParameter("emergency");
			diagnosis = req.getParameter("diagnosis");
			dateStr = req.getParameter("date");
			minPrice = req.getParameter("minPrice");
			maxPrice = req.getParameter("maxPrice");
			
			try {
				for(String f : facilitiesParam) {
					System.out.println("f:"+f);
					if(f.equals("1")) {
						parking = 1;
					}
					if(f.equals("2")) {
						bed = 1;
					}
					if(f.equals("3")) {
						hotel = 1;
					}
				}
			}catch(Exception e) {
			}

		}catch(Exception e) {
		}
		
		//쿼리필터값 넣기
		//맵에 넣기 : 쿼리로 연결할 key값 설정, key에 들어갈 value값 설정
		try {
			map.put("species", species);
			map.put("emergency",emergency);
			map.put("diagnosis","%"+diagnosis+"%");
			map.put("minPrice",minPrice);
			map.put("maxPrice",maxPrice);
			map.put("parking", parking);
			map.put("bed", bed);
			map.put("hotel", hotel);
		}catch(Exception e) {
			emergency = "f";
			diagnosis ="";
			dateStr ="1609834327000";
			minPrice ="0";
			maxPrice ="1500000";
			map.put("emergency",emergency);
			map.put("diagnosis","%"+diagnosis+"%");
			map.put("minPrice",minPrice);
			map.put("maxPrice",maxPrice);
		}

		//쿼리 실행한 결과 리스트에 담기
		List<Hospital> list = HospitalMedicalsDAO.selectHospitalMedicalList(map);
		
		
		//시설 필터
		for(Hospital hospital : list) {
			//Facility facility = new Facility(hospital.getNo(),facilities);
			//hospital.setFacilities(FacilitiesDAO.selectFacilityFilterList(facility));
		}
		
		total = HospitalMedicalsDAO.selectHospitalMedicalListTotal(map); //전체 게시물 수
		map.put("total",total);

		//페이지네이트 생성
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
		
		//리뷰갯수 담아주기
		for(Hospital hospital : list) {
			hospital.setReviewCnt(ReviewsDAO.selectReviewCount(hospital.getNo()));
		}
		//시설 배열로 담아주기
		for(Hospital hospital : list) {
			hospital.setFacilities(FacilitiesDAO.selectFacilityList(hospital.getNo()));
		}

		//사진 배열로 담아주기
		for(Hospital hospital : list) {
			hospital.setHospitalPhotos(HospitalPhotosDAO.selectHospitalPhotoList(hospital.getNo()));
		}
		
		/*
		//예약가능시간 배열로 담아주기
		for(Hospital hospital : list) {
			AvailableTime availableTime = new AvailableTime(hospital.getNo(),dateStr);
			hospital.setAvailableTime(AvailableTimeDAO.selectAvailableTimeList(availableTime));
		}
		*/
		
		List<MyPet> myPetList = MyPetsDAO.selectMypetList(Integer.valueOf(userNo));
		
		
		//위과정에서 리스트가 비어있고 페이지번호가 1번이 아니라면
		if(pageNo!=1 && list.isEmpty()){
			resp.sendRedirect("diagnosisList.jsp?pageNo=1");
		}//if end
		
		
		//새 맵 생성후 json배열, 페이지네이트 담기
		Map<String, Object> listMap = new ConcurrentHashMap<String, Object>();
		//json에 표시될 key값, key에 담을 value값
		listMap.put("list", list);
		listMap.put("myPetList",myPetList);
		listMap.put("paginate", paginate);
		
		ObjectMapper om = new ObjectMapper();
		try {
			String json = om.writeValueAsString(listMap);
			out.print(json);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
