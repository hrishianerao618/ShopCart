package com.project.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.project.beans.Product;

public class App {
	public static void main(String[] args) {
		//Product p=new Product();POJO causes memory allocation problem in heap
		ApplicationContext context=new ClassPathXmlApplicationContext("com/project/main/Beans.xml");
		Product p= (Product)context.getBean("product");//call SBCF, product i the refernce ,Casting from obj to prod
		System.out.println(p.toString());
		((ClassPathXmlApplicationContext)context).close();
	}
}
