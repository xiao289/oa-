package com.service.impl;

import com.bean.LeaveType;
import com.dao.LeaveTypeMapper;
import com.service.LeaveTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveTypeServiceImpl implements LeaveTypeService {

    @Autowired
    private LeaveTypeMapper leaveTypeMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(LeaveType record) {
        return 0;
    }

    @Override
    public int insertSelective(LeaveType record) {

        return 0;
    }

    @Override
    public LeaveType selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(LeaveType record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(LeaveType record) {
        return 0;
    }

    @Override
    public List getall() {
        return leaveTypeMapper.getall();
    }
}
