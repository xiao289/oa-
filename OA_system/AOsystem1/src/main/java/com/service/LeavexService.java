package com.service;

import com.bean.Leavex;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface LeavexService {
    int deleteByPrimaryKey(Integer id);

    int insert(Leavex record);

    int insertSelective(Leavex record);

    Leavex selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Leavex record);

    int updateByPrimaryKey(Leavex record);

    //查询全部+模糊查
    public PageInfo selectall(String starttime, String endtime,Integer typeall, int pageindex, int size,int[] ids,Integer userid);

//    批量删除
    int deletebyids(int[] ids);

//    修改状态
     int updatestate(Integer id,int state);

    Leavex findShenQing(Integer id, Integer type, Integer userid);

    Leavex findbyleaveid(int lid);

    List findsingletask(Integer userid, Integer type, Integer taskid);

    void serviceState(Integer typeall,Integer id,Integer state);
}