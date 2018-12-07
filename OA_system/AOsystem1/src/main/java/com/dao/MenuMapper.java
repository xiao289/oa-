package com.dao;

import com.bean.Menu;

import java.util.List;
import java.util.Map;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    List<Menu> findmenu(Map map);

    Menu findupmenuname(int pid);

    List<Menu> findupmenu(int pid);

    List<Menu> findmenubyarray(Map map);

    int deletebtints(Map map);

    Menu selectByMenuname(String name);
    //根据角色id查询菜单集合
    public List<Menu> findbyroleid(int id);
}