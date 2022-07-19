package com.obama.coco.vo;

import java.sql.Timestamp;

public class Facilities {
	private int no, hospitalsNo, facilitiesNo;
	private String name;
	private Timestamp regdate;
	
	public Facilities() {
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHospitalsNo() {
		return hospitalsNo;
	}
	public void setHospitalsNo(int hospitalsNo) {
		this.hospitalsNo = hospitalsNo;
	}
	public int getFacilitiesNo() {
		return facilitiesNo;
	}
	public void setFacilitiesNo(int facilitiesNo) {
		this.facilitiesNo = facilitiesNo;
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
