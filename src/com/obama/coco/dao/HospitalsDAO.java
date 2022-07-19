package com.obama.coco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Hospital;

/**
 * 
 * @파일명	: HospitalsDAO
 * @작성일	: 2021. 1. 29.
 * @작성자	: 
 * @설명		: 병원 관련 database access object
 * @변경이력	:
 */
public class HospitalsDAO {
	/**
	 * @Method		: selectHospitals
	 * @작성일 		: 2021. 1. 29.
	 * @작성자 		: 
	 * @Method 설명	: 병원정보 조회(팝업)
	 * @변경이력		: 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static List<Map<String,Object>> selectHospitals(Map<String,Object> params) throws Exception {
		SqlSession session 				= null;
		List<Map<String,Object>> result	= null;
		try {
			session = SqlSessionUtil.getSession();
			result	= session.selectList("hospitals.selectHospitals", params);
			
		} catch (Exception e) {
			throw e;
		} finally {
			if(session != null)
				session.close();
		}
		return result;
	}
	
	/**
	 * @Method		: selectHospitalsNo
	 * @작성일 		: 2021. 1. 29.
	 * @작성자 		: 
	 * @Method 설명	: 병원 일련번호 MAX + 1 조회
	 * @변경이력		: 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static Map<String,Object> selectHospitalsNo(Map<String,Object> params) throws Exception {
		SqlSession session 				= null;
		Map<String,Object> result	= null;
		try {
			session = SqlSessionUtil.getSession();
			result	= session.selectOne("hospitals.selectHospitalsNo", params);
			
		} catch (Exception e) {
			throw e;
		} finally {
			if(session != null)
				session.close();
		}
		return result;
	}
	
	public static void insertHospital(Map<String,Object> params) throws Exception {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			session.insert("hospitals.insertHospital", params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)
				session.close();
		}
	}//
	
	public static Hospital selectHospital(Map<String, Object> map) {
		Hospital hospital = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			hospital = session.selectOne("hospitals.selectHospitalbyNoState",map);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return hospital;
	}// selectOne end

}
