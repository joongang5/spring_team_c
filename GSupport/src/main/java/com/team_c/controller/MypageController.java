package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.logging.log4j.core.tools.picocli.CommandLine.Command;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.MypageServiceImpl;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MypageServiceImpl mypageService;

	@GetMapping("/myPage.do")
	public ModelAndView myPage(CommandMap map) {
		ModelAndView mv = new ModelAndView("myPage");

		// *****페이징*****
		// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 4;// 리스트 크기
		int pageScale = 10;

		// 토탈 카운트
		int totalCount = mypageService.totalCount(map.getMap());

		// 전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);

		// 계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();

		// DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		// 예약기능 출력하기
		List<Map<String, Object>> reservation = mypageService.reservation(map.getMap());

		// 담기
		mv.addObject("reservation_list", reservation);
		if (reservation.size() > 0) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		mv.addObject("reserve", reservation);

		return mv;

	}

	@GetMapping("/myPage_update.do")
	public String myPage_update() {
		return "myPage_update";
	}

	@PostMapping("/myPage_update.do")
	public String myPage_update(CommandMap commandMap, HttpServletRequest request) {				
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {
			commandMap.put("member_id", session.getAttribute("member_id"));
			mypageService.myPageUpdate(commandMap.getMap());
			return "redirect:/myPage_update";
		} else {
			return "redirect:/login.do";
		}


	}

	@GetMapping("/myPage_updatePW.do")
	public String myPage_updatePW() {
		return "myPage_updatePW";
	}

	@PostMapping("/myPage_updatePW.do")
	public String myPage_updatePW(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("member_id") != null) {
			commandMap.put("member_id", session.getAttribute("member_id"));
			mypageService.myPageUpdatePW(commandMap.getMap());
			return "redirect:/myPage_updatePW";
		} else {
			return "redirect:/login.do";
		}

	}

	@GetMapping("/myPage_delete.do")
	public String myPage_delete() {
		return "myPage_delete";
	}
	
	@GetMapping("/myPage_reserv.do")
	public ModelAndView myPage_reserv(CommandMap map) {
		ModelAndView mv = new ModelAndView("myPage_reserv");
		
		// *****페이징*****
		// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 3;// 리스트 크기
		int pageScale = 10;

		// 토탈 카운트
		int totalCount = mypageService.totalCount(map.getMap());

		// 전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);

		// 계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();

		// DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		// 예약기능 출력하기
		List<Map<String, Object>> reservation = mypageService.reservation(map.getMap());

		// 담기
		mv.addObject("reservation_list", reservation);
		if (reservation.size() > 0) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		mv.addObject("reserve", reservation);
		
		return mv;
	}

}
