package com.javalec.web.user.model;

public class UserVO {
	String uid;
	String name;
	String pwd;
	String email;
	String part;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", part=" + part + "]";
	}
	
	
}
