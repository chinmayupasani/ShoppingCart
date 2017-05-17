/*package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;
import com.niit.util.FileUtil;
import com.niit.util.Util;
import com.niit.util.FileUtil;
import com.niit.validator.ProductValidator;

@Controller
(value="/manage-product-add")
public class ProductController1 {

	private static Logger log = LoggerFactory.getLogger(ProductController1.class);

	@Autowired ProductDAO productDAO;

	@Autowired Product product;

	@Autowired SupplierDAO supplierDAO;

	@Autowired Supplier supplier;

	@Autowired CategoryDAO categoryDAO;

	@Autowired Category category;

	@Autowired HttpSession session;

	// Setting Path to store images
	private String path = "D://Chinmay//SLT1//ShoppingCartFrontEnd//src//main//webapp//resources//images";
	// private String path =
	

	// Add or Update Product
	@RequestMapping(value="/manage-product-add", method=RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("price") double price,
			@RequestParam("description") String description, @RequestParam("image") MultipartFile file)
	{
		log.debug("Starting of method addProduct");
		ModelAndView mv=new ModelAndView("Home");
		
		product.setId(id);
		product.setName(name);
		product.setPrice(price);
		product.setDescription(description);
		//product.setFile(file);
		
		Category category=categoryDAO.getCategoryById(product.getCategory().getName());
		Supplier supplier=supplierDAO.getSupplierById(product.getSupplier().getName());
		product.setCategory(category);
		product.setCategory_id(category.getId());
		product.setSupplier(supplier);
		product.setSupplier_id(supplier.getId());
		
		productDAO.save(product);
		
		FileUtil.upload(path, file, product.getId()+".jpg");
				
		mv.addObject("isAdminClickedProducts", "true");
		mv.addObject("isAdmin", "true");
		
		mv.addObject("productList", this.productDAO.list());
		mv.addObject("product", new Product());
		mv.addObject("categoryList", this.categoryDAO.list());
		mv.addObject("category", new Category());
		
		List<Product> productList=productDAO.list();
		session.setAttribute("productList", productList);
		session.setAttribute("product", product);

		log.debug("Ending of the method add Product");
		return mv;
	}
	public String addProduct(@ModelAttribute("product") Product product, @RequestBody MultipartFile file,
			Model model, HttpServletRequest request) {
		log.debug("Starting of method addProduct");
		log.debug(product.getCategory().getName());
		Category category = categoryDAO.getCategoryById(product.getCategory().getName());
		Supplier supplier = supplierDAO.getSupplierById(product.getSupplier().getName());

		product.setCategory(category);
		product.setCategory_id(category.getId());
		
		product.setSupplier(supplier);
		product.setSupplier_id(supplier.getId());
		
		product.setId(Util.removeComman(product.getId()));
		//FileUtil.upload(path, file, product.getId() + ".jpg");
		
		productDAO.save(product);
		
		if(!product.getImage().getOriginalFilename().equals(""))
		{
			FileUtil.uploadFile(request,product.getImage(),product.getName());
		}
		
		model.addAttribute("isAdminClickedProducts", "true");
		model.addAttribute("isAdmin", "true");

		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("product", new Product());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("category", new Category());

		log.debug("Ending of the method add Product");
		return "redirect:/manageProducts";
	}
	
	public String addProduct(@Valid @ModelAttribute("product") Product product, BindingResult results, Model model, 
			HttpServletRequest request){
		
		// handle image validation for new products
		if(product.getId() == null)
		{
			new ProductValidator().validate(product, results);
		}
		else
		{
			if(!product.getFile().getOriginalFilename().equals(""))
			{
				new ProductValidator().validate(product, results);
			}
		}
		// check if there are any errors
		if(results.hasErrors())
		{
			model.addAttribute("isAdminClickedProducts",true);
			model.addAttribute("title","Manage Products");
			model.addAttribute("message","Validation failed for Product Submission!");
			
			return "page";
		}
		
		
		log.debug(product.toString());
		
		
		if(product.getId() == null)
		{
			//create a new product record if id is 0
			productDAO.save(product);
		}
		else
		{
			//update the product if id is not 0
			productDAO.update(product);
		}
		
		if(!product.getFile().getOriginalFilename().equals(""))
		{
			FileUtil.uploadFile(request,product.getFile(), product.getId());
		}
		
		return "redirect:/manageProducts";
	}
	
	
	
	
	@RequestMapping("/manageProducts")
	public String manageProducts(Model model) {
		log.debug("Starting of the method manageProducts");
		model.addAttribute("isAdminClickedProducts", "true");
		model.addAttribute("isAdmin", "true");
		model.addAttribute("product", product);
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.list());
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.list());
		log.debug("Ending of the method manageProducts");
		return "Home";
	}

	// Delete Product
	@RequestMapping("/manage-product-delete/{id}")
	public String deleteProduct(@PathVariable("id") String id, ModelMap model) {
		log.debug("Starting of the method deleteProduct");
		try {
			productDAO.delete(id);
			model.addAttribute("message", "Successfully deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		log.debug("ending of method deleteProduct");
		return "redirect:/manageProducts";

	}

	// Edit Products
	@RequestMapping("/manage-product-edit/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		log.debug("Starting of the method editProduct");
		product = productDAO.getProductById(id);
		model.addAttribute("product", product);
		log.debug("Ending of the method editProduct");
		return "redirect:/manageProducts";
	}

	// Get select product details
	@RequestMapping("/manage-product-get/{id}")
	public ModelAndView getSelectedProduct(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
		log.debug("Starting of the method getSelectedProduct");
		ModelAndView mv = new ModelAndView("redirect:/");
		redirectAttributes.addFlashAttribute("selectedProduct", productDAO.getProductById(id));
		log.debug("ending of method getSelectedProduct");
		return mv;
	}

}*/