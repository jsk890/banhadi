package com.obama.coco.dao;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.ExpertAnswer;
import com.obama.coco.vo.MedicalAnswer;

public class MedicalAnswersDAO {
	public static int insertMedicalAnswers (MedicalAnswer medicalAnswers) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("medical_answers.insertMedicalAnswers",medicalAnswers);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return 0;
	}//insertAnswer end
}
