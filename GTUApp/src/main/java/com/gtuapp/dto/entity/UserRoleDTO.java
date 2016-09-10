package com.gtuapp.dto.entity;

import java.util.Date;

import com.gtuapp.entity.Role;
import com.gtuapp.entity.User;

/**
 * Entity bean for table UserRole
 *
 * @author Vinit
 *
 */
public class UserRoleDTO {
	
	private Integer id;

    private boolean isActive;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	
    
}
