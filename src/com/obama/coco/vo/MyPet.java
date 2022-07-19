package com.obama.coco.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.sun.org.glassfish.external.statistics.TimeStatistic;

public class MyPet {
	int no, userNo, speciesNo, weight, age;
	String name, picture,specific,speciesName,gender;
	Date birthday;
	Timestamp regdate;
	
	
	public MyPet() {
		// TODO Auto-generated constructor stub
	}
	
	


	


	public MyPet(int no, int speciesNo, int weight, String name, String picture, String specific, String gender,
			Date birthday) {

		this.no = no;
		this.speciesNo = speciesNo;
		this.weight = weight;
		this.name = name;
		this.picture = picture;
		this.specific = specific;
		this.gender = gender;
		this.birthday = birthday;
	}







	public MyPet(int userNo, int speciesNo, int weight, String name, String picture, String specific, Date birthday,
			String gender) {

		this.userNo = userNo;
		this.speciesNo = speciesNo;
		this.weight = weight;
		this.name = name;
		this.picture = picture;
		this.specific = specific;
		this.birthday = birthday;
		this.gender = gender;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSpeciesNo() {
		return speciesNo;
	}

	public void setSpeciesNo(int speciesNo) {
		this.speciesNo = speciesNo;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getSpecific() {
		return specific;
	}

	public void setSpecific(String specific) {
		this.specific = specific;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSpeciesName() {
		return speciesName;
	}

	public void setSpeciesName(String speciesName) {
		this.speciesName = speciesName;
	}

	public int getAge() {
		
		java.util.Calendar cal = java.util.Calendar.getInstance();
		
		int year= cal.get(java.util.Calendar.YEAR);
		cal.setTime(birthday);
		int birthyear= cal.get(java.util.Calendar.YEAR);
		
		return year-birthyear+1;
	}

	
	
	
	
	
	
	
}
