package homebuh.dao.impl;

import homebuh.dao.Finder;
import homebuh.dao.GenericDAO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

public class HibernateGenericDAO<E extends Serializable> implements
		GenericDAO<E> {
	private static final String ORDER_RESULTS = "orderResults";
	private static final String MAX_RESULTS = "maxResults";
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

	@SuppressWarnings("unchecked")
	@Override
	public List<E> find(Finder criteriaType, Map<String, Object> parameters) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(type);
		for (String field : parameters.keySet()) {
			if (!field.equals(MAX_RESULTS) && !field.equals(ORDER_RESULTS)) {
				criteria.add(Restrictions.eq(field, parameters.get(field)));
			}
		}
		criteria = setOrdering(parameters.get(ORDER_RESULTS), criteria);
		if (parameters.get(MAX_RESULTS) != null) {
			criteria.setMaxResults((Integer) parameters.get(MAX_RESULTS));
		}
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	private Criteria setOrdering(Object fields, Criteria criteria) {
		Map<String, Boolean> orders = (Map<String, Boolean>) fields;
		if (orders != null) {
			for (String field : orders.keySet()) {
				if (orders.get(field)) {
					criteria.addOrder(Order.asc(field));
				} else {
					criteria.addOrder(Order.desc(field));
				}
			}
		}
		return criteria;
	}
}
