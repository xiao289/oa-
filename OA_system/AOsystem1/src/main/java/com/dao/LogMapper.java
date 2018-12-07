package com.dao;

import com.bean.Log;

import java.util.List;
import java.util.Map;

public interface LogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    List<Log> findalllog(Map map);

    List<Log> findalllogbyarray(Map single);
}