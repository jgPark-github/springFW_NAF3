package kr.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.board.entity.Member;

@Mapper //- Mybatis API
public interface MemberMapper {	 
	public Member registerCheck(String memID);
	public int register(Member m);  //회원등록(0:ID중복, 1:ID 사용가능)
	public Member memLogin(Member mvo);
}
