package com.obama.coco.dao;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Hospital;
import com.obama.coco.vo.Opinion;

public class OpinionsDAO {

	public static int insert(Opinion opinion) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("opinions.insertOpinion",opinion);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//insert opinion end
	
	public static Opinion selectOpinion(int reservationNo) {
		Opinion result = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("opinions.selectOpinion",reservationNo);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//select opinion end
	
	
	public static int update(Opinion opinion) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("opinions.updateOpinion",opinion);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//insert opinion end
	
}
