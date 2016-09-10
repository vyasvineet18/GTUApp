/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hyginex.dao.ibase;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author VinitShah
 * @param <E>
 * @param <PK>
 */
public interface GenericDAO<E extends Serializable, PK extends Serializable> extends Serializable{
    
    public PK create(E obj);
    public void saveOrUpdate(E obj);
    public List<E> getfindAll();
    public E getfindById(PK id);
    public void delete(E obj);
    public void update(E obj);
    public List<E> findByPage(int limit,int offset);
    public List<E> findByNamedQuery(final String name, Object... params);
}
