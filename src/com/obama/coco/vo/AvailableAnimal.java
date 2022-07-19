package com.obama.coco.vo;

import java.sql.Timestamp;

public class AvailableAnimal {
	private int no, speciesNo, hospitalNo;
	private String name;
	private Timestamp regDate;
	public AvailableAnimal() {
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSpeciesNo() {
		return speciesNo;
	}
	public void setSpeciesNo(int speciesNo) {
		this.speciesNo = speciesNo;
	}
	public int getHospitalNo() {
		return hospitalNo;
	}
	public void setHospitalNo(int hospitalNo) {
		this.hospitalNo = hospitalNo;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	

}
