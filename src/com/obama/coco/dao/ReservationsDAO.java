package com.obama.coco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Medical;
import com.obama.coco.vo.Reservation;



public class ReservationsDAO {
	
	public static List<Reservation> selectList(Map<String, Object> map) {
		List<Reservation> list = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("reservations.selectList",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList
	
	
	public static List<Reservation> selectAllList(int hospitalNo) {
		List<Reservation> list = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("reservations.selectAllList",hospitalNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList

	
	public static Reservation selectOne(int reservationNo) {
		Reservation reservation = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			reservation = session.selectOne("reservations.selectOne",reservationNo);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return reservation;
	}//selectOne
	
	public static List<Medical> selectMedicalList(int reservationNo) {
		List<Medical> medicalList = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			medicalList = session.selectList("reservations.selectMedicalList",reservationNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return medicalList;
	}//selectMedicalList
	
	public static List<String> selectSymptomList(int reservationNo) {
		List<String> symptomList = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			symptomList = session.selectList("reservations.selectSymptomList",reservationNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return symptomList;
	}//selectSymptomList
	
	public static int updateStateToComplete(int reservationNo) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("reservations.updateStateToComplete",reservationNo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//updateStateToComplete
	
	
	public static int updateStateToTrue(int reservationNo) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("reservations.updateStateToTrue",reservationNo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//updateStateToComplete
	
	public static int updateStateToReject(int reservationNo) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("reservations.updateStateToReject",reservationNo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//updateStateToComplete
	
	public static List<Reservation> selectReservationListByPet(Map<String, Object> map) {
		List<Reservation> reservationList = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			reservationList = session.selectList("reservations.selectReservationListByPet",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return reservationList;
	}//selectMedicalList
	
	public static List<Reservation> paginateReservationsListByPet(Map<String, Object> map) {
		List<Reservation> reservationList = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			reservationList = session.selectList("reservations.paginateReservationsListByPet",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return reservationList;
	}//paginateReservationsListByPet
	
	public static int selectTotal(Map<String, Object> map) {
		int total = 0 ;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			total = session.selectOne("reservations.selectTotal",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return total;
	}//selectTotal
	
	
}
