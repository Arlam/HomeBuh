package homebuh.dao.impl;

import homebuh.dao.GenericDAO;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class HibernateGenericDAO<E extends Serializable> implements
		GenericDAO<E> {
	private Class<E> type;
	@Autowired
	private SessionFactory sessionFactory;

	public HibernateGenericDAO(Class<E> type) {
		this.type = type;
	}

	@Override
	public Integer add(E entity) {
		Integer id = null;
		id = (Integer) sessionFactory.getCurrentSession().save(entity);
		return id;
	}

	@Override
	public E get(Integer id) {
		@SuppressWarnings("unchecked")
		E entity = (E) sessionFactory.getCurrentSession().get(type, id);
		return entity;
	}

	@Override
	public List<E> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from " + type.getName());
		@SuppressWarnings("unchecked")
		List<E> entities = query.list();
		return entities;
	}

	@Override
	public void delete(E entity) {
		sessionFactory.getCurrentSession().delete(entity);
	}

	@Override
	public void update(E entity) {
		sessionFactory.getCurrentSession().update(entity);
	}

}
