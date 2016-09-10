/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gtuapp.dao.impl;

import com.gtuapp.dao.ibase.GenericDAO;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author VinitShah
 */
public abstract class GenericDAOImpl<E extends Serializable, PK extends Serializable> implements Serializable, GenericDAO<E, PK> {

    @Autowired
    private SessionFactory sessionFactory;

    private Class<E> persistentClass;

    public GenericDAOImpl() {
        this.persistentClass = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    private Class<E> getPersistentClass() {
        return persistentClass;
    }
    
    public PK create(E obj) throws HibernateException {
        return (PK) sessionFactory.getCurrentSession().save(obj);
    }

    public void saveOrUpdate(E obj) throws HibernateException {
        sessionFactory.getCurrentSession().saveOrUpdate(obj);
    }

    public List<E> getfindAll() throws HibernateException {
        return sessionFactory.getCurrentSession().createQuery("FROM " + getPersistentClass().getName()).list();
    }

    public E getfindById(PK id) throws HibernateException {
        return (E) sessionFactory.getCurrentSession().get(getPersistentClass(), id);
    }

    public void update(E obj) throws HibernateException {
        sessionFactory.getCurrentSession().update(obj);
    }
    
    public void delete(E obj) throws HibernateException {
        sessionFactory.getCurrentSession().delete(obj);
    }

    public List<E> findByPage(int limit, int offset) throws HibernateException {
        return sessionFactory.getCurrentSession().createQuery("FROM " + getPersistentClass().getName())
                .setMaxResults(limit)
                .setFirstResult(offset)
                .list();
    }

    public List<E> findByNamedQuery(final String name, Object... params) throws HibernateException {
        Query query = sessionFactory.getCurrentSession().getNamedQuery(name);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        final List<E> result = (List<E>) query.list();
        return result;
    }
    
    public SessionFactory getSessionFactory(){
        return sessionFactory;
    }
}
