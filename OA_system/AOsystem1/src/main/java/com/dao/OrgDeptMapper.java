package com.dao;

import com.bean.OrgDeptKey;

import java.util.List;

public interface OrgDeptMapper {
    int deleteByPrimaryKey(OrgDeptKey key);

    int insert(OrgDeptKey record);

    int insertSelective(OrgDeptKey record);

    List<OrgDeptKey> finddeptidbyorgid(int oid);
}