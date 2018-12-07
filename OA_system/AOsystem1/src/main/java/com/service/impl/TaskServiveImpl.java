package com.service.impl;

import com.bean.Task;
import com.dao.TaskMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TaskServiveImpl implements TaskService {
    @Autowired
    private TaskMapper taskMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Task record) {
        return 0;
    }

    @Override
    public int insertSelective(Task record) {
        return 0;
    }

    @Override
    public Task selectByPrimaryKey(Integer id) {
        return taskMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Task record) {
        return taskMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Task record) {
        return 0;
    }

    @Override
    public PageInfo findTaskList(String starttime, String subtime, Integer typeall, int pageindex, int size, int[] ids, Integer userid) {
        Map map=new HashMap();

        map.put("starttime",starttime);
        map.put("subtime",subtime);
        map.put("typeall",typeall);
        map.put("ids",ids);
        map.put("userid",userid);

        PageHelper.startPage(pageindex,size);
        List list= taskMapper.findTaskList(map);
        PageInfo pi=new PageInfo(list);
        return pi;
    }

    @Autowired
    private DataSourceTransactionManager tx;//事务
    @Override
    public int deletebyids(int[] ids) {
        DefaultTransactionDefinition ddf=new DefaultTransactionDefinition();
        TransactionStatus status=tx.getTransaction(ddf);


        try {
            for (int id : ids) {
               taskMapper.deleteByPrimaryKey(id);
            }
            tx.commit(status);
        } catch (Exception e) {
            e.printStackTrace();
        }

            return 0;
    }



    @Override
    public int updateState(Map map) {
        return 0;
    }

    @Override
    public Task selectLeaveTask(Integer userid) {
        return taskMapper.selectLeaveTask(userid);
    }

    @Override
    public Task findsingletask(Integer userid, Integer typeall, Integer taskid) {
        Map map=new HashMap();

        map.put("userid",userid);
        map.put("typeall",typeall);
        map.put("taskid",taskid);
        return taskMapper.findsingletask(map);
    }

    @Override
    public Task findtask1(Integer type, Integer userid) {

        Map map=new HashMap();

        map.put("type",type);
        map.put("userid",userid);
        return taskMapper.findtask1(map);
    }
}
