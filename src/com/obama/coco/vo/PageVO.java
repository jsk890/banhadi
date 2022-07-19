package com.obama.coco.vo;

public class PageVO {
	private int no,start, end;
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	public PageVO(int pageNo, int numPage) {

		
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
	}

	public PageVO(int no, int pageNo, int numPage) {

		this.no = no;
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	
	
}
