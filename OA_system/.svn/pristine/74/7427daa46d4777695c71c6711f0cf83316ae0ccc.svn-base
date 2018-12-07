package com.service.impl;

import com.bean.Role;
import com.bean.RoleMenuKey;
import com.bean.User;
import com.dao.RoleMapper;
import com.dao.RoleMenuMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.RoleService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleMenuMapper roleMenuMapper;
    @Autowired
    private UserService userService;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        //查找角色下的用户
        List<User> list = userService.querybyroleid12(id);
        int k = 0;
        //如果没有角色
        if (list.isEmpty()){
            //删除角色
            k = roleMapper.deleteByPrimaryKey(id);
            //删除中间表 如果中间表有值
            List<RoleMenuKey> keys = roleMenuMapper.getrolemenubyid(id);
            if (! keys.isEmpty()){
                roleMenuMapper.deleteByPrimaryKey1(id);
            }
        }
        return k;
    }

    @Override
    public int insert(Role record) {
        return 0;
    }

    @Override
    public int insertSelective(Role record, int[] ids) {
        int i = roleMapper.insertSelective(record);
        int id = record.getId();
        Map map = new HashMap();
        map.put("roleid",id);
        map.put("ids",ids);
        roleMenuMapper.insertarray(map);
        return i;
    }

    @Override
    public Role selectByPrimaryKey(Integer id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Role record) {
        return roleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Role record) {
        return 0;
    }

    @Override
    public List<Role> findallrole() {
        return roleMapper.findallrole();
    }

    @Override
    public PageInfo getallrole(int pagesize, int size, String name) {
        PageHelper.startPage(pagesize,size);
        Map map = new HashMap();
        map.put("name",name);
        List<Role> list = roleMapper.getallrole(map);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public Role selectByName(String name) {
        Map map = new HashMap();
        map.put("name",name);
        return roleMapper.selectByName(map);
    }

    @Override
    public List<Role> findrolebyarray(int[] ids) {
        Map map = new HashMap();
        map.put("ids",ids);
        return roleMapper.findrolebyarray(map);
    }


}
