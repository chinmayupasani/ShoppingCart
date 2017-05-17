package com.niit.shoppingcart;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.domain.User;

public class UserDAOTestCase {

	
	@Autowired static AnnotationConfigApplicationContext context;
	
	@Autowired  static UserDAO  userDAO;
	
	@Autowired  static User user;
	
	
	//The above objects need to initialize
	/**
	 * This method is going execute before calling any one of test case
	 * and will execute only once
	 */
	@BeforeClass
	public static void initialize()
	{
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		
		//get the userDAO from context
		userDAO =  (UserDAO) context.getBean("userDAO");
		
		//get the user from context
		
		user = (User)context.getBean("user");
		
	}
	
	//@Test
	public void createUserTestCase()
	{
		user.setId("niit");
		user.setName("Chinmay Upasani");
		user.setPassword("niit");
		user.setRole("ROLE_ADMIN");
		user.setContact("9993925165");
		boolean flag =  userDAO.save(user);
		
	

		//error - if there is in runtime errors  -  Red mark
		//success  - if expected and actual is same  - green mark
		//fail  - if expected and actual is different  -  blue mark
		assertEquals("createUserTestCase",true,flag);
		
	}
	
	//@Test
	public void updateUserTestCase()
	{
		user.setId("Rakesh");
		user.setName("Rakesh");
		user.setPassword("Rakesh");
		user.setRole("ROLE_USER");
		user.setContact("9999544532");
		boolean flag =  userDAO.update(user);
		
	

		//error - if there is in runtime errors  -  Red mark
		//success  - if expected and actual is same  - green mark
		//fail  - if expected and actual is different  -  blue mark
		assertEquals("updateUserTestCase",true,flag);
		
	}
	
	@Test
	public void validateUserTestCase()
	{
		
		boolean flag =  userDAO.validate("niit", "niit");	
		assertEquals(true,flag);
		
	}
	
	@Test
	public void listAllUserTestCase()
	{
		int actualSize =userDAO.list().size();
		assertEquals(6, actualSize);
	}
	
	
	
	
}
