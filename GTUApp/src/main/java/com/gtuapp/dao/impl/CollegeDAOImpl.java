package com.gtuapp.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dao.ibase.CollegeDAO;
import com.gtuapp.dao.ibase.UserDAO;
import com.gtuapp.entity.College;
import com.gtuapp.entity.User;

/**
*
* @author Vinit Vyas
*/
@Repository("CollegeDAO")
@Transactional
public class CollegeDAOImpl extends GenericDAOImpl<College, Integer> implements CollegeDAO  {
	
}
