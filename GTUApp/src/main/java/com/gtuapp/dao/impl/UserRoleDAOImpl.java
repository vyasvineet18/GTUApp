/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gtuapp.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dao.ibase.UserRoleDAO;
import com.gtuapp.entity.UserRole;


/**
 *
 * @author VinitShah
 */
@Repository("UserRoleDAO")
@Transactional
public class UserRoleDAOImpl extends GenericDAOImpl<UserRole, Integer> implements UserRoleDAO {

}
