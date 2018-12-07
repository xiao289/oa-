package com.service.impl;

import com.bean.Traffic;
import com.bean.Trip;
import com.dao.TrafficMapper;
import com.dao.TripMapper;
import com.service.TrafficService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TrafficServiceImpl implements TrafficService {

    @Autowired
    private TrafficMapper trafficMapper;
    @Autowired
    private  TripMapper tripMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Traffic record) {
        return 0;
    }

    @Override
    public int insertSelective(Traffic record) {
        return 0;
    }

    @Override
    public Traffic selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Traffic record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Traffic record) {
        return 0;
    }

    @Override
    public List getall() {
        return trafficMapper.getall();
    }

    @Override
    public Trip findsingletask(Integer userid, Integer taskid) {
        Map map = new HashMap();
        map.put("userid",userid);
        map.put("taskid",taskid);
        return tripMapper.findsingletask(map);
    }
}
