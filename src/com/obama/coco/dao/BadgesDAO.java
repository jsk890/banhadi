package com.obama.coco.dao;


import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;

public class BadgesDAO {
	
	public static int selectTotal() {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("badges.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}//selectTotal() end
	
}
