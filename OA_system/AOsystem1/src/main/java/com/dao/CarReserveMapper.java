package com.dao;

import com.bean.CarReserve;

import java.util.Map;

import java.util.List;

public interface CarReserveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CarReserve record);

    int insertSelective(CarReserve record);

    CarReserve selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CarReserve record);

    int updateByPrimaryKey(CarReserve record);

    CarReserve findsingletask(Map map);

    public List check(String carid);

    int updatestate(Map map);
}