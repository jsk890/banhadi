package com.obama.coco.dao;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;

public class ReviewsDAO {
	
	public static int selectReviewCount(int hospital){
		//System.out.println("selectReviewCount int 쿼리 실행");
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			if(session.selectOne("reviews.selectReviewCount",hospital)!=null) {
				return session.selectOne("reviews.selectReviewCount",hospital);
			}
			else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}
	
}
