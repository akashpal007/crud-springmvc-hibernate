package com.j2ee.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.j2ee.entity.ProductLine;

@Repository
public class ProductlinesDaoImpl implements ProductlinesDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<ProductLine> selectAll() {
		Session session = sessionFactory.getCurrentSession();

		Query<ProductLine> query = session.createQuery("from ProductLine", ProductLine.class);

		List<ProductLine> productLines = query.getResultList();

		return productLines;
	}

	@Override
	@Transactional
	public String insert(ProductLine productLine) {
		Session session = sessionFactory.getCurrentSession();
		String result = (String) session.save(productLine);
		return result;
	}

	@Override
	@Transactional
	public void update(ProductLine productLine) {
		Session session = sessionFactory.getCurrentSession();
		session.update(productLine);
	}

	@Override
	@Transactional
	public void delete(ProductLine productLine) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(productLine);
	}

}
