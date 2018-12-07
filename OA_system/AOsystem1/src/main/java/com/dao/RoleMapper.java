package com.dao;

import com.bean.Role;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> findallrole();

    List<Role> getallrole(Map map);

    Role selectByName(Map map);

    List<Role> findrolebyarray(Map map);
}