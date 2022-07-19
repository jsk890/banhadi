package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Expert;
import com.obama.coco.vo.User;

public class ExpertsDAO {

	
	public static Expert getExpert(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("experts.selectProfile",no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return null;
	}//getExpert end
	
	public static List<Expert> getHospitalMember(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("experts.selectHospiterMember",no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return null;
	}//getExpert end
	
	
	public static Expert selectOne(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("experts.selectOne",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}//selectList() end
	
	
	
}
