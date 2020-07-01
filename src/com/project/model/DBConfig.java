package com.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.project.beans.Category;
import com.project.beans.Product;
import com.project.beans.User;
import com.project.beans.Vendor;

@Component
public class DBConfig {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbc = new NamedParameterJdbcTemplate(dataSource);
	}

	
	public List<Category> fetchCategories(){
		RowMapper<Category> rowMapper = new RowMapper<Category>() {

			@Override
			public Category mapRow(ResultSet rst, int arg1) throws SQLException {
				Category c = new Category();
				c.setId(rst.getInt(1));
				c.setName(rst.getString(2));
				c.setPriority(rst.getInt(3));
				return c;
			}
			
		};
		return jdbc.query("select * from category", rowMapper);
	}
	
	public void addUser(@Valid User user) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("name", user.getName());
		map.addValue("username", user.getUsername());
		map.addValue("mail", user.getMail());
		map.addValue("password", user.getPassword());
		jdbc.update("insert into users(name,username,password,mail) values (:name,:username,:password,:mail)", map);
	}


	public boolean checkCredentials(User user) {
		MapSqlParameterSource map=new MapSqlParameterSource();
		map.addValue("username", user.getUsername());
		map.addValue("password",user.getPassword());
		
		
		RowMapper<User> rowMapper=new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rst, int rowNum) throws SQLException {
				User u=new User();
				u.setUsername(rst.getString(1));
				u.setPassword(rst.getString(2));
				return u;
			}
			
						
		};
		List<User> userList=jdbc.query("select username,password from users where username=:username and password=:password", map, rowMapper);
		int count=0;
		for(User u:userList) {
			count++;
		}
		
		if(count>0)
			return true;
		return false;
	}


	public List<Product> fetchproducts(int catid) {
		MapSqlParameterSource map=new MapSqlParameterSource();
		map.addValue("catid", catid);
		
		RowMapper<Product> rowMapper=new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product p=new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setShort_desc(rs.getString(3));
				p.setDescription(rs.getString(4));
				p.setPrice(rs.getDouble(5));
				//p.setImage(rs.getString(6));
				p.setCat_id(rs.getInt(7));
				return p;
			}
			
		};
		
		List<Product> prodList=jdbc.query("select * from product where cat_id=:catid", map, rowMapper);
		return prodList;
	}


	public Product findProduct(int prodId) {
		MapSqlParameterSource map=new MapSqlParameterSource();
		map.addValue("prodId", prodId);
		
		RowMapper<Product> rowMapper=new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product p=new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setShort_desc(rs.getString(3));
				p.setDescription(rs.getString(4));
				p.setPrice(rs.getDouble(5));
				//p.setImage(rs.getString(6));
				p.setCat_id(rs.getInt(7));
				return p;
			}
			
		
		};
		
		List<Product> prodList=jdbc.query("select * from product", map,rowMapper );
		
		for(Product p:prodList) {
			if(p.getId()==prodId)
				return p;
		}
		return null;
	}


	public void deleteProduct(int prodId) {
		MapSqlParameterSource map=new MapSqlParameterSource();
		map.addValue("prodId", prodId);
		
		RowMapper<Product> rowMapper=new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product p=new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setShort_desc(rs.getString(3));
				p.setDescription(rs.getString(4));
				p.setPrice(rs.getDouble(5));
				//p.setImage(rs.getString(6));
				p.setCat_id(rs.getInt(7));
				return p;
			}
			
		
		};
		
		jdbc.update("delete from product where id=:prodId", map );
		
		
	}


	public boolean checkCredentialsVendor(Vendor vendor) {
		MapSqlParameterSource map=new MapSqlParameterSource();
		map.addValue("username", vendor.getUsername());
		map.addValue("password",vendor.getPassword());
		
		
		RowMapper<Vendor> rowMapper=new RowMapper<Vendor>() {

			@Override
			public Vendor mapRow(ResultSet rst, int rowNum) throws SQLException {
				Vendor v=new Vendor();
				v.setUsername(rst.getString(1));
				v.setPassword(rst.getString(2));
				return v;
			}
			
						
		};
		List<Vendor> vendorList=jdbc.query("select username,password from vendor where username=:username and password=:password", map, rowMapper);
		int count=0;
		int vid;
		for(Vendor v:vendorList) {
			count++;
			if(count>0)
				return true;
		}
		
		
		return false;
	}


	public void addProduct(Product product, int catId, int vid) {
		
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("name", product.getName());
		map.addValue("short_desc", product.getShort_desc());
		map.addValue("description", product.getDescription());
		map.addValue("price", product.getPrice());
		map.addValue("catId", catId);
		map.addValue("vid", vid);

		jdbc.update("insert into product(name,short_desc,description,price,cat_id,vid) values (:name,:short_desc,:description,:price,:catId,:vid)", map);
	}


	public List<Vendor> findId(Vendor vendor) {
		// TODO Auto-generated method stub
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("username", vendor.getUsername());
		RowMapper<Vendor> rowMapper=new RowMapper<Vendor>() {

			@Override
			public Vendor mapRow(ResultSet rs, int rowNum) throws SQLException {
				Vendor v=new Vendor();
				v.setId(rs.getInt(1));
				return v;
			}
			
		};
		
		List<Vendor> vendorList=jdbc.query("select vid,name from vendor where username=:username", map, rowMapper);

		return vendorList;
	}



}
