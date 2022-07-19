package com.obama.coco.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ExpertAnswer {
	private int no, expertNo, questionNo, likeCnt;
	private String userName, hospitalName, medicalName, contents;
	private char position, adoption;
	private Timestamp regdate;
	
	public ExpertAnswer() {
		// TODO Auto-generated constructor stub
	}
	
	public ExpertAnswer(int expertNo, int questionNo, String contents) {
		super();
		this.expertNo = expertNo;
		this.questionNo = questionNo;
		this.contents = contents;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getMedicalName() {
		return medicalName;
	}

	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
	}

	public char getPosition() {
		return position;
	}

	public void setPosition(char position) {
		this.position = position;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getExpertNo() {
		return expertNo;
	}
	public void setExpertNo(int expertNo) {
		this.expertNo = expertNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	char getAdoption() {
		return adoption;
	}
	public void setAdoption(char adoption) {
		this.adoption = adoption;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
