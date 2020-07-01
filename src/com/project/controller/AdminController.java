package com.project.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.beans.Category;
import com.project.beans.Product;
import com.project.model.DBConfig;

@Controller
public class AdminController {
	
	@Autowired
	private DBConfig db;
	
	@RequestMapping("/admin")
	public String showHome(Model model) {
		List<Category> categoryList=db.fetchCategories();
		Collections.sort(categoryList);
		model.addAttribute("categoryList",categoryList);
		return "adminHome";
	}
	
	@RequestMapping("/admin/getProducts")
	public String getProducts(@RequestParam("catId") int catid,@RequestParam("catName") String catName,Model model,HttpSession session) {
		List<Product> prodList=db.fetchproducts(catid);
		model.addAttribute("prodList",prodList);
		model.addAttribute("catName",catName);
		return "adminProduct";
	}
	
	@RequestMapping("/admin/removeProduct")
	public String addToCart(@RequestParam("prodId") int prodId,@RequestParam("catId") int catId,HttpSession session,Model model) {
		db.deleteProduct(prodId);
		List<Product> prodList=db.fetchproducts(catId);
		model.addAttribute("prodList",prodList);
		return "adminProduct";
	}
	
	
	
}
