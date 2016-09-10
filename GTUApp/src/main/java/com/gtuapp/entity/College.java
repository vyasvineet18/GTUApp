package com.gtuapp.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.gtuapp.enums.CollegeType;
import com.gtuapp.utils.NamedQueryConstants;

@Entity
@Table(name = "COLLEGES")

@NamedQueries(
        {
	@NamedQuery(name = NamedQueryConstants.getAllColleges, query = "SELECT clg FROM College clg")
})
public class College implements Serializable{
	
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
	
	public College() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "College_Id", unique = true, nullable = false)
	public Integer getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Integer collegeId) {
		this.collegeId = collegeId;
	}
	
	@Column(name = "Name", nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "Address", nullable = false)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "City", nullable = false)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "Pincode", nullable=false , length =6)
	public Integer getPincode() {
		return pincode;
	}

	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}
	
	@Column(name = "Contact1")
	public String getContact1() {
		return contact1;
	}

	public void setContact1(String contact1) {
		this.contact1 = contact1;
	}
	@Column(name = "Contact2")
	public String getContact2() {
		return contact2;
	}

	public void setContact2(String contact2) {
		this.contact2 = contact2;
	}
	@Column(name = "Fax")
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}
	@Column(name = "Email1")
	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	
	@Column(name = "Email2")
	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	@Column(name = "Website")
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	
	@Column(name = "Latitude")
	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
	@Column(name = "Longitude")
	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	
	@Column(name = "Type")
	@Enumerated(EnumType.ORDINAL)
	public CollegeType getType() {
		return type;
	}
	
	public void setType(CollegeType type) {
		this.type = type;
	}
	
	@Column(name = "Fees")
	public Integer getFees() {
		return fees;
	}

	public void setFees(Integer fees) {
		this.fees = fees;
	}
	
	@Column(name = "Is_Wifi")
	//@Type(type="yes_no")
	public Boolean getIsWifi() {
		return isWifi;
	}

	public void setIsWifi(Boolean isWifi) {
		this.isWifi = isWifi;
	}
	
	@Column(name = "Is_Hostel")
	//@Type(type="yes_no")
	public Boolean getIsHostel() {
		return isHostel;
	}

	public void setIsHostel(Boolean isHostel) {
		this.isHostel = isHostel;
	}

	@Column(name = "Is_Transportation")
	//@Type(type="yes_no")
	public Boolean getIsTransportation() {
		return isTransportation;
	}

	public void setIsTransportation(Boolean isTransportation) {
		this.isTransportation = isTransportation;
	}
	
	@Column(name = "Is_Canteen")
	//@Type(type="yes_no")
	public Boolean getIsCanteen() {
		return isCanteen;
	}

	public void setIsCanteen(Boolean isCanteen) {
		this.isCanteen = isCanteen;
	}
	
	
	
}
