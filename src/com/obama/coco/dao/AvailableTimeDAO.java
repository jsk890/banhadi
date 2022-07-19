package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.AvailableTime;

public class AvailableTimeDAO {
	
	public static List<AvailableTime> selectAvailableTimeTotalList(int hospital){

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("availableTime.selectAvailableTimeTotalList", hospital);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	public static List<AvailableTime> selectAvailableTimeFilterList(AvailableTime availableTime){

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("availableTime.selectAvailableTimeFilterList", availableTime);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
}
