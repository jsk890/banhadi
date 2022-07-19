package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.UsersDAO;


@WebServlet("/ajax/checkEmail.json")
public class CheckEmail extends Controllers{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @Method		: doGet
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: 전송방식 get
	 * @변경이력		: 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Map<String,Object> params	= getParamMap(request);
			
			int count					= UsersDAO.selectCheckEmailId(params);
			
			Map<String,Object> ajax	= new HashMap<String,Object>();
			ajax.put("result", (count >= 1));
		
			response(response, ajax);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method		: doPost
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: 전송방식 post
	 * @변경이력		: 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Map<String,Object> params	= getParamMap(request);
			
			int count					= UsersDAO.selectCheckEmailId(params);
			
			Map<String,Object> ajax	= new HashMap<String,Object>();
			ajax.put("result", (count >= 1));
		
			response(response, ajax);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
