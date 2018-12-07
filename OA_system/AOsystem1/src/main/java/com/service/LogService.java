package com.service;

import com.bean.Log;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface LogService {
    int deleteByPrimaryKey(Integer id);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    PageInfo findalllog(int pagesize, int size, String usern, String shijian1,String shijian2);

    List<Log> findalllogbyarray(int[] single);
}
