package com.gtuapp.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping(value="/all/page/{startlimit}/{endlimit}", method=RequestMethod.GET,produces="application/json")
    @ResponseBody
    public ResponseDTO getAllCollegeInPageRest(@PathVariable(value="startlimit") Integer startLimit,
			@PathVariable(value="endlimit") Integer endLimit) {
		
		ResponseDTO responseDTO = new ResponseDTO();
		List<CollegeDTO> collegeDTOLst = collegeService.fetchAllCollegeInPage(startLimit, endLimit);
		responseDTO.setSuccess(GTUAppConstants.RESP_SUCCESS);
		responseDTO.setMessage("");
		responseDTO.setData(collegeDTOLst);
		return responseDTO;
    }
	@RequestMapping(value="/all/count", method=RequestMethod.GET,produces="application/json")
    @ResponseBody
    public ResponseDTO getAllCollegeCountRest() {
		
		ResponseDTO responseDTO = new ResponseDTO();
		responseDTO.setSuccess(GTUAppConstants.RESP_SUCCESS);
		responseDTO.setMessage("");
		responseDTO.setData(collegeService.getAllCollegeCount());
		return responseDTO;
    }
	@RequestMapping(value="individual", method=RequestMethod.POST,consumes="application/json",produces="application/json")
    @ResponseBody
    public ResponseDTO updateOrCreateCollege(@RequestBody CollegeDTO collegeDTO) {
		ResponseDTO responseDTO = new ResponseDTO();
		return responseDTO;
    }
        

	
}
