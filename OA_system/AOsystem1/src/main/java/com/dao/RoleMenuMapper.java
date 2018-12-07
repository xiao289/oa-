package com.dao;

import com.bean.RoleMenuKey;

import java.util.List;
import java.util.Map;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(RoleMenuKey key);

    int insert(RoleMenuKey record);

    int insertSelective(RoleMenuKey record);

    List<RoleMenuKey> getrolemenubyid(int roleid);

    int insertarray(Map map);

    int deleteByPrimaryKey1(int roleid);
}