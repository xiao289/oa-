package com.service;

import com.bean.Task;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface TaskService {
    int deleteByPrimaryKey(Integer id);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);

    //查询全部+模糊查
    public PageInfo findTaskList(String starttime, String subtime, Integer typeall, int pageindex, int size, int[] ids, Integer userid);

    //    批量删除
    int deletebyids(int[] ids);

    //修改请假条状态
    int updateState(Map map);

    Task selectLeaveTask(Integer userid);

      Task findsingletask(Integer userid, Integer typeall, Integer taskid);
    Task  findtask1(Integer type,Integer userid);
}