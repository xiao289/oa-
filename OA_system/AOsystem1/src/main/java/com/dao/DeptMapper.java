package com.dao;

import com.bean.Dept;
import com.bean.OrgDeptKey;

import java.util.List;

import java.util.List;

public interface DeptMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    List<Dept> findalldeptbyid(List<OrgDeptKey> ids);

    List<Dept> findAll();

    Dept selectbyid(Integer id);
}