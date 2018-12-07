package com.dao;

import com.bean.LeaveType;

import java.util.List;

public interface LeaveTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LeaveType record);

    int insertSelective(LeaveType record);

    LeaveType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LeaveType record);

    int updateByPrimaryKey(LeaveType record);
    //getall
    public List getall();
}
