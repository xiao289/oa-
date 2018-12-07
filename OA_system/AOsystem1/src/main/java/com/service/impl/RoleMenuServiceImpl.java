package com.service.impl;

import com.bean.RoleMenuKey;
import com.dao.RoleMenuMapper;
import com.service.RoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {
    @Autowired
    private RoleMenuMapper roleMenuMapper;
    @Override
    public int deleteByPrimaryKey(RoleMenuKey key) {
        return 0;
    }

    @Override
    public int insert(RoleMenuKey record) {
        return 0;
    }

    @Override
    public int insertSelective(RoleMenuKey record) {
        return 0;
    }

    @Override
    public List<RoleMenuKey> getrolemenubyid(int roleid) {
        return roleMenuMapper.getrolemenubyid(roleid);
    }

    @Override
    public int insertarray(int roleid, int[] idss) {
        Map map = new HashMap();
        map.put("ids",idss);
        map.put("roleid",roleid);
        return roleMenuMapper.insertarray(map);
    }

    @Override
    public int deleteByPrimaryKey1(int roleid) {
        return roleMenuMapper.deleteByPrimaryKey1(roleid);
    }
}
