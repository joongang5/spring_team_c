package com.team_c.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UrlPathHelper;

import com.team_c.common.CommandMap;
import com.team_c.service.JoinServiceImpl;

@Controller
public class JoinController {
	@Resource(name = "joinService")
	private JoinServiceImpl joinService;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/join.do")
	public String join(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if (session.getAttribute("joinChannel") != null) {
			return "redirect:/oAuthJoin.do";
		}

		return "join";
	}

	@PostMapping("/join.do")
	public String join(CommandMap commandMap, HttpServletRequest request) {

		System.out.println(commandMap.getMap());
		HttpSession session = request.getSession();
		
		Map<String, Object> join = joinService.join(commandMap.getMap());
		System.out.println(join);

		session.invalidate();
		return "redirect:/index.do?login=join";
	}

	
	@GetMapping("/emailCount.do")
	@ResponseBody
	public int emailCount(String email) {
		int emailCount = joinService.emailCheck(email);
		return emailCount;
	}
	
	@GetMapping("/nameCount.do")
	@ResponseBody
	public int nameCount(String name) {
		int nameCount = joinService.nameCheck(name);
		return nameCount;
	}

	@GetMapping("/emailCheck.do")
	public String mailCheck() {
		return "emailtest";
	}

	@GetMapping("/mailCheck.do")
	@ResponseBody
	public int mailCheckGET(String email) throws Exception {
		System.out.println("????????? ????????? ?????? ??????");
		System.out.println("???????????? ????????? : " + email);

		/* ????????????(??????) ?????? */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("???????????? : " + checkNum);

		/* ????????? ????????? */
		String setFrom = "teamcgsupp0rt@gmail.com";
		String toMail = email;
		String title = "G????????? ?????? ????????? ?????????.";
		String content = "??????????????? ?????????????????? ???????????????." + "<br><br>" + "?????? ????????? " + checkNum + "?????????." + "<br>"
				+ "?????? ??????????????? ???????????? ???????????? ???????????? ?????????.";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

			return checkNum;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}