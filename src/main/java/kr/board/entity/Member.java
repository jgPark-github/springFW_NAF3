package kr.board.entity;

import lombok.Data;

@Data //lombok(getter/setter)
public class Member {
	private int memIdx ;
	private String memId ;
	private String memPassWord;
	private String memName;
	private int memAge;
	private String memGender;
	private String memEmail;
	private String memProfile;
}
