package kr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;

@Controller
public class MemberController {
		@Autowired
		MemberMapper memberMapper;
	    
	   //view
		@RequestMapping("/memJoin.do")
		public String memJoin() {
			return "member/join";
		}
		
		//사용자ID 체크
		@RequestMapping("/memRegisterCheck.do")
		public @ResponseBody int memRegisterCheck(@RequestParam("memID") String memID) {
			Member member = memberMapper.registerCheck(memID);
			
			if (member != null) {  //DB에 데이터가 있거나, textBox에 어떤 데이터도 입력되지 않았다면
				return 0;  //ID사용 불가
			}
			
			return 1;  // 기존에 존재하지 않은 ID = 사용가능한 ID
		}
}
