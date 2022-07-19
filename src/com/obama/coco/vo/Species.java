package com.obama.coco.vo;

import java.sql.Timestamp;

public class Species {
	
	//은닉화 멤퍼필드를 프라이빗으로 선언	
	private int no;
	private String name, picture;
	private Timestamp regdate;

	public Species() {
		// TODO Auto-generated constructor stub
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
