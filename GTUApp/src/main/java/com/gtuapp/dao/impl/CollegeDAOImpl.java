package com.gtuapp.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gtuapp.dao.ibase.CollegeDAO;
import com.gtuapp.dao.ibase.UserDAO;
import com.gtuapp.dto.entity.CollegeDTO;
import com.gtuapp.entity.College;
import com.gtuapp.entity.User;

/**
*
* @author Vinit Vyas
*/
@Repository("CollegeDAO")
@Transactional
public class CollegeDAOImpl extends GenericDAOImpl<College, Integer> implements CollegeDAO  {

	@Override
	public List<CollegeDTO> fetchAllCollegeInPage(int startLimit, int endLimit) {
		// TODO Auto-generated method stub
		
	        StringBuilder strBuilder = new StringBuilder("SELECT "
	        		+ "clg.collegeId as collegeId,"
	        		+ "clg.name as name,"
	        		+ "clg.address as address,"
	        		+ "clg.city as city,"
	        		+ "clg.pincode as pincode,"
	        		+ "clg.contact1 as contact1,"
	        		+ "clg.contact2 as contact2,"
	        		+ "clg.fax as fax,"
	        		+ "clg.email1 as email1,"
	        		+ "clg.email2 as email2,"
	        		+ "clg.website as website,"
	        		+ "clg.latitude as latitude,"
	        		+ "clg.type as type,"
	        		+ "clg.fees as fees,"
	        		+ "clg.isWifi as isWifi,"
	        		+ "clg.isHostel as isHostel,"
	        		+ "clg.isTransportation as isTransportation,"
	        		+ "clg.isCanteen as isCanteen"
	        		+ " FROM College clg");
	        /*if (customerId != 0) {
	            strBuilder.append(" AND UR.customer.id = :customerId");
	        }
	        if (isActive != null) {
	            strBuilder.append(" AND U.isActive = :iSActive");
	            strBuilder.append(" AND UR.isActive = :iSActive");//added to check if userRole is active 
	        }*/
	        strBuilder.append(" ORDER BY clg.collegeId");
	        Session currentSession = getSessionFactory().getCurrentSession();
	        Query query = currentSession.createQuery(strBuilder.toString());

	        /*if (customerId != 0) {
	            query.setParameter("customerId", customerId);
	        }
	        if (isActive != null) {
	            query.setParameter("iSActive", isActive);
	        }*/
	        
	        List<CollegeDTO> lst = query.setResultTransformer(Transformers.aliasToBean(CollegeDTO.class)).setFirstResult(startLimit).setMaxResults(endLimit).list();
	        return lst;
	    
	}

	@Override
	public Integer getAllCollegeCount() {
		// TODO Auto-generated method stub
		StringBuilder strBuilder = new StringBuilder("SELECT clg FROM College clg");
        /*if (customerId != 0) {
            strBuilder.append(" AND UR.customer.id = :customerId");
        }
        if (isActive != null) {
            strBuilder.append(" AND U.isActive = :iSActive");
            strBuilder.append(" AND UR.isActive = :iSActive");//added to check if userRole is active 
        }*/
        strBuilder.append(" ORDER BY clg.collegeId");
        Session currentSession = getSessionFactory().getCurrentSession();
        Query query = currentSession.createQuery(strBuilder.toString());

        /*if (customerId != 0) {
            query.setParameter("customerId", customerId);
        }
        if (isActive != null) {
            query.setParameter("iSActive", isActive);
        }*/
        
		return query.list().size();
	}
	
}
