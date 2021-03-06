package com.project.beans;

import org.springframework.stereotype.Component;

@Component
public class Category implements Comparable<Category>{
	private int id;
	private String name;
	private int priority;
	
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", priority=" + priority + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public int compareTo(Category c) {
		return this.priority-c.priority;
	}
}
