package productapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import productapp.dao.ProductDao;
import productapp.entities.Product;

@Controller
public class MainController {
	
	@Autowired
	private ProductDao productdao;
	private RedirectView redirect;
	@RequestMapping("/")
	public String home(Model model) {
		List<Product> products = productdao.getProducts();
		model.addAttribute("products", products);
		return "index";
	}
	
	@RequestMapping("/add-product")
	public String addProduct(Model model) {
		model.addAttribute("title","Add Product");
		return "add_product_form";
	}
	
	@RequestMapping(path = "/handle-product", method= RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product, HttpServletRequest httpservlet) {
		System.out.println(product);
		redirect = new RedirectView();
		productdao.createProduct(product);
		redirect.setUrl(httpservlet.getContextPath() + "/");
		return redirect;
	}
	
	@RequestMapping("/delete-product/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId ,HttpServletRequest httpservlet) {
		redirect = new RedirectView();
		productdao.deleteProduct(productId);
		redirect.setUrl(httpservlet.getContextPath() + "/");
		return redirect;
	}
	
	
	@RequestMapping(value="/update-product")
	public String updateProduct(@RequestParam("prodID") int productId, Model model) {
		System.out.println(productdao.getProductDetails(productId));
		model.addAttribute("prodDetails", productdao.getProductDetails(productId));
		return "update_form";
	}
	
}
