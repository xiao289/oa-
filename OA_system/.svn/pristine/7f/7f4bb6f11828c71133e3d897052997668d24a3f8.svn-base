
package com.service.impl;

import com.bean.Car;
import com.bean.CarReserve;
import com.dao.CarMapper;
import com.dao.CarReserveMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;
    @Autowired
    private CarReserveMapper carReserveMapper;

    @Override
    @Transactional
    public int deleteByPrimaryKey(Integer id) {
        return carMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Car record) {
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Car record) {
        return carMapper.insertSelective(record);
    }

    @Override
    @Transactional
    public Car selectByPrimaryKey(Integer id) {
        return carMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int updateByPrimaryKeySelective(Car record) {
        return carMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Car record) {
        return 0;
    }

    @Override
    public PageInfo getall(int pageindex, int size) {
        Map map=new HashMap();
        /*map.put("pageindex",pageindex);
        map.put("size",size);*/
        PageHelper.startPage(pageindex,size);
        List list=carMapper.getall(map);
        PageInfo pa=new PageInfo(list);
        return pa;
    }

    @Override
    public List<Car> getall2(int[] ids) {
        List list=carMapper.getall2(ids);
        return list;
    }

    @Override
    public List<Car> findcar(String carid) {
        Map map=new HashMap();
        map.put("carid",carid);
        return carMapper.findcar(map);
    }
    @Override
    public List findcar2(String carid) {
        Map map=new HashMap();
        map.put("carid",carid);
        return carMapper.findcar(map);
    }

    @Override
    @Transactional
    public int deleteall(int[] ids) {
        return carMapper.deleteall(ids);
    }

    @Override
    public CarReserve findsingletask(Integer userid, Integer taskid) {
        Map map=new HashMap();
        map.put("userid",userid);
        map.put("taskid",taskid);
        return carReserveMapper.findsingletask(map);
    }

}