package com.gtuapp.dao.ibase;

import java.util.List;

import com.gtuapp.dto.entity.CollegeDTO;
import com.gtuapp.entity.College;
import com.gtuapp.entity.User;

/**
*
* @author Vinit Vyas
*/
public interface CollegeDAO extends GenericDAO<College, Integer> {

	public List<CollegeDTO> fetchAllCollegeInPage(int startLimit,int endLimit);
	public Integer getAllCollegeCount();
}
