package com.service;

import com.bean.Leavex;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;

import java.util.List;

public interface ActivitiService {
    int qingjia(int leaveid,String username);
    //查询个人任务
    List<Task> gettasks(String username);
    //获得流程图中的form_key
    String getformkey(String tid);
    //通过任务id，查询请假单
    Leavex findleavebillbytaskid(String tid);
    //获得连线信息
    List<String> getnames(String tid);
    void chuli(String taskid,String result,int id,String username);
    //获得批注信息
    List<Comment> getcomments(String tid);

    Leavex findbyleaveid(int lid);
}
