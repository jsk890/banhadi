package com.obama.coco.vo;

import java.sql.Timestamp;

public class MedicalAnswer {

	private int no, medicalsNo, expertAnswersNo;
	private Timestamp regdate;
	public MedicalAnswer() {
		// TODO Auto-generated constructor stub
	}
	
	public MedicalAnswer(int medicalsNo, int expertAnswersNo) {
		super();
		this.medicalsNo = medicalsNo;
		this.expertAnswersNo = expertAnswersNo;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMedicalsNo() {
		return medicalsNo;
	}
	public void setMedicalsNo(int medicalsNo) {
		this.medicalsNo = medicalsNo;
	}
	public int getExpertAnswersNo() {
		return expertAnswersNo;
	}
	public void setExpertAnswersNo(int expertAnswersNo) {
		this.expertAnswersNo = expertAnswersNo;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
