package com.obama.coco.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;

/**
 * 
 * @파일명	: LicenseDAO
 * @작성일	: 2021. 1. 28.
 * @작성자	: 
 * @설명		: 라이센스 관련 database access object
 * @변경이력	:
 */
public class LicensesDAO {
	/**
	 * @Method		: selectCheckLicense
	 * @작성일 		: 2021. 1. 29.
	 * @작성자 		: 
	 * @Method 설명	: 면허번호 조회
	 * @변경이력		: 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static Map<String,Object> selectCheckLicense(Map<String,Object> params) throws Exception {
		SqlSession session 			= null;
		 Map<String,Object> result	= null;
		try {
			session = SqlSessionUtil.getSession();
			result	= session.selectOne("licenses.selectCheckLicense", params);
		} catch (Exception e) {
			throw e;
		} finally {
			if(session != null)
				session.close();
		}
		return result;
	}
}
