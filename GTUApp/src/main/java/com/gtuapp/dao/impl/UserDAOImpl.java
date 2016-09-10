/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gtuapp.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dao.ibase.UserDAO;
import com.gtuapp.entity.User;


/**
 *
 * @author Vinit Vyas
 */
@Repository("UserDAO")
@Transactional
public class UserDAOImpl extends GenericDAOImpl<User, Integer> implements UserDAO {

    

}
