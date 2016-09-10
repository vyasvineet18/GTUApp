/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gtuapp.dao.impl;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dao.ibase.RoleDAO;
import com.gtuapp.entity.Role;



/**
 *
 * @author VinitShah
 */
@Repository("RoleDAO")
@Transactional
public class RoleDAOImpl extends GenericDAOImpl<Role, Integer> implements RoleDAO {

	
}
