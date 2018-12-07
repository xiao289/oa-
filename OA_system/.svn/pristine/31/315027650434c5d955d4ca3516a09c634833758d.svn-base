package com.service.impl;

import com.bean.Dept;
import com.bean.OrgDeptKey;
import com.dao.DeptMapper;
import com.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Dept record) {
        return 0;
    }

    @Override
    public int insertSelective(Dept record) {
        return 0;
    }

    @Override
    public Dept selectByPrimaryKey(Integer id) {
        return deptMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Dept record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Dept record) {
        return 0;
    }

    @Override
    public List<Dept> findAll() {
        return deptMapper.findAll();
    }

    @Override
    public List<Dept> findalldeptbyid(List<OrgDeptKey> ids) {
        return deptMapper.findalldeptbyid(ids);
    }

    @Override
    public Dept selectbyid(Integer id) {
        return deptMapper.selectbyid(id);
    }
}
