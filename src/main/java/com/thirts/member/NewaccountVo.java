package com.thirts.member;

public class NewaccountVo {
	private String id;
	private String password;
	private String password_check;
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_check() {
		return password_check;
	}
	public void setPassword_check(String password_check) {
		this.password_check = password_check;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "NewaccountVo [id=" + id + ", password=" + password + ", password_check =" + password_check + ", name = " + name +"]";
	}
	
}
