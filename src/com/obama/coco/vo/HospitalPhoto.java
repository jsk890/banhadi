package com.obama.coco.vo;

import java.sql.Timestamp;

public class HospitalPhoto {

	private int no, hospitalNo;
	private String name,fileName;
	private Timestamp regdate;
	public HospitalPhoto() {
		// TODO Auto-generated constructor stub
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
