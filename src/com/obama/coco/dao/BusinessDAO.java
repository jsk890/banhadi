package com.obama.coco.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;

/**
 * 
 * @파일명	: BusinessDAO
 * @작성일	: 2021. 1. 28.
 * @작성자	: 
 * @설명		: 병원정보 관련 database access object
 * @변경이력	:
 */
public class BusinessDAO {
	/**
	 * @Method		: selectCheckBusiness
	 * @작성일 		: 2021. 1. 29.
	 * @작성자 		: 
	 * @Method 설명	: 병원 사업자정보 조회
	 * @변경이력		: 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static Map<String,Object> selectCheckBusiness(Map<String,Object> params) throws Exception {
		SqlSession session 			= null;
		 Map<String,Object> result	= null;
		try {
			session = SqlSessionUtil.getSession();
			result	= session.selectOne("business.selectCheckBusiness", params);
		} catch (Exception e) {
			throw e;
		} finally {
			if(session != null)
				session.close();
		}
		return result;
	}
}
