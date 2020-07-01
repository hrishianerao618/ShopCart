package com.project.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import com.project.beans.Category;
import com.project.beans.Product;
import com.project.beans.User;
import com.project.model.DBConfig;


@Controller
public class MainController {
	
	@Autowired
	private User user;
	@Autowired
	private DBConfig db;
	private int count;
	
	List<Product> cartList=new ArrayList<>();
	
	@RequestMapping("/")
	public String showHome(HttpSession session,Model model) {
		List<Category> categoryList=db.fetchCategories();
		Collections.sort(categoryList);
		session.setAttribute("categoryList",categoryList);
		
		return "index";
	}
	
	@RequestMapping("/loginCustomer")
	public String showLogin(Model model) {
		model.addAttribute("msg","");
		model.addAttribute("loginMsg", "");
		model.addAttribute("user",user);
		return "login";
	}
	
	@RequestMapping("/signup")
	public String showSignup(Model model) {
		model.addAttribute("user",user);
		return "signup";
	}
	
	@RequestMapping("/readSignup")
	public String readSignup(Model model,@Valid User user,BindingResult result) {
		if(result.hasErrors()) {
			return "signup";
		}
		db.addUser(user);
		user.setPassword("");
		model.addAttribute("loginMsg", "");
		model.addAttribute("msg","Sign-Up Successful");
		model.addAttribute("user",user);
		return "login";
	}
	
	@RequestMapping("/processLogin")
	public String readLogin(User user,Model model,HttpSession session) {
		
		boolean check=db.checkCredentials(user);
		if(check==false) {
			model.addAttribute("loginMsg", "Invalid Login Credentials!!");
			return "login";
		}
		
		//String name=db.getUsersName(user);
		List<Category> categoryList=db.fetchCategories();
		Collections.sort(categoryList);
		model.addAttribute("categoryList",categoryList);
		session.setAttribute("username", user.getUsername());
		//session.setAttribute("name", name);
		return "home";
	}
	@RequestMapping("/getProducts")
	public String getProducts(@RequestParam("catId") int catid,Model model,HttpSession session) {
		List<Category> categoryList=db.fetchCategories();
		Collections.sort(categoryList);
		model.addAttribute("categoryList",categoryList);
		List<Product> prodList=db.fetchproducts(catid);
		session.setAttribute("prodList",prodList);
		count=cartList.size();
		session.setAttribute("count",count);
		return "home";
	}
	
	@RequestMapping("/getProductsVisitor")
	public String getProductsVisitor(@RequestParam("catId") int catid,Model model,HttpSession session) {
		List<Category> categoryList=db.fetchCategories();
		Collections.sort(categoryList);
		model.addAttribute("categoryList",categoryList);
		List<Product> prodList=db.fetchproducts(catid);
		session.setAttribute("prodList",prodList);
		count=cartList.size();
		session.setAttribute("count",count);
		return "index";
	}
	
	@RequestMapping("/addToCart")
	public String addToCart(@RequestParam("prodId") int prodId,HttpSession session,Model model) {
		Product product=db.findProduct(prodId);
		cartList.add(product);
		session.setAttribute("cartList",cartList);
		count=cartList.size();
		session.setAttribute("count",count);
		
		return "home";
	}
	
	@RequestMapping("/addToCartVisitor")
	public String addToCartVisitor(@RequestParam("prodId") int prodId,HttpSession session,Model model) {
		Product product=db.findProduct(prodId);
		cartList.add(product);
		session.setAttribute("cartList",cartList);
		count=cartList.size();
		session.setAttribute("count",count);
		
		return "index";
	}
	
	@RequestMapping("/showCart")
	public String displayCart(HttpSession session) {
		count=cartList.size();
		session.setAttribute("count",count);
		return "cart";
	}
	
	@RequestMapping("/showCartVisitor")
	public String displayCartVisitor(HttpSession session) {
		count=cartList.size();
		session.setAttribute("count",count);
		return "visitorCart";
	}
	
	@RequestMapping("/removeFromCart")
	public String removeFromCart(@RequestParam("prodId") int prodId,HttpSession session,Model model) {
		Product temp=null;
		for(Product p:cartList) {
			if(prodId==p.getId()) {
				temp=p;
				break;
			}
		}
		cartList.remove(temp);
		count=cartList.size();
		session.setAttribute("count",count);
		return "cart";
	}
	
	@RequestMapping("/logout")
	public String displayLogout(HttpSession session,Model model) {
		session.setAttribute("count",0);
		session.setAttribute("cartList","");
		return "index";
	}
	
	@RequestMapping("/buyLogin")
	public String buyVisitor(Model model) {
		model.addAttribute("msg","Please Login to Buy!!");
		model.addAttribute("loginMsg", "");
		model.addAttribute("user",user);
		return "login";
	}
	
	@RequestMapping("/home")
	public String showHomeUser(HttpSession session,Model model) {
		List<Category> categoryList=db.fetchCategories();
		Collections.sort(categoryList);
		session.setAttribute("categoryList",categoryList);
		
		return "home";
	}
}
