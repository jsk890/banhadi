package com.obama.coco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Question;

public class QuestionsDAO {
	
	public static List<Question> selectQuestionList(Map<String, Object> map){
		List<Question> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("questions.selectQuestionList",map);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return list;
	}
	
	public static int selectUsefulCount(int question){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("questions.selectUsefulCount",question);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}
	public static int selectQuestionCount(Question question){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("questions.selectQuestionCount",question);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}
	
	
	public static Question selectOne(int questionNo) {
		Question question = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			question = session.selectOne("questions.selectOne", questionNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return question;
	}//selectOne() end
	
	
	public static List<Question> selectList() {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("questions.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}//selectList() end
	
}
