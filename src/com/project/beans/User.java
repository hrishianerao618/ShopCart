package com.project.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.lang.NonNull;

public class User {
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + "]";
	}

	
	@Pattern(regexp="\\w+",message="Invalid Format")
	private String name;
	
	
	
	@Pattern(regexp="\\w+",message="Invalid format")
	private String username;
	
	
	
	@Size(min=4 ,max=8,message="Size Should Be Between 4-10 Characters")
	private String password;
	
	@Email
	private String mail;

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
