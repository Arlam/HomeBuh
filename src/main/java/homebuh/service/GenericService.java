package homebuh.service;

import homebuh.dao.GenericDAO;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public abstract class GenericService<T> {

	abstract public GenericDAO<T> getDAO();

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<T> find(Map<String, Object> params) {
		return getDAO().find(null, params);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<T> getAll() {
		return getDAO().getAll();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public T get(Integer id) {
		return getDAO().get(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer add(T object) {
		return getDAO().add(object);
	}
}
