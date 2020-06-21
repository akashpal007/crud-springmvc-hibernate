package com.j2ee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.j2ee.dao.ProductlinesDao;
import com.j2ee.dao.ProductsDao;
import com.j2ee.entity.Product;
import com.j2ee.entity.ProductLine;

@Controller
public class MainController {
	@Autowired
	private ProductlinesDao productlinesDao;

	@RequestMapping("/productlines")
	public String productlines(Model model) {
		// get productlines from Dao
		List<ProductLine> productLines = productlinesDao.selectAll();

		// Add it to model
		model.addAttribute("productLines", productLines);
		model.addAttribute("productLine", new ProductLine());

		return "productlines";
	}

	@RequestMapping("/productlinesEdit")
	public String productlinesEdit(@ModelAttribute("productLine") ProductLine theProductLine) {
		productlinesDao.update(theProductLine);
		return "redirect:/productlines";
	}

	@RequestMapping("/productlinesInsert")
	public String productlinesInsert(@ModelAttribute("productLine") ProductLine theProductLine) {
		productlinesDao.insert(theProductLine);
		return "redirect:/productlines";
	}

	@RequestMapping("/productlinesDelete")
	public String productlinesDelete(@RequestParam("productline")String productline,HttpServletRequest request, HttpServletResponse response) {
		ProductLine line = new ProductLine();
		line.setProductLine(productline);
		productlinesDao.delete(line);
		return "redirect:/productlines";
	}

	@Autowired
	private ProductsDao productsDao;

	@RequestMapping("/products")
	public String products(Model model) {
		// get productlines from Dao
		List<Product> products = productsDao.selectAll();
		List<ProductLine> productLines = productlinesDao.selectAll();

		// Add it to model
		model.addAttribute("products", products);
		model.addAttribute("productLines", productLines);
		model.addAttribute("product", new Product());

		return "products";
	}

	@RequestMapping("/productsEdit")
	public String productsEdit(@ModelAttribute("product") Product theProduct) {	
		productsDao.update(theProduct);
		return "redirect:/products";
	}

	@RequestMapping("/productsInsert")
	public String productsInsert(@ModelAttribute("product") Product theProduct) {
		productsDao.insert(theProduct);
		return "redirect:/products";
	}

	@RequestMapping("/productsDelete")
	public String productsDelete(@RequestParam("productcode") String productcode) {
		Product product = new Product();
		product.setProductCode(productcode);
		productsDao.delete(product);
		return "redirect:/products";
	}

}
