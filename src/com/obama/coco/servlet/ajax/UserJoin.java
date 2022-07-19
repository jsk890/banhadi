package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.UsersDAO;
import com.obama.coco.servlet.ajax.parent.Controllers;

@WebServlet("/ajax/userJoin.json")
public class UserJoin extends Controllers{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Map<String,Object> params	= getParamMap(request);
			
			int result = UsersDAO.insertUser(params);
			
			Map<String,Object> ajax	= new HashMap<String,Object>();
			ajax.put("result", true);
			
			response(response, ajax);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
