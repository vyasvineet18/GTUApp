package com.gtuapp.dto.entity;

import java.util.Date;
import java.util.List;

import com.gtuapp.entity.UserRole;

/**
 * Entity bean for table User
 *
 * @author Vinit,Akash,Krunal
 *
 */
public class UserDTO {

	private Integer userId;
	private String name;
    private String email;
    private String password;
    private boolean gender;
    private String profileImage;
    private boolean isActive;
    
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	
}
