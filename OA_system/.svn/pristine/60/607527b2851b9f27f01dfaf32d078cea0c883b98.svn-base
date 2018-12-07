package com.dao;

import com.bean.Announce;

import java.util.List;
import java.util.Map;

public interface AnnounceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Announce record);

    int insertSelective(Announce record);

    Announce selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Announce record);

    int updateByPrimaryKey(Announce record);

    //查找全部
    List<Announce> selectall(Map map);

    //删除全部
    int deletein(int[] single);

    //根据id查找
    Announce selectbyid(int id);

    List<Announce> findAll(Map map);
}