package com.obama.coco.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Calendar {
	String title;
	Timestamp start;
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Calendar(String title, Timestamp start) {
	
		this.title = title;
		this.start = start;
	}



	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getStart() {
		return start;
	}

	public void setStart(Timestamp start) {
		this.start = start;
	}
	
	
	
	
}
