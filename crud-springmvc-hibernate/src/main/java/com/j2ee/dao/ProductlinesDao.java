package com.j2ee.dao;

import java.util.List;

import com.j2ee.entity.ProductLine;

public interface ProductlinesDao {

	List<ProductLine> selectAll();

	String insert(ProductLine productLine);

	void update(ProductLine productLine);

	void delete(ProductLine productLine);
}
