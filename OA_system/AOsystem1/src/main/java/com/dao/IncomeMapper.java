package com.dao;

import com.bean.Income;

import java.util.Map;

public interface IncomeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Income record);

    int insertSelective(Income record);

    Income selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Income record);

    int updateByPrimaryKey(Income record);

    Income findsingletask(Map map);

    int updatestate(Map map);
}