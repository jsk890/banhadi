package com.obama.coco.vo;

import java.sql.Timestamp;

public class HospitalMedical {
	
	private int no, medicalNo, speciesNo, hospitalNo, price;
	private float minWeight, maxWeight;
	private Timestamp regdate;
	
	public HospitalMedical() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMedicalNo() {
		return medicalNo;
	}

	public void setMedicalNo(int medicalNo) {
		this.medicalNo = medicalNo;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getMinWeight() {
		return minWeight;
	}

	public void setMinWeight(float minWeight) {
		this.minWeight = minWeight;
	}

	public float getMaxWeight() {
		return maxWeight;
	}

	public void setMaxWeight(float maxWeight) {
		this.maxWeight = maxWeight;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	

}
