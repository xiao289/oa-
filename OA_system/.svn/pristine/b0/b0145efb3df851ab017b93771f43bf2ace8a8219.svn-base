package com.dao;

import com.bean.Car;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface CarMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    //查询全部车辆
    public List<Car> getall(Map map);
    //批量
    public List<Car> getall2(int[] ids);
    //check
    public List<Car> findcar(Map map);
    //check2
    public List findcar2(Map map);
    //批量删除
    public int deleteall(int[] ids);
}