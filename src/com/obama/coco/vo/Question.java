package com.obama.coco.vo;

import java.sql.Date;

import java.sql.Timestamp;
import java.util.List;

public class Question {

	private int no, userNo, petNo, speciesNo, questionLike;
	private String title, content;
	private Timestamp regdate;
	//김정석 22:56 int, String, List추가
	private int views, answerCnt, usefulCnt, questionNo;
	private String search, period, filter, periodNo, filterNo, type;
	private List<Species> species;
	
	private String userName, petPicture, speciesName, speciesEngName;
	private char membership;
	
	/*기본생성자*/
	public Question() {
		
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPetPicture() {
		return petPicture;
	}

	public void setPetPicture(String petPicture) {
		this.petPicture = petPicture;
	}

	public String getSpeciesName() {
		return speciesName;
	}

	public void setSpeciesName(String speciesName) {
		this.speciesName = speciesName;
	}

	public String getSpeciesEngName() {
		return speciesEngName;
	}

	public void setSpeciesEngName(String speciesEngName) {
		this.speciesEngName = speciesEngName;
	}

	public char getMembership() {
		return membership;
	}

	public void setMembership(char membership) {
		this.membership = membership;
	}

	//김정석 22:56 질문리트스 필터링 추가
	public Question(String search, int speciesNo, String periodNo, String type) {
		// TODO Auto-generated constructor stub
		this.search = search;
		this.speciesNo = speciesNo;
		this.period = periodNo;
		this.type = type;
		//System.out.println(search+speciesNo+periodNo+type);
	}

	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
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



	public int getSpeciesNo() {
		return speciesNo;
	}



	public void setSpeciesNo(int speciesNo) {
		this.speciesNo = speciesNo;
	}



	public int getQuestionLike() {
		return questionLike;
	}



	public void setQuestionLike(int questionLike) {
		this.questionLike = questionLike;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	/*김정석 22:04 setter, getter 추가
	views, answerCnt, usefulCnt, questionNo,
	search, period, filter, periodNo, filterNo,
	type, List<Species> species
	*/
	
	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getAnswerCnt() {
		return answerCnt;
	}

	public void setAnswerCnt(int answerCnt) {
		this.answerCnt = answerCnt;
	}

	public int getUsefulCnt() {
		return usefulCnt;
	}

	public void setUsefulCnt(int usefulCnt) {
		this.usefulCnt = usefulCnt;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getPeriodNo() {
		return periodNo;
	}

	public void setPeriodNo(String periodNo) {
		this.periodNo = periodNo;
	}

	public String getFilterNo() {
		return filterNo;
	}

	public void setFilterNo(String filterNo) {
		this.filterNo = filterNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Species> getSpecies() {
		return species;
	}

	public void setSpecies(List<Species> species) {
		this.species = species;
	}	
	
	
		
	
}
