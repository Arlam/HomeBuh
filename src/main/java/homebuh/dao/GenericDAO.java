package homebuh.dao;


import java.util.List;
import java.util.Map;

public interface GenericDAO<T> {

	public Integer add(T entity);

	public T get(Integer id);

	public List<T> getAll();

	public void delete(T entity);

	public void update(T entity);

	public List<T> find(Finder criteria, Map<String, Object> params);

}
