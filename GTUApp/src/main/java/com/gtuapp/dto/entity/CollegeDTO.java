package com.gtuapp.dto.entity;

import java.math.BigDecimal;

import com.gtuapp.enums.CollegeType;

public class CollegeDTO {
	
	private Integer collegeId;
	private String name;
	private String address;
	private String city;
	private Integer pincode;
	private String contact1;
	private String contact2;
	private String fax;
	private String email1;
	private String email2;
	private String website;
	private BigDecimal latitude;
	private BigDecimal longitude;
	private CollegeType type;
	private Integer fees;
	private Boolean isWifi;
	private Boolean isHostel;
	private Boolean isTransportation;
	private Boolean isCanteen;
	
	public Integer getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(Integer collegeId) {
		this.collegeId = collegeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getPincode() {
		return pincode;
	}
	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}
	public String getContact1() {
		return contact1;
	}
	public void setContact1(String contact1) {
		this.contact1 = contact1;
	}
	public String getContact2() {
		return contact2;
	}
	public void setContact2(String contact2) {
		this.contact2 = contact2;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public BigDecimal getLatitude() {
		return latitude;
	}
	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
	public BigDecimal getLongitude() {
		return longitude;
	}
	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	public CollegeType getType() {
		return type;
	}
	public void setType(CollegeType type) {
		this.type = type;
	}
	public Integer getFees() {
		return fees;
	}
	public void setFees(Integer fees) {
		this.fees = fees;
	}
	public Boolean getIsWifi() {
		return isWifi;
	}
	public void setIsWifi(Boolean isWifi) {
		this.isWifi = isWifi;
	}
	public Boolean getIsHostel() {
		return isHostel;
	}
	public void setIsHostel(Boolean isHostel) {
		this.isHostel = isHostel;
	}
	public Boolean getIsTransportation() {
		return isTransportation;
	}
	public void setIsTransportation(Boolean isTransportation) {
		this.isTransportation = isTransportation;
	}
	public Boolean getIsCanteen() {
		return isCanteen;
	}
	public void setIsCanteen(Boolean isCanteen) {
		this.isCanteen = isCanteen;
	}
	
}
