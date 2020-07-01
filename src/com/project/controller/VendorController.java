package com.project.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.beans.Category;
import com.project.beans.Product;
import com.project.beans.User;
import com.project.beans.Vendor;
import com.project.model.DBConfig;

@Controller
public class VendorController {

	@Autowired
	private DBConfig db;
	@Autowired
	private Vendor vendor;
	@Autowired
	private Product product;
	private int catId, vid;

	@RequestMapping("/vendor")
	public String loginVendor(Model model) {
		model.addAttribute("loginMsg", "");
		model.addAttribute("vendor", vendor);
		return "vendorLogin";
	}

	@RequestMapping("/vendor/processLogin")
	public String readLogin(Vendor vendor, Model model, HttpSession session) {

		boolean check = db.checkCredentialsVendor(vendor);
		if (check == false) {
			model.addAttribute("loginMsg", "Invalid Login Credentials");
			return "vendorLogin";
		}
		List<Vendor> vd = db.findId(vendor);
		for (Vendor v : vd) {
			vid = v.getId();
		}
		// String name=db.getUsersName(user);
		List<Category> categoryList = db.fetchCategories();
		Collections.sort(categoryList);
		session.setAttribute("categoryList", categoryList);
		session.setAttribute("vid", vid);
		System.out.println(vid);
		session.setAttribute("username", vendor.getUsername());
		// session.setAttribute("name", name);
		return "vendorHome";
	}

	@RequestMapping("/vendor/addProduct")
	public String addProduct(@RequestParam("catId") int catId, @RequestParam("vid") int vid, Model model,
			HttpSession session) {
		// session.setAttribute("catId",catId);
		// session.setAttribute("vid",vid);
		model.addAttribute("product", product);
		this.catId = catId;
		this.vid = vid;
		return "getProduct";
	}

	@RequestMapping("/vendor/readProduct")
	public String addProduct(Model model, @Valid Product product, BindingResult result) {
		if (product.getName().equals(""))
			return "vendorHome";
		db.addProduct(product, catId, vid);
		return "vendorHome";

	}
	
	@RequestMapping("/vendor/home")
	public String vendorHome() {
		return "vendorHome";

	}


	@RequestMapping("/vendor/logout")
	public String logout(Model model) {
		model.addAttribute("loginMsg", "");
		model.addAttribute("vendor", vendor);
		return "vendorLogin";
	}
}
