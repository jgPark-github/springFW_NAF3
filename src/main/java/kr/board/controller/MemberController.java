package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		public @ResponseBody int memRegisterCheck(@RequestParam("memId") String memId) {
			Member member = memberMapper.registerCheck(memId);
			
			if (member != null) {  //DB에 데이터가 있거나, textBox에 어떤 데이터도 입력되지 않았다면
				return 0;  //ID사용 불가
			}
			
			return 1;  // 기존에 존재하지 않은 ID = 사용가능한 ID
		}
		
		//회원가입처리, 성공시 세션(HttpSession)생성
		@RequestMapping("/memRegister.do")
		public String memRegister(Member m ,String memPassWord1 ,String memPassWord2 
				,RedirectAttributes rttr, HttpSession session) {
			if (m.getMemId()==null || "".equals(m.getMemId())
		        ||memPassWord1 ==null || "".equals(memPassWord1)
		        ||memPassWord2 ==null || "".equals(memPassWord2)
				||m.getMemName()== null     || "".equals(m.getMemName())
				||m.getMemAge() <= 0 				
				||m.getMemGender()== null   || "".equals(m.getMemGender())
				||m.getMemEmail()== null    || "".equals(m.getMemEmail())){
				//누락메시지를 가지고 가기 ==> 객체바인딩(Model, HttpServletRequest,httpSession)
				rttr.addFlashAttribute("msgType", "실패 메시지.");
				rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
				
				return "redirect:/memJoin.do";  //member/join.jsp 페이지로 이동! ${msgType}로 , ${msg}로 꺼낸다.
			}
			
			//memPassWord1과 memPassWord2가 같은지 체크
			if (!memPassWord1.equals(memPassWord2)) {
				rttr.addFlashAttribute("msgType", "실패 메시지.");
				rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다.");
				
				return "redirect:/memJoin.do";  //member/join.jsp 페이지로 이동! ${msgType}로 , ${msg}로 꺼낸다.
			}
			m.setMemProfile(""); //사진이 없다는 의미
			
			int result = memberMapper.register(m);  
			
			if (result ==1) { //회원등록(0:ID중복, 1:ID 사용가능)
				rttr.addFlashAttribute("msgType", "성공 메시지.");
				rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
				//성공하면 세션생성및 로그인처리, 첫페이지인 index.jsp로 리다이렉트한다.
				session.setAttribute("mvo", m); //Member 객체를 세션에 저장. ${!empty m}
				return "redirect:/";  /* '/'는 클라이언트(브라우저)에게 최상위 경로(/)로 다시 요청을 보내라고 지시하는 처리(Redirect) */
			} else {
				rttr.addFlashAttribute("msgType", "실패 메시지.");
				rttr.addFlashAttribute("msg", "이미 존재하는 회원입니다.");
				//회원가입에 실패했다면 다시 회원가입 페이지로 이동
				return "redirect:/memJoin.do";
			}
			
		}
}
