package com.service;

import com.bean.Cachet;

public interface CachetService {
    int deleteByPrimaryKey(Integer id);

    int insert(Cachet record);

    int insertSelective(Cachet record);

    Cachet selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cachet record);

    int updateByPrimaryKey(Cachet record);

    Cachet findsingletask(Integer userid, Integer taskid);

    //    修改状态
    int updatestate(Integer id,int state);
}
