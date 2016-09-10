package com.gtuapp.dto.entity;

import java.util.List;

import com.gtuapp.entity.UserRole;

public class RoleDTO {
	
	private Integer roleId;
    private String name;
    private String isActive;
    
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
}
