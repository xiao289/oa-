package com.service.impl;

import com.bean.Income;
import com.bean.Organization;
import com.dao.IncomeMapper;
import com.dao.OrganizationMapper;
import com.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private IncomeMapper incomeMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Organization record) {
        return 0;
    }

    @Override
    public int insertSelective(Organization record) {
        return 0;
    }

    @Override
    public Organization selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Organization record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Organization record) {
        return 0;
    }

    @Override
    public List<Organization> findallorganization() {
        return organizationMapper.findallorganization();
    }

    @Override
    public Income findsingletask(Integer userid, Integer taskid) {
        Map map = new HashMap();
        map.put("userid",userid);
        return incomeMapper.findsingletask(map);
    }
}
