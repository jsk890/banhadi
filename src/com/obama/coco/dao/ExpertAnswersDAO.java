package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.ExpertAnswer;

public class ExpertAnswersDAO {

	public static int selectTotal(int questionNo) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("expert_answers.selectTotal", questionNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}//selectTotal() end
	
	public static List<ExpertAnswer> selectAnswerList(int questionNo) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("expert_answers.selectAnswerList", questionNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}//selectTotal() end
	
}
