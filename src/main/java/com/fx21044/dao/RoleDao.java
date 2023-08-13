package com.fx21044.dao;

import java.util.List;

import com.fx21044.model.Role;

public interface RoleDao{
	public List<Role> getRoles();
	
	public Role getRoleByID(int id);
}
