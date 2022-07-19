package com.obama.coco.vo;

import java.sql.Timestamp;
import java.util.List;

public class Hospital {
	private int no,count;
	private String businessNo, name, mainImage, address, phoneNum;
	private Double latitude, longtitude;
	private int priceScore, accessibilityScore, kindnessScore, cleanlinessScore, specialtyScore;
	private char emergency;
	private Timestamp regdate;
	
	private int hmNo, medicalNo, speciesNo, hospitalNo,price, speciatyScore, treeScore, reviewCnt;
	private float minWeight, maxWeight;
	private char state;
	private String mName, speciesName;
	private List<Facility> facilities;
	private List<HospitalPhoto> hospitalPhotos;
	private List<AvailableTime> availableTime;
	
	
	
	
	public Hospital() {
		// TODO Auto-generated constructor stub
	}
	
	public int getHmNo() {
		return hmNo;
	}

	public void setHmNo(int hmNo) {
		this.hmNo = hmNo;
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

	public int getSpeciatyScore() {
		return speciatyScore;
	}

	public void setSpeciatyScore(int speciatyScore) {
		this.speciatyScore = speciatyScore;
	}

	public int getTreeScore() {
		return treeScore;
	}

	public void setTreeScore(int treeScore) {
		this.treeScore = treeScore;
	}

	public int getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
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

	public char getState() {
		return state;
	}

	public void setState(char state) {
		this.state = state;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getSpeciesName() {
		return speciesName;
	}

	public void setSpeciesName(String speciesName) {
		this.speciesName = speciesName;
	}

	public List<Facility> getFacilities() {
		return facilities;
	}

	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}

	public List<HospitalPhoto> getHospitalPhotos() {
		return hospitalPhotos;
	}

	public void setHospitalPhotos(List<HospitalPhoto> hospitalPhotos) {
		this.hospitalPhotos = hospitalPhotos;
	}

	public List<AvailableTime> getAvailableTime() {
		return availableTime;
	}

	public void setAvailableTime(List<AvailableTime> availableTime) {
		this.availableTime = availableTime;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(Double longtitude) {
		this.longtitude = longtitude;
	}
	public int getPriceScore() {
		return priceScore;
	}
	public void setPriceScore(int priceScore) {
		this.priceScore = priceScore;
	}
	public int getAccessibilityScore() {
		return accessibilityScore;
	}
	public void setAccessibilityScore(int accessibilityScore) {
		this.accessibilityScore = accessibilityScore;
	}
	public int getKindnessScore() {
		return kindnessScore;
	}
	public void setKindnessScore(int kindnessScore) {
		this.kindnessScore = kindnessScore;
	}
	public int getCleanlinessScore() {
		return cleanlinessScore;
	}
	public void setCleanlinessScore(int cleanlinessScore) {
		this.cleanlinessScore = cleanlinessScore;
	}
	public int getSpecialtyScore() {
		return specialtyScore;
	}
	public void setSpecialtyScore(int specialtyScore) {
		this.specialtyScore = specialtyScore;
	}
	public char getEmergency() {
		return emergency;
	}
	public void setEmergency(char emergency) {
		this.emergency = emergency;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
