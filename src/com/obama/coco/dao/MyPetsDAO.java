package com.obama.coco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.MyPet;





public class MyPetsDAO {
	

	public static List<MyPet> selectMypetList(int userNo){
		//System.out.println("selectMypets map 쿼리 실행");
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("myPets.selectMypetList",userNo);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
	public static List<MyPet> selectMyPetList(int userNo) {
		List<MyPet> myPetList = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			myPetList = session.selectList("myPets.selectMyPetList",userNo);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return myPetList;
	}// selectList end
	
	
	public static MyPet selectMyPet(Map map) {
		MyPet myPet = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			myPet = session.selectOne("myPets.selectMyPet",map);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return myPet;
	}// selectMyPet end

	public static MyPet selectMyNewPet(int userNo) {
		MyPet myPet = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			myPet = session.selectOne("myPets.selectMyNewPet",userNo);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return myPet;
	}// selectMyNewPet end

	public static int updateMyPet(MyPet mypet) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("myPets.updateMyPet",mypet);
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}// updateMyPet end

	public static int registerMyPet(MyPet mypet) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("myPets.registerMyPet",mypet);
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}// registerMyPet end
	
}
