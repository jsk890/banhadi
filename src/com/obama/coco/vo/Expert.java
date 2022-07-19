package com.obama.coco.vo;

import java.sql.Timestamp;
import java.util.List;
public class Expert {
	private int no, hospitalNo, gradeNo;
	private String picture, preface, lincenseNum, answerCnt, selectiomCnt, lileCnt, name;
	private char position, certification;
	private Timestamp startDate, regdate;

	
	public Expert() {
		// TODO Auto-generated constructor stub
	}
	public Expert(int no, int hospitalNo, int gradeNo, String picture, String preface, String lincenseNum,
			String answerCnt, String selectiomCnt, String lileCnt, char position, char certification,
			Timestamp startDate, Timestamp regdate) {
		super();
		this.no = no;
		this.hospitalNo = hospitalNo;
		this.gradeNo = gradeNo;
		this.picture = picture;
		this.preface = preface;
		this.lincenseNum = lincenseNum;
		this.answerCnt = answerCnt;
		this.selectiomCnt = selectiomCnt;
		this.lileCnt = lileCnt;
		this.position = position;
		this.certification = certification;
		this.startDate = startDate;
		this.regdate = regdate;
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
	public int getHospitalNo() {
		return hospitalNo;
	}
	public void setHospitalNo(int hospitalNo) {
		this.hospitalNo = hospitalNo;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getPreface() {
		return preface;
	}
	public void setPreface(String preface) {
		this.preface = preface;
	}
	public String getLincenseNum() {
		return lincenseNum;
	}
	public void setLincenseNum(String lincenseNum) {
		this.lincenseNum = lincenseNum;
	}
	public String getAnswerCnt() {
		return answerCnt;
	}
	public void setAnswerCnt(String answerCnt) {
		this.answerCnt = answerCnt;
	}
	public String getSelectiomCnt() {
		return selectiomCnt;
	}
	public void setSelectiomCnt(String selectiomCnt) {
		this.selectiomCnt = selectiomCnt;
	}
	public String getLileCnt() {
		return lileCnt;
	}
	public void setLileCnt(String lileCnt) {
		this.lileCnt = lileCnt;
	}
	public char getPosition() {
		return position;
	}
	public void setPosition(char position) {
		this.position = position;
	}
	public char getCertification() {
		return certification;
	}
	public void setCertification(char certification) {
		this.certification = certification;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
