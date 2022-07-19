package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Facility;

public class FacilitiesDAO {
	
	public static List<Facility> selectFacilityFilterList(Facility facility){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("facilities.selectFacilityFilterList",facility);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	public static List<Facility> selectFacilityList(int hospital){

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("facilities.selectFacilityList", hospital);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
}
