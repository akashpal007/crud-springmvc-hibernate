package com.j2ee.dao;

import java.util.List;

import com.j2ee.entity.Product;

public interface ProductsDao {
	List<Product> selectAll();

	String insert(Product product);

	void update(Product product);

	void delete(Product product);

}
