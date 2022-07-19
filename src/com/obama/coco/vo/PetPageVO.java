package com.obama.coco.vo;

public class PetPageVO {
	
	private int start, end, userNo, petNo;
	
	public PetPageVO() {
		// TODO Auto-generated constructor stub
	}
	public PetPageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end-numPage+1;
	}
	

	public PetPageVO(int pageNo, int numPage, int userNo, int petNo) {
	
		end = pageNo * numPage;
		start = end-numPage+1;
	}



	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	
	
	
}
