package com.obama.coco.servlet.ajax;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Controllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final Map<String,String> CONTENT_TYPE_IMAGE	= new HashMap<String,String>();
	static{
		CONTENT_TYPE_IMAGE.put("3ds","image/x-3ds");
		CONTENT_TYPE_IMAGE.put("art","image/x-jg");
		CONTENT_TYPE_IMAGE.put("bmp","image/bmp");
		CONTENT_TYPE_IMAGE.put("btif","image/prs.btif");
		CONTENT_TYPE_IMAGE.put("cgm","image/cgm");
		CONTENT_TYPE_IMAGE.put("cmx","image/x-cmx");
		CONTENT_TYPE_IMAGE.put("dib","image/bmp");
		CONTENT_TYPE_IMAGE.put("djv","image/vnd.djvu");
		CONTENT_TYPE_IMAGE.put("djvu","image/vnd.djvu");
		CONTENT_TYPE_IMAGE.put("dmg","application/x-apple-diskimage");
		CONTENT_TYPE_IMAGE.put("dwg","image/vnd.dwg");
		CONTENT_TYPE_IMAGE.put("dxf","image/vnd.dxf");
		CONTENT_TYPE_IMAGE.put("fbs","image/vnd.fastbidsheet");
		CONTENT_TYPE_IMAGE.put("fh","image/x-freehand");
		CONTENT_TYPE_IMAGE.put("fh4","image/x-freehand");
		CONTENT_TYPE_IMAGE.put("fh5","image/x-freehand");
		CONTENT_TYPE_IMAGE.put("fh7","image/x-freehand");
		CONTENT_TYPE_IMAGE.put("fhc","image/x-freehand");
		CONTENT_TYPE_IMAGE.put("fpx","image/vnd.fpx");
		CONTENT_TYPE_IMAGE.put("fst","image/vnd.fst");
		CONTENT_TYPE_IMAGE.put("g3","image/g3fax");
		CONTENT_TYPE_IMAGE.put("gif","image/gif");
		CONTENT_TYPE_IMAGE.put("ico","image/x-icon");
		CONTENT_TYPE_IMAGE.put("ief","image/ief");
		CONTENT_TYPE_IMAGE.put("iso","application/x-iso9660-image");
		CONTENT_TYPE_IMAGE.put("jpe","image/jpeg");
		CONTENT_TYPE_IMAGE.put("jpeg","image/jpeg");
		CONTENT_TYPE_IMAGE.put("jpg","image/jpeg");
		CONTENT_TYPE_IMAGE.put("ktx","image/ktx");
		CONTENT_TYPE_IMAGE.put("mac","image/x-macpaint");
		CONTENT_TYPE_IMAGE.put("mdi","image/vnd.ms-modi");
		CONTENT_TYPE_IMAGE.put("mmr","image/vnd.fujixerox.edmics-mmr");
		CONTENT_TYPE_IMAGE.put("npx","image/vnd.net-fpx");
		CONTENT_TYPE_IMAGE.put("odi","application/vnd.oasis.opendocument.image");
		CONTENT_TYPE_IMAGE.put("oti","application/vnd.oasis.opendocument.image-template");
		CONTENT_TYPE_IMAGE.put("pbm","image/x-portable-bitmap");
		CONTENT_TYPE_IMAGE.put("pct","image/pict");
		CONTENT_TYPE_IMAGE.put("pcx","image/x-pcx");
		CONTENT_TYPE_IMAGE.put("pgm","image/x-portable-graymap");
		CONTENT_TYPE_IMAGE.put("pic","image/pict");
		CONTENT_TYPE_IMAGE.put("pict","image/pict");
		CONTENT_TYPE_IMAGE.put("png","image/png");
		CONTENT_TYPE_IMAGE.put("pnm","image/x-portable-anymap");
		CONTENT_TYPE_IMAGE.put("pnt","image/x-macpaint");
		CONTENT_TYPE_IMAGE.put("ppm","image/x-portable-pixmap");
		CONTENT_TYPE_IMAGE.put("psd","image/vnd.adobe.photoshop");
		CONTENT_TYPE_IMAGE.put("qti","image/x-quicktime");
		CONTENT_TYPE_IMAGE.put("qtif","image/x-quicktime");
		CONTENT_TYPE_IMAGE.put("ras","image/x-cmu-raster");
		CONTENT_TYPE_IMAGE.put("rgb","image/x-rgb");
		CONTENT_TYPE_IMAGE.put("rlc","image/vnd.fujixerox.edmics-rlc");
		CONTENT_TYPE_IMAGE.put("sgi","image/sgi");
		CONTENT_TYPE_IMAGE.put("sid","image/x-mrsid-image");
		CONTENT_TYPE_IMAGE.put("svg","image/svg+xml");
		CONTENT_TYPE_IMAGE.put("svgz","image/svg+xml");
		CONTENT_TYPE_IMAGE.put("t3","application/x-t3vm-image");
		CONTENT_TYPE_IMAGE.put("tga","image/x-tga");
		CONTENT_TYPE_IMAGE.put("tif","image/tiff");
		CONTENT_TYPE_IMAGE.put("tiff","image/tiff");
		CONTENT_TYPE_IMAGE.put("uvg","image/vnd.dece.graphic");
		CONTENT_TYPE_IMAGE.put("uvi","image/vnd.dece.graphic");
		CONTENT_TYPE_IMAGE.put("uvvg","image/vnd.dece.graphic");
		CONTENT_TYPE_IMAGE.put("uvvi","image/vnd.dece.graphic");
		CONTENT_TYPE_IMAGE.put("wbmp","image/vnd.wap.wbmp");
		CONTENT_TYPE_IMAGE.put("wdp","image/vnd.ms-photo");
		CONTENT_TYPE_IMAGE.put("webp","image/webp");
		CONTENT_TYPE_IMAGE.put("xbm","image/x-xbitmap");
		CONTENT_TYPE_IMAGE.put("xif","image/vnd.xiff");
		CONTENT_TYPE_IMAGE.put("xpm","image/x-xpixmap");
		CONTENT_TYPE_IMAGE.put("xwd","image/x-xwindowdump");
		CONTENT_TYPE_IMAGE.put("pdf","application/pdf");
	}
	
	/**
	 * ServletOutputStream 으로 이미지를 직접 write 하는 방식을 취한다.
	 * 이미지의 경로가 보안사항일 경우 사용한다.
	 * 
	 * @param imagePathP 다운로드할 이미지경로
	 * @param response HttpServletResponse
	 * @exception IOException
	 */
    public void imageView( String imagePathP , HttpServletResponse response ) throws Exception{
    	String imagePath	= imagePathP.replace("\\", File.separator);
    	imagePath			= imagePath.replace("/", File.separator);
    	
    	String extType		= "$%^&*()!@#$";
    	if(imagePath.lastIndexOf(".")>=0){
    		extType	= imagePath.substring(imagePath.lastIndexOf(".")+1);
    	}

    	String contentType	= "";
    	response.setStatus(HttpServletResponse.SC_OK);
    	contentType	= CONTENT_TYPE_IMAGE.get(extType.toLowerCase());
    	if(contentType==null)
    		throw new Exception("The file is not an image.");
    	
    	File imgFile	= new File(imagePath);
		if(!imgFile.exists() || imgFile.isDirectory())
			throw new Exception("["+imagePath+"] 파일을 찾을 수 없습니다.");

    	imageView(new FileInputStream(imgFile),response,contentType);
    }
    
    /**
	 * ServletOutputStream 으로 이미지를 직접 write 하는 방식을 취한다.
	 * 이미지의 경로가 보안사항일 경우 사용한다.
	 * 
	 * @param is 다운로드할 이미지 stream
	 * @param response 
	 * @param imageContentType 이미지 타입
	 * @exception IOException
	 */
    public void imageView( InputStream is , HttpServletResponse response, String imageContentType ) throws Exception{
    	response.setContentType(imageContentType);
    	write(is , response.getOutputStream());
	}
    public void imageView( byte[] bytes , HttpServletResponse response, String imageContentType ) throws Exception{
    	response.setContentType(imageContentType);
    	response.setContentLength(bytes.length);
    	write(bytes , response.getOutputStream());
	}
    public String getImageContentType(String fileName) throws Exception{
    	String extType	= null;
    	String contentType	= "";
    	if(fileName.lastIndexOf(".")>=0)
    		extType	= fileName.substring(fileName.lastIndexOf(".")+1);
    	else
    		extType	= fileName;
    	contentType	= CONTENT_TYPE_IMAGE.get(extType.toLowerCase());
    	if(contentType==null)
    		throw new Exception("The file is not an image.");
    	return contentType;
    }
    
    /**
	 * OutputStream 으로 write.
	 * 
	 * @param is 입력 stream
	 * @param os 출력 stream
	 * @exception IOException
	 */
    public static void write( InputStream is , OutputStream os ) throws IOException{
    	if(is==null || os==null){
    		return;
    	}
    	byte[] buf	= new byte[1024];
    	int iReadSize			= 0;
    	try{
    		while( (iReadSize=is.read(buf))!=-1 ){
    			os.write(buf,0,iReadSize);
    		}
    		os.flush();
    	}catch(IOException ie){
    		throw ie;
    	}finally{
    		try{if(is!=null){is.close();}}catch(IOException ie){}
    		try{if(os!=null){os.close();}}catch(IOException ie){}
    	}
    }
    
    /**
 	 * OutputStream 으로 write.
 	 * 
 	 * @param is 입력 stream
 	 * @param os 출력 stream
 	 * @exception IOException
 	 */
     public static void write( byte[] bytes , OutputStream os ) throws IOException{
     	if(bytes==null || os==null)
     		return;
     	try{
 			os.write(bytes);
     		os.flush();
     	}catch(IOException ie){
     		throw ie;
     	}finally{
     		try{if(os!=null){os.close();}}catch(IOException ie){}
     	}
     }
     
     /**
 	 * 파일다운로드를 담당한다.
 	 * @param bytes 다운로드할 파일 bytes
 	 * @param fileName 저장될 파일명
 	 * @param response HttpServletResponse
 	 * @exception IOException
 	 */
     public void fileDown( byte[] bytes,String fileName, HttpServletRequest request, HttpServletResponse response ) throws Exception{
         String browser = getBrowser(request);
         String encodedFilename = "";
         
         if (browser.equals("MSIE")) {
             encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
         } else if (browser.equals("Firefox")) {
             encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
         } else if (browser.equals("Opera")) {
             encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
         } else if (browser.equals("Chrome")) {
             StringBuffer sb = new StringBuffer();
             for (int i = 0; i < fileName.length(); i++) {
                 char c = fileName.charAt(i);
                 if (c > '~') {
                     sb.append(URLEncoder.encode("" + c, "UTF-8"));
                 } else {
                     sb.append(c);
                 }
             }
             encodedFilename = sb.toString();
         } else {
             encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
         }
         response.setStatus(HttpServletResponse.SC_OK);
     	response.setHeader("Content-Type", "application/octet-stream");
     	response.setHeader("Content-Length", String.valueOf(bytes.length));
         response.setHeader("Content-Disposition", "attachment; filename="+encodedFilename);
         response.setHeader("Pragma", "no-cache");
         response.setHeader("Expires", "0");
     	
 		write(bytes,response.getOutputStream());
 	}
     /**
 	 * 파일다운로드를 담당한다.
 	 * @param bytes 다운로드할 파일 bytes
 	 * @param fileName 저장될 파일명
 	 * @param response HttpServletResponse
 	 * @exception IOException
 	 */
     public void imageFileDown( byte[] bytes,String fileName, HttpServletRequest request, HttpServletResponse response ) throws Exception{
         String browser = getBrowser(request);
         String encodedFilename = "";
         
         if (browser.equals("MSIE")) {
             encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
         } else if (browser.equals("Firefox")) {
             encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
         } else if (browser.equals("Opera")) {
             encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
         } else if (browser.equals("Chrome")) {
             StringBuffer sb = new StringBuffer();
             for (int i = 0; i < fileName.length(); i++) {
                 char c = fileName.charAt(i);
                 if (c > '~') {
                     sb.append(URLEncoder.encode("" + c, "UTF-8"));
                 } else {
                     sb.append(c);
                 }
             }
             encodedFilename = sb.toString();
         } else {
             encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
         }
         response.setStatus(HttpServletResponse.SC_OK);
     	response.setHeader("Content-Type", getImageContentType(fileName));
     	response.setHeader("Content-Length", String.valueOf(bytes.length));
         response.setHeader("Content-Disposition", "attachment; filename="+encodedFilename);
         response.setHeader("Pragma", "no-cache");
         response.setHeader("Expires", "0");
     	
 		write(bytes,response.getOutputStream());
 	}
     
     /**
      * 브라우저 구분 얻기.
      * @param request
      * @return
      */
    private static String getBrowser(HttpServletRequest request) {
         String header = request.getHeader("User-Agent");
         if(header==null){
             return "MSIE";
         }else if (header.indexOf("MSIE") > -1) {
             return "MSIE";
         } else if (header.indexOf("Chrome") > -1) {
             return "Chrome";
         } else if (header.indexOf("Opera") > -1) {
             return "Opera";
         }
         return "MSIE";
    }
    
    /**
     * @Method		: getParam
     * @작성일 		: 2021. 1. 28.
     * @작성자 		: 
     * @Method 설명	: request paramter value를 추출 
     * @변경이력		: 
     * @param request
     * @param paramId
     * @return
     * @throws Exception
     */
    public String getParam(HttpServletRequest request,String paramId) throws Exception{
		return getParam(request,paramId,-1);
	}
    /**
     * @Method		: getParam
     * @작성일 		: 2021. 1. 28.
     * @작성자 		: 
     * @Method 설명	: request paramter value를 추출
     * @변경이력		: 
     * @param request
     * @param paramId
     * @return
     * @throws Exception
     */
	public String getParam(Map<String,Object> request,String paramId) throws Exception{
		return getParam(request,paramId,-1);
	}
	/**
	 * @Method		: getParam
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: request paramter value를 추출하고 size체크
	 * @변경이력		: 
	 * @param request
	 * @param paramId
	 * @param maxByteSize
	 * @return
	 * @throws Exception
	 */
	public String getParam(HttpServletRequest request,String paramId,int maxByteSize) throws Exception{
		String param	= checkParameter(request,paramId);
		if(maxByteSize>0 && param.getBytes().length>maxByteSize)
			throw new Exception(paramId+" 제한 크기를 초과하였습니다.");
		return param;
	}
	/**
	 * 
	 * @Method		: getParam
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: request paramter value를 추출하고 size체크
	 * @변경이력		: 
	 * @param request
	 * @param paramId
	 * @param maxByteSize
	 * @return
	 * @throws Exception
	 */
	public String getParam(Map<String,Object> request,String paramId,int maxByteSize) throws Exception{
		String param	= checkParameter(request,paramId);
		if(maxByteSize>0 && param.getBytes().length>maxByteSize)
			throw new Exception(paramId+" 제한 크기를 초과하였습니다.");
		return param;
	}
	/**
	 * @Method		: getParamMap
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: request를 map형태로 변환
	 * @변경이력		: 
	 * @param request
	 * @return
	 */
	public Map<String,Object> getParamMap(HttpServletRequest request){
		Map<String,Object> paramMap	= new HashMap<String,Object>();
		Enumeration<?> e	= request.getParameterNames();
		String name	= null;
		while(e.hasMoreElements()){
			name	= (String)e.nextElement();
			paramMap.put(name, request.getParameter(name));
		}
		return paramMap;
	}
	
	public String checkParameter(HttpServletRequest request, String paramId) throws Exception{
		return checkParameter(request.getParameter(paramId), paramId);
	}
	public String checkParameter(Map<String,Object> request, String paramId) throws Exception{
		return checkParameter(String.valueOf(request.get(paramId)==null?"":request.get(paramId)), paramId);
	}
	/**
	 * @Method		: checkParameter
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: request paramter정보 xss방지
	 * @변경이력		: 
	 * @param param
	 * @param paramId
	 * @return
	 * @throws Exception
	 */
	public String checkParameter(String param, String paramId) throws Exception{
		if(param==null)
			return "";
		
		String lowerParam	= param.toLowerCase(Locale.KOREA);
		String[] keywords	= new String[]{
				"<script","javascript","<iframe","<object","<applet","<embed","<form"
				,"select","insert","update","delete","merge","drop","create","declare"
				,"/*","*/","--"
		};
		for(int i=0;i<keywords.length;i++)
			if(lowerParam.indexOf(keywords[i])>=0) {
				keywords[i]	= keywords[i].replace("<","&lt;");
				keywords[i]	= keywords[i].replace(">","&gt;");
				throw new Exception("입력값으로 ["+keywords[i]+"]를 사용할 수 없습니다.");
			}
		
		return param;
	}
    
	/**
	 * @Method		: response
	 * @작성일 		: 2021. 1. 28.
	 * @작성자 		: 
	 * @Method 설명	: json reponse를 처리를 위한 함수
	 * @변경이력		: 
	 * @param response
	 * @param ajax
	 * @throws Exception
	 */
    public void response(HttpServletResponse response, Map<String,Object> ajax) throws Exception {
    	response(response, ajax, "UTF-8");
 	}
 	
    /**
     * @Method		: response
     * @작성일 		: 2021. 1. 28.
     * @작성자 		: 
     * @Method 설명	: json reponse를 처리를 위한 함수
     * @변경이력		: 
     * @param response
     * @param ajax
     * @param encoding
     * @throws Exception
     */
 	public void response(HttpServletResponse response, Map<String,Object> ajax, String encoding) throws Exception {
     	String jsonString = new ObjectMapper().writeValueAsString(ajax);
     	
     	response.setStatus(HttpServletResponse.SC_OK);
     	response.setHeader("Content-Type", "application/json; charset="+encoding);
     	
 		response.getWriter().append(jsonString);
 		response.getWriter().close();
 	}
}
