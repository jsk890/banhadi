package com.obama.coco.dao;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.ExpertAnswer;
import com.obama.coco.vo.User;

public class ExpertAnswerDAO {

	
	public static int insertAnswer(ExpertAnswer ExpertAnswer) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("expert_answers.insertAnswers",ExpertAnswer);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return 0;
	}//login end
}
