package com.j2ee.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.j2ee.entity.Product;

@Repository
public class ProductsDaoImpl implements ProductsDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Product> selectAll() {
		Session session = sessionFactory.getCurrentSession();

		Query<Product> query = session.createQuery("from Product", Product.class);

		List<Product> products = query.getResultList();

		return products;
	}

	@Override
	@Transactional
	public String insert(Product product) {
		Session session = sessionFactory.getCurrentSession();
		String result = (String) session.save(product);
		return result;
	}

	@Override
	@Transactional
	public void update(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.update(product);
	}

	@Override
	@Transactional
	public void delete(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(product);
	}

}
