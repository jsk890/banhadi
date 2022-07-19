package com.obama.coco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.obama.coco.vo.User;

import com.obama.coco.util.SqlSessionUtil;

/**
 * 
 * @파일명	: UsersDAO
 * @작성일	: 2021. 1. 28.
 * @작성자	: 
 * @설명		: 사용자 관련 database access object
 * @변경이력	:
 */
public class UsersDAO {
	
	public static User login(User user) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("users.selectLogin",user);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return null;
	}//login end
	public static String getName(int no) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("users.selectName",no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return null;
	}//login end
	/**
	 * @Method		: selectCheckEmailId
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: 이메일 유효성 체크를 위한 dao
	 * @변경이력		: 
	 * @param params
	 * @return
	 */
	public static int selectCheckEmailId(Map<String,Object> params) throws Exception {
		SqlSession session = null;
		int result	= 0;
		try {
			session = SqlSessionUtil.getSession();
			result	= session.selectOne("users.selectCheckEmailId", params);
		} catch (Exception e) {
			throw e;
		} finally {
			if(session != null)
				session.close();
		}
		return result;
	}
	
	/**
	 * @Method		: insertUser
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: 일반 가입정보 저장
	 * @변경이력		: 
	 * @param params
	 * @throws Exception
	 */
	public static int insertUser(Map<String,Object> params) throws Exception {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.insert("users.insertUser", params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)
				session.close();
		}
		return 0;
	}
	
	/**
	 * @Method		: insertExperts
	 * @작성일 		: 2021. 1. 29.
	 * @작성자 		: 
	 * @Method 설명	: 병원관계자 정보 저장
	 * @변경이력		: 
	 * @param params
	 * @throws Exception
	 */
	public static void insertExperts(Map<String,Object> params) throws Exception {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			session.insert("users.insertExpert", params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)
				session.close();
		}
	}
	
	public static Map<String,Object> selectUserNo(Map<String,Object> params) throws Exception {
		SqlSession session = null;
		Map<String,Object> result	= null;
		try { System.out.println("2222222222");
			session = SqlSessionUtil.getSession();
			result = session.selectOne("users.selectUserNo", params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {System.out.println("33333333");
			//if(session != null)
				session.close();
		} System.out.println("4444444444");
		return result;
	}
	
	
	
	public static int selectCheckEmailAndName(User user) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("users.selectCheckEmailAndName",user);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return 0;
	}
	
	public static int updatePassword(User user) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.update("users.updatePassword",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}//updatePassword() end
	
	public static List<User> selectList() {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("users.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}//selectList() end
	
	public static User selectLogin(User user) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("users.selectLogin",user);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}//try~finally end
		return null;
	}//selectLogin end
	
}
