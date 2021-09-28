package com.team_c.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {

	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("authUser") != "web") {

			session.invalidate();

			// 카카오 로그아웃
			String clientId = "188766d70b45863a165fa74d7d8a455b";
			String logout_redirectUri = "http://localhost:8080/GSupport/index.do?logout=kakao";
			String logoutUrl = "https://kauth.kakao.com/oauth/logout?client_id=" + clientId + "&logout_redirect_uri="
					+ logout_redirectUri;
			response.sendRedirect(logoutUrl);

		} else {

			session.invalidate();
			return "redirect:/index.do";

		}

		return null;

	}

}