package com.obama.coco.util;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;

public class SqlSessionUtil {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("/com/obama/coco/config/mybatis-config.xml");
			factory  = new SqlSessionFactoryBuilder().build(reader) ;
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	//static 영역
				
	public static SqlSession getSession() {
	
		return  factory.openSession(true);
			
	
	}//getSession end
	
}
