package com.obama.coco.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.obama.coco.util.SqlSessionUtil;
import com.obama.coco.vo.PageVO;
import com.obama.coco.vo.Reply;

public class RepliesDAO {

	public static List<Reply> selectPageList(PageVO pageVO) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("replies.selectPageList", pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}//selectPageList() end
	
	public static int selectTotal(int questionNo) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectOne("replies.selectTotal", questionNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return 0;
	}//selectTotal() end
	
	public static List<Reply> selectList(int questionNo) {
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("replies.selectList", questionNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		return null;
	}
	
}
