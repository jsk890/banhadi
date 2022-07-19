package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Species;

public class SpeciesDAO {
	
	public static List<Species> selectSpecies(){
		//System.out.println("selectSpecies List 쿼리 실행");
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("species.selectSpecies");	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	
	
	public static Species selectOne(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("species.selectOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	public static List<Species> selectList() {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("species.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}//selectList() end
}
