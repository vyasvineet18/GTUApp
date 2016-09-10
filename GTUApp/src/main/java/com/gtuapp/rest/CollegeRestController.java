package com.gtuapp.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.gtuapp.dto.customized.ResponseDTO;
import com.gtuapp.dto.entity.CollegeDTO;
import com.gtuapp.entity.College;
import com.gtuapp.service.ibase.CollegeService;
import com.gtuapp.utils.GTUAppConstants;

@Controller
@RequestMapping("/rest/college")
public class CollegeRestController {
	
	@Autowired
	CollegeService collegeService;
	
	@RequestMapping(value="/all" ,method = RequestMethod.GET)
	@ResponseBody
	public ResponseDTO getAllCollegeRest(HttpServletRequest request){
		ResponseDTO responseDTO = new ResponseDTO();
		List<CollegeDTO> collegeDTOLst = collegeService.getAllColleges();
		responseDTO.setSuccess(GTUAppConstants.RESP_SUCCESS);
		responseDTO.setMessage("");
		responseDTO.setData(collegeDTOLst);
		return responseDTO;
	}
	
}
