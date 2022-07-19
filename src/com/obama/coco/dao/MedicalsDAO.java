package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Medical;

public class MedicalsDAO {
	public static List<Medical> selectMedicalList(String medical){
		System.out.println("selectMedicalList List 쿼리 실행");
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("medicals.selectMedicalList",medical);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	public static List<Medical> searchList (String search) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("medicals.selectList",search);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return null;
	}
}
