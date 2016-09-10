package com.gtuapp.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/welcome")
public class UserRestController {
	
	@RequestMapping(value="/" ,method = RequestMethod.GET)
	public View helloWorld(HttpServletRequest request){
 
		ModelAndView model = new ModelAndView("HelloWorldPage");
		model.addObject("msg", "hello world");
 
		return new RedirectView(request.getContextPath()+"/jsp/webportal/index.jsp#/home");
	}
	
}
