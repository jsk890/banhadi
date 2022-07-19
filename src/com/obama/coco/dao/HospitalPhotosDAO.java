package com.obama.coco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.HospitalPhoto;

public class HospitalPhotosDAO {
	
	public static List<HospitalPhoto> selectHospitalPhotoList(int hospital){

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("hospital_photos.selectHospitalPhotoList", hospital);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
}
