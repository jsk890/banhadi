package com.obama.coco.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class Reservation {
	private int no, price, hospitalNo, speciesNo;
	private String specific,userName,userPhone,hospitalName,
	picture,petName,speciesName, reservationsDateStr;
	private List<String> symptomList;
	private List<Medical> medicalList; 
	private char state;
	private Timestamp reservationsDate;
	
	
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	
	//public void setReservationsDateStr(Date reservationsDate) {
	//	SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월dd일 HH:mm:ss");
	//	this.reservationsDateStr = format.format(reservationsDate);
	//}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getHospitalNo() {
		return hospitalNo;
	}

	public void setHospitalNo(int hospitalNo) {
		this.hospitalNo = hospitalNo;
	}

	public int getSpeciesNo() {
		return speciesNo;
	}

	public void setSpeciesNo(int speciesNo) {
		this.speciesNo = speciesNo;
	}


	public String getSpecific() {
		return specific;
	}

	public void setSpecific(String specific) {
		this.specific = specific;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getSpeciesName() {
		return speciesName;
	}

	public void setSpeciesName(String speciesName) {
		this.speciesName = speciesName;
	}

	public char getState() {
		return state;
	}

	public void setState(char state) {
		this.state = state;
	}


	public Timestamp getReservationsDate() {
		return reservationsDate;
	}


	public void setReservationsDate(Timestamp reservationsDate) {
		this.reservationsDate = reservationsDate;
	}


	public String getReservationsDateStr() {
		return reservationsDateStr;
	}


	public void setReservationsDateStr(String reservationsDateStr) {
		this.reservationsDateStr = reservationsDateStr;
	}


	public List<String> getSymptomList() {
		return symptomList;
	}


	public void setSymptomList(List<String> symptomList) {
		this.symptomList = symptomList;
	}


	public List<Medical> getMedicalList() {
		return medicalList;
	}


	public void setMedicalList(List<Medical> medicalList) {
		this.medicalList = medicalList;
	}


	public int getTotalPrice() {
		
		int total = 0;
		if(medicalList!=null) {
			
			for (Medical medical : medicalList) {
				total += medical.getPrice();
			}
		}
		
		return total;
	}
	//jacksonjson 라이브러리에서 자바의 객체를 json으로 바꿀때 객체내의 멤버필드 값을 getter로 받아옴
	// totalPrice라는 멤버필드가 없어도 getTotalPrice라는 getter만 있으면 json으로 바꿀 때
	//속성명에 totalPirce , 그 값에 getter를 호출하여 return 된 값이 담겨진다!!

	
	
	//오라클에서 Date  여도 시간까지 받아오려면 Timestamp 사용해야함!!

	//public String getReservationsDateStr() {
	//	return reservationsDateStr;
	//}


	
	
	
}
