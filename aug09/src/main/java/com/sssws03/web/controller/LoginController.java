package com.sssws03.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	//2023-08-11 프레임워크 프로그래밍
	@GetMapping("/login.sik")
	public String index() {
		return "login";
	}

}
