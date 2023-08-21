package com.sssws03.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sssws03.web.service.MultiBoardService;

@Controller
public class MultiBoardController {
	@Autowired
	private MultiBoardService mbService;

	@GetMapping("/multiboard")
	public String multiboard(@RequestParam(value = "board", required = false, defaultValue = "1") int board,
			Model model) {

		List<Map<String, Object>> list = mbService.list(board);
		model.addAttribute("list", list);
		// System.out.println(list);
		return "multiboard";
	}

	@GetMapping("/mbwrite")
	public String mbwrite(@RequestParam(value = "board", required = false, defaultValue = "1") int board, Model model,
			HttpSession session) {
		if (session.getAttribute("mid") != null) {
			model.addAttribute("board", board);
			return "mbwrite";
		} else {
			return "redirect:/login.sik?error=login";
		}
	}
	@PostMapping("/mbwrite")
	public String mbWrite(@RequestParam Map<String, Object> map, HttpSession session) {
		//{title=타이틀입니다, content=<p>본문입니다</p>, files=, board=1}
		//로그인 했는지 검사
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
		mbService.mbWrite(map); //이번에는 selcetKey라는 기법입니다.
		return "redirect:/mbdetail?mbno="+map.get("mb_no");
	}else {
		return "redirect:/login.sik?error=login";
		
	}
}
	///mbdetail?mbno="+map.get("mb_no");
	@GetMapping("/mbdetail")
	public String mbDetail(@RequestParam(value="mbno", required= true) int mbno, Model model) {
		System.out.println(mbno);
		Map<String, Object> detail = mbService.mbdetail(mbno);
		model.addAttribute("detail", detail);
		return "mbdetail";
	}
}