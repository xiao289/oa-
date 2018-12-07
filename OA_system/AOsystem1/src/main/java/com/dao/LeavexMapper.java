package com.dao;

import com.bean.Leavex;

import java.util.List;
import java.util.Map;

public interface LeavexMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Leavex record);

    int insertSelective(Leavex record);

    Leavex selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Leavex record);

    int updateByPrimaryKey(Leavex record);

    //查找全部
    List<Leavex> selectall(Map map);
    int updatestate(Map map);

    Leavex findShenQing(Map map);

    Leavex findbyleaveid(int lid);

    List findsingletask(Map map);
}