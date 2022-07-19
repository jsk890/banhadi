package com.obama.coco.servlet.ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.obama.coco.dao.HospitalsDAO;
import com.obama.coco.dao.UsersDAO;


@WebServlet("/ajax/HospitalCeoJoin.json")
@MultipartConfig(maxFileSize=1024*1024*3, location="C:\\upload_file")
public class HospitalCeoJoin extends Controllers{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			Part part		= request.getPart("file");
			String fileName	= getFilename(part);
			if(fileName != null && !fileName.isEmpty()){
	            part.write(fileName);
	            System.out.println("12341234");
	        }
			
			
			Map<String,Object> params	= getParamMap(request);
			String birthday		= String.valueOf(params.get("birthday")).replace("-", "");
			birthday			= birthday.substring(4,6) + "-" + birthday.substring(6) + "-" + birthday.substring(0, 4);
			
			params.put("email", 	String.valueOf(params.get("emailId")) + "@" + String.valueOf(params.get("emailDomain")));
			params.put("password", 	params.get("password1"));
			params.put("name", 		params.get("userName"));
			params.put("birthday", 	birthday);
			params.put("phone", 	params.get("hpNo"));
			params.put("type", 		params.get("type"));
			
			//users 추가
			int result = UsersDAO.insertUser(params);
//			if (result != 0) {
//				response.sendRedirect("/login.jsp");
//			}
			//1.병원번호 받아오기
			Map<String,Object> info	= HospitalsDAO.selectHospitalsNo(params);
			
			params.put("hospitalNo", 	info.get("NO"));
			params.put("picture", 		fileName);
			params.put("licenseNumber", params.get("licenseNumber"));
			params.put("position", 		params.get("position"));
			
			System.out.println(params.get("email"));
			Map<String,Object> user_no	= UsersDAO.selectUserNo(params);
			
			params.put("USERNO", user_no.get("NO"));
			//experts 추가
			System.out.println("55555555555");
			System.out.println(params.get("USERNO"));
			UsersDAO.insertExperts(params);
			//hospitals 추가
			HospitalsDAO.insertHospital(params);
			
			Map<String,Object> ajax	= new HashMap<String,Object>();
			ajax.put("result", true);
			
			response(response, ajax);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getFilename(Part part){
        String fileName = null;        
        String contentDispositionHeader = part.getHeader("content-disposition");
        String [] elements = contentDispositionHeader.split(";");
        
        for(String element: elements){
            fileName = element.substring(element.indexOf('=')+1);
            fileName = fileName.trim().replace("\""," ");
        }        
        return fileName;
    }
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		String id = req.getParameter("id");
//		String type = req.getParameter("type");
//		
//		System.out.println(id +"아이디넘어옴");
//		System.out.println(type +"type넘어옴");
//		
//	}
}
