package productapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import productapp.entities.Product;


//@Component
@Repository
public class ProductDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	//create a new product
	@Transactional
	public void createProduct(Product product) {
		this.hibernateTemplate.saveOrUpdate(product);
		//as save function returns serializable
	}
	
	//get all products
	public List<Product> getProducts() {
		return this.hibernateTemplate.loadAll(Product.class);
	}
	
	//delete  a single product
	@Transactional
	public void deleteProduct(int productId) {
		//first fetching the product based on productid we need to delete and then deleting it 
		this.hibernateTemplate.delete(this.hibernateTemplate.load(Product.class, productId));
	}
	
	//get single product details
	public Product getProductDetails(int productId) {
		return this.hibernateTemplate.get(Product.class, productId);
	}
	
}
