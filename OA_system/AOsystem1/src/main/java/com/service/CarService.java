package com.service;

import com.bean.Car;
import com.bean.CarReserve;
import com.dao.CarReserveMapper;
import com.github.pagehelper.PageInfo;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;
import java.util.Map;

public interface CarService {
    int deleteByPrimaryKey(Integer id);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    //查询全部车辆
    public PageInfo getall(int pageindex,int size);
    //批量查询
    public List<Car> getall2(int[] ids);

    //check
    public List<Car> findcar(String carid);
    //check
    public List findcar2(String carid);

    //批量删除
    public int deleteall(int[] ids);

    CarReserve findsingletask(Integer userid, Integer taskid);
}