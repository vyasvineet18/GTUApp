package com.gtuapp.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dao.ibase.CollegeDAO;
import com.gtuapp.dto.entity.CollegeDTO;
import com.gtuapp.entity.College;
import com.gtuapp.service.ibase.CollegeService;


/**
 * Implementation of RoleService
 */
@Service("CollegeService")
@Transactional
public class CollegeServiceImpl implements CollegeService{
	
	@Autowired
	CollegeDAO collegeDAO;
	
	@Override
	public List<CollegeDTO> getAllColleges() {
		// TODO Auto-generated method stub
		List<CollegeDTO> collegeDTOLst = new ArrayList<CollegeDTO>();
		CollegeDTO collegeDTO = null;
		List<College> collegeLst = collegeDAO.getfindAll();
		for (College college : collegeLst) {
			collegeDTO = new CollegeDTO();
			BeanUtils.copyProperties(college, collegeDTO);
			collegeDTOLst.add(collegeDTO);
		}
		
		return collegeDTOLst;
	}

	@Override
	public List<CollegeDTO> fetchAllCollegeInPage(int startLimit, int endLimit) {
		// TODO Auto-generated method stub
		List<CollegeDTO> collegeDTOList = collegeDAO.fetchAllCollegeInPage(startLimit, endLimit);
		return collegeDTOList;
	}

	@Override
	public Integer getAllCollegeCount() {
		// TODO Auto-generated method stub
		return collegeDAO.getAllCollegeCount();
	}

}
