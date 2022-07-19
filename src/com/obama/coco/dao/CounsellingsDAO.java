package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.*;

public class CounsellingsDAO {

	
	public static List<Question> selectRankTop() {
		List<Question> selectRankTop = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			selectRankTop = session.selectList("counsellings.selectRankTop");

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return selectRankTop;
	}// selectList end
	
}
