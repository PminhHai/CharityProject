package com.fx21044.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fx21044.model.Role;

@Repository
public class RoleDaoImpl implements RoleDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	//Lấy danh sách role
	@Override
	public List<Role> getRoles() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Role> theQuery = session.createQuery("from Role", Role.class);
		
		List<Role> roles = theQuery.getResultList();
		
		return roles;
	}
	
	//Tìm role bằng id
	@Override
	public Role getRoleByID(int id) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		Role theRole = new Role();
		
		try {
			theRole = session.get(Role.class, id);
		} finally {
			session.close();
		}
		
		return theRole;
	}

}
