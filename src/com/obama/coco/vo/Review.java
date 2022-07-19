package com.obama.coco.vo;

import java.sql.Timestamp;

import com.obama.coco.dao.UsersDAO;

public class Review {
	private int no, userNo, reservationNo, reviewScore;
	private String content, userName;
	private char priceScore, accessibilityScore, kindnessScore, cleanlinessScore, specialtyScore;
	private int priceScoreInt, accessibilityScoreInt, kindnessScoreInt, cleanlinessScoreInt, specialtyScoreInt;
	private Timestamp regdate;
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	public String getUserName() {
		return userName;
	}



	public int reviewScore() {
		
		
		return (priceScoreInt+ accessibilityScoreInt+ kindnessScoreInt+ cleanlinessScoreInt+specialtyScoreInt)/5;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		userName = UsersDAO.getName(no);
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public char getPriceScore() {
		return priceScore;
	}
	public void setPriceScore(char priceScore) {
		if(priceScore =='t') {
			priceScoreInt=100;
		}
		this.priceScore = priceScore;
	}
	public char getAccessibilityScore() {
		return accessibilityScore;
	}
	public void setAccessibilityScore(char accessibilityScore) {
		if(accessibilityScore =='t') {
			accessibilityScoreInt=100;
		}
		this.accessibilityScore = accessibilityScore;
	}
	public char getKindnessScore() {
		return kindnessScore;
	}
	public void setKindnessScore(char kindnessScore) {
		if(kindnessScore =='t') {
			kindnessScoreInt=100;
		}
		this.kindnessScore = kindnessScore;
	}
	public char getCleanlinessScore() {
		return cleanlinessScore;
	}
	public void setCleanlinessScore(char cleanlinessScore) {
		if(cleanlinessScore =='t') {
			cleanlinessScoreInt=100;
		}
		this.cleanlinessScore = cleanlinessScore;
	}
	public char getSpecialtyScore() {
		return specialtyScore;
	}
	public void setSpecialtyScore(char specialtyScore) {
		if(specialtyScore =='t') {
			specialtyScoreInt=100;
		}
		this.specialtyScore = specialtyScore;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
