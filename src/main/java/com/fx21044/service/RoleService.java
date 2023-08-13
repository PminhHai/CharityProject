package com.fx21044.service;

import java.util.List;

import com.fx21044.model.Role;

public interface RoleService {
	public List<Role> getRoles();
	
	public Role getRoleByID(int id);
}
