package com.service;

import com.bean.Announce;
import com.github.pagehelper.PageInfo;

public interface AnnounceService {
    int deleteByPrimaryKey(Integer id);

    int insert(Announce record);

    int insertSelective(Announce record);

    Announce selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Announce record);

    int updateByPrimaryKey(Announce record);

    //查询全部+模糊查
    public PageInfo selectall(String title, String starttime, String endtime, int pageindex,int[] ids,int size,Integer userid);

    //删除全部
    int deletein(int[] single);

    //根据id查询
    Announce selectbyid(Integer id);

    public PageInfo findAll(String title, String starttime, String endtime, int pageindex,int[] ids,int size,Integer userid);
}
