package com.obama.coco.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class AvailableTime {
	private int no, hospitalNo;
	private String availableTime;
	private Timestamp regdate;
	
	
	public AvailableTime(int no, String dateTimeObj) {
		// TODO Auto-generated constructor stub
		if(dateTimeObj==""||dateTimeObj==null) {
			this.hospitalNo = no;
		}else {
			long dateTime = Long.parseLong(dateTimeObj);
			Date date = new Date(dateTime);
			SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9")); 
		    String formattedDate = sdf.format(date);
		    System.out.println(formattedDate);
		    this.hospitalNo = no;
			this.availableTime = formattedDate;
		}
	}


	


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHospitalNo() {
		return hospitalNo;
	}

	public void setHospitalNo(int hospitalNo) {
		this.hospitalNo = hospitalNo;
	}

	public String getAvailableTime() {
		return availableTime;
	}

	public void setAvailableTime(String availableTime) {
		this.availableTime = availableTime;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
