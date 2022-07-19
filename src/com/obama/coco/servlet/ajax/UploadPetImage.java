package com.obama.coco.servlet.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/ajax/uploadPetImage.json")
public class UploadPetImage extends HttpServlet{
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 //1)form data받아오기
	 //String id = request.getParameter("profile")로 받아올 수가 없음 (multipartForm data 로 넘겼기때문)
	 //(multipartFormdata 로 설정해주지않으면 기본 application-url/xxx이 enctype이기때문에 문자열로 넘어옴 이때는 가능
	 //따라서 multipartFormdata로 넘겨준걸 받아오려면 cos라이브러리를 사용해서 MultipartRequest객체를 이용
	
	 //String type = req.getparameter("type")
			//syso(type) 해도 null임!!
			//type을 파라미터로 넘겨줬는데 왜 null???  =>  multipart form data로 넘겨준 것은 req.getParameter로 못받아온다!!!
			//cos라이브러리로 MultipartRequest 객체를 이용해야만 받아올 수 있다!!
			//web-inf에다가 cos.jar 가져다놓음!

			//upload했을때 (현재의 톰캣의 경로를 얻어와야함) ( d드라이브에다가 파일 업로드하고싶으면)

			//multipartRequest는 인자가 5개임! 1.HttpServeltRequest request2.uploadPath (파일을 저장할 경로)3.(파일의 사이즈)4.(넘어온 파라미터의 인코딩방식)5.(중복된 파일명이 있을때 처리를 위한 file rename policy)
	// MultipartRequest mr = new MultipartRequest(req, "c:/test/", 1024*1024*100,//100메가"UTF-8", new DefaultFileRenamePolicy() );
	 //우리는 톰캣 경로를 얻어와서 upload폴더에 사진을 업로드할 것임!!
	 //톰캣경로 얻어오기
	 ServletContext application = req.getServletContext();
	 //ServletContext자체가 톰캣, Was다라고 생각해도됨(Was같은놈) (Was 공통을 ServletContext..??)
	 //톰캣 경로!! (WAS 기본경로!)
	 String root= application.getRealPath("/");
	 
	 
	 //upload폴더 경로
	 String uploadPath = root+"upload"+File.separator;
	 System.out.println(uploadPath);
	 
	 MultipartRequest mr = new MultipartRequest(req,uploadPath, 1024*1024*100,"UTF-8", new DefaultFileRenamePolicy() );
	 
	 //파일의 이름 (내가 formData에 넣어준 속성 명) (formData.append("petImage",file,file.name))에서 petImage임 input의 id나 name과는 상관없음
	 String fileName = mr.getFilesystemName("petImage");
	
	 //2)json으로 출력
	 resp.setContentType("application/json; charset=UTF-8");
	 resp.setContentType("text/html; charset=UTF-8");
	 PrintWriter out = resp.getWriter();
	 out.print("{\"fileName\":\""+fileName+"\"}");
}//doPost 
}
