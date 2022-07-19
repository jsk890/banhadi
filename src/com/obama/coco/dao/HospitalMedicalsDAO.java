package com.obama.coco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.Hospital;

public class HospitalMedicalsDAO {
	
	public static List<Hospital> selectHospitalMedicalList(Map<String, Object> map){
		//System.out.println("selectHospitalMedicalList List 쿼리 실행");
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("hospitalMedicals.selectHospitalMedicalList",map);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	public static int selectHospitalMedicalListTotal(Map<String, Object> map){
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			//Integer형으로 넘어오는데 int형으로 언박싱해서 리턴
			return session.selectOne("hospitalMedicals.selectHospitalMedicalListTotal",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}

	
}
