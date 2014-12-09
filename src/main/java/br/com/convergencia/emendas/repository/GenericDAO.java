package br.com.convergencia.emendas.repository;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.PersistenceUnit;

import org.hibernate.SessionFactory;


@SuppressWarnings("unchecked")
public class GenericDAO<T> {

	@PersistenceUnit
	private SessionFactory session;

	public T getById(Integer id) {
		return (T) session.getCurrentSession().get(getTypeClass(), id);
	}

	public void save(T entity) {
		session.getCurrentSession().save(entity);
	}

	public void update(T entity) {
		session.getCurrentSession().update(entity);
	}

	public void delete(T entity) {
		session.getCurrentSession().delete(entity);
	}
	
	public List<T> findAll() {
		return session.getCurrentSession().createQuery("FROM" + getTypeClass().getName()).list();
	}

	private Class<?> getTypeClass() {
		Class<?> clazz = (Class<?>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
		return clazz;
	}
}
