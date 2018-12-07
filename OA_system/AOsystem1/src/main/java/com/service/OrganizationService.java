package com.service;

import com.bean.Income;
import com.bean.Organization;

import java.util.List;

public interface OrganizationService {
    int deleteByPrimaryKey(Integer id);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);

    List<Organization> findallorganization();

    Income findsingletask(Integer userid, Integer taskid);
}
