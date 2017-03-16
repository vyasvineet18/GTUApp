package com.gtuapp.service.ibase;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dto.entity.CollegeDTO;
import com.gtuapp.entity.College;


/**
 * Business Service Interface for entity Role.
 */
@Transactional
public interface CollegeService {
	
	public List<CollegeDTO> getAllColleges();
	public List<CollegeDTO> fetchAllCollegeInPage(int startLimit,int endLimit);
	public Integer getAllCollegeCount();
}
