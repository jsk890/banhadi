package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.HospitalsDAO;


@WebServlet("/ajax/searchHospitals.json")
public class SearchHospitals extends Controllers{
	private static final long serialVersionUID = 1L;

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
			
			List<Map<String,Object>> result	= HospitalsDAO.selectHospitals(params);
			
			Map<String,Object> ajax	= new HashMap<String,Object>();
			ajax.put("result", result);
		
			response(response, ajax);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
