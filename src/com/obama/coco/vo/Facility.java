package com.obama.coco.vo;

import java.sql.Timestamp;

public class Facility {
	private int no, hospitalsNo;
	private String name, facility,facility0,facility1,facility2;
	//private String[] facilities;
	private Timestamp regdate;

	public Facility() {
		// TODO Auto-generated constructor stub
	}
	

	public String getFacility() {
		return facility;
	}


	public void setFacility(String facility) {
		this.facility = facility;
	}


	public Facility(int hospitalsNo, String[] facilities) {
		// TODO Auto-generated constructor stub
		
		if(facilities.length==2) {
			this.facility0 = facilities[0];
			this.facility1 = facilities[1];
			this.facility2="0";
		}else if(facilities.length==1) {
			this.facility0 = facilities[0];
			this.facility1="0";
			this.facility2="0";
		}else {
			this.facility0="0";
			this.facility1="0";
			this.facility2="0";
		}
		this.hospitalsNo = hospitalsNo;

	}

	public String getFacility0() {
		return facility0;
	}


	public void setFacility0(String facility0) {
		this.facility0 = facility0;
	}


	public String getFacility1() {
		return facility1;
	}


	public void setFacility1(String facility1) {
		this.facility1 = facility1;
	}


	public String getFacility2() {
		return facility2;
	}


	public void setFacility2(String facility2) {
		this.facility2 = facility2;
	}


	public int getHospitalNo() {
		return hospitalsNo;
	}

	public void setHospitalNo(int hospitalsNo) {
		this.hospitalsNo = hospitalsNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
