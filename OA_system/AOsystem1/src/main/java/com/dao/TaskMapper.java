package com.dao;

import com.bean.Task;

import java.util.List;
import java.util.Map;

public interface TaskMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);

    //查询用户的请假条
    List<Task> findTaskList(Map map);
    //修改请假条状态
    int updateState(Map map);
    int deletebyids(int[] ids);

    Task selectLeaveTask(Integer userid);

    Task  findtask1(Map map);

    Task findsingletask(Map map);
}