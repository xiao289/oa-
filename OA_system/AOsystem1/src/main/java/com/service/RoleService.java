package com.service;

import com.bean.Role;
import com.github.pagehelper.PageInfo;

import java.security.PrivateKey;
import java.util.List;

public interface RoleService {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record,int[] ids);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> findallrole();

    PageInfo getallrole(int pagesize, int size, String name);

    Role selectByName(String name);

    List<Role> findrolebyarray(int[] ids);
}
