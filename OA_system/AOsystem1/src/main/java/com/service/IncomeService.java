package com.service;

import com.bean.Income;

public interface IncomeService {
    int deleteByPrimaryKey(Integer id);

    int insert(Income record);

    int insertSelective(Income record);

    Income selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Income record);

    int updateByPrimaryKey(Income record);

    //    修改状态
    int updatestate(Integer id,int state);
}