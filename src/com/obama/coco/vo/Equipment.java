package com.obama.coco.vo;

import java.sql.Timestamp;

public class Equipment {

	private int no, equipmentNo, hospitalNo;
	private String name, contents, englishName;
	private Timestamp regdate;
	private char department;
	public Equipment() {
		// TODO Auto-generated constructor stub
	}
	
	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public char getDepartment() {
		return department;
	}

	public void setDepartment(char department) {
		this.department = department;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getEquipmentNo() {
		return equipmentNo;
	}
	public void setEquipmentNo(int equipmentNo) {
		this.equipmentNo = equipmentNo;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
