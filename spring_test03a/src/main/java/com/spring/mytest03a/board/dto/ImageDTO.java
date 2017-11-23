package com.spring.mytest03a.board.dto;

public class ImageDTO {
	
	private int imageNum;
	private String imageFileName;
	private String regDate;
	private int num;
	
	public ImageDTO() {
		super();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

}
