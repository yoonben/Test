package com.peco.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.service.MailSendService;
import com.peco.service.MemberService;
import com.peco.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class LoginController {

	@Autowired
	MemberService memberService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/main")
	public String main() {
		return "main";
	}

	@PostMapping("/loginAction")
	public @ResponseBody Map<String, Object> loginAction(@RequestBody MemberVO member, Model model,
			HttpSession session) {

		member = memberService.login(member);
		if (member != null) {
			session.setAttribute("member", member);
			session.setAttribute("userId", member.getId());
			session.setAttribute("nickName", member.getNickname());
			Map<String, Object> map = responseMap("success", "로그인 되엇습니다.");
			map.put("url", "/peco/main");

			return map;
		} else {

			return responseMap("fail", "아이디와 비밀번호를 확인해주세요");
		}

	}

	@PostMapping("/register")
	public @ResponseBody Map<String, Object> register(@RequestBody MemberVO member) {

		try {

			int res = memberService.insert(member);
			return responseWriteMap(res);

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap("fail", "등록중 예외사항이 발생 하였습니다.");
		}
	}

	@PostMapping("/idCheck")
	public @ResponseBody Map<String, Object> idCheck(@RequestBody MemberVO member) {
		int res = memberService.idCheck(member);

		if (res == 0) {
			return responseMap("success", "사용가능한 아이디 입니다.");
		} else {
			return responseMap("fail", "이미 사용중인 아이디 입니다.");
		}

	}

	@PostMapping("/nicknameCheck")
	public @ResponseBody Map<String, Object> nicknameCheck(@RequestBody MemberVO member) {
		int res = memberService.nicknameCheck(member);

		if (res == 0) {
			return responseMap("success", "사용가능한 닉네임 입니다.");
		} else {
			return responseMap("fail", "이미 사용중인 닉네임 입니다.");
		}

	}

	public Map<String, Object> responseMap(int res, String msg) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (res > 0) {
			map.put("result", "success");
			map.put("msg", msg + " 되었습니다.");
		} else {
			map.put("result", "fail");
			map.put("msg", msg + "중 예외가 발생하였습니다");

		}

		return map;
	}

	public Map<String, Object> responseWriteMap(int res) {
		return responseMap(res, "등록");
	}

	public Map<String, Object> responseMap(String result, String msg) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("result", result);
		map.put("msg", msg);

		return map;
	}
	
	@Autowired
	private MailSendService mailService;
	
	//이메일 인증
		@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
			
				
		}
}
