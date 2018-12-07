package com.service.impl;

import com.bean.Cachet;
import com.bean.User;
import com.dao.CachetMapper;
import com.dao.UserMapper;
import com.service.CachetService;
import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CachetServiceImpl implements CachetService {
    @Autowired
    private CachetMapper cachetMapper;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private UserMapper userMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Cachet record) {
        //1、启动图书预定的流程
        //判断部署是否存在，存在则不添加新的
        List<Deployment> list1 = repositoryService.createDeploymentQuery().list();
        int k=1;
        for (Deployment deployment : list1) {
            if("用章申请".equals(deployment.getName())){
                k=2;
            }
        }
        if(k==1){
            repositoryService.createDeployment()
                    .addClasspathResource("/activeti/cachetact.bpmn")
                    .addClasspathResource("/activeti/cachetact.png").name("用章申请")
                    .deploy();
        }
        int i = cachetMapper.insert(record);
        String business="cachet"+record.getId();
        Map map=new HashMap();
        map.put("busid",business);
        User user = userMapper.selectByPrimaryKey(record.getUserid());
        map.put("user",user.getName());
        ProcessInstance reserve = runtimeService.startProcessInstanceByKey("cachet", business, map);
        //查询流程实例的id查询任务对象
        Task task = taskService.createTaskQuery().processInstanceId(reserve.getId()).singleResult();
        //完成个人任务
        record.setTaskid(Integer.parseInt(task.getId()));
        cachetMapper.updateByPrimaryKeySelective(record);
        Map map1=new HashMap();
        User admin1 = userMapper.selectByPrimaryKey(record.getAdminid());
        map1.put("admin",admin1.getName());
        taskService.complete(task.getId(),map1);
        return i;
    }

    @Override
    public int insertSelective(Cachet record) {
        return cachetMapper.insertSelective(record);
    }

    @Override
    public Cachet selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Cachet record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Cachet record) {
        return 0;
    }

    @Override
    public Cachet findsingletask(Integer userid, Integer taskid) {
        Map map=new HashMap();
        map.put("userid",userid);
        map.put("taskid",taskid);

        return  cachetMapper.findsingletask(map);
    }


    @Override
    public int updatestate(Integer id,int state) {

        Map map=new HashMap();
        map.put("id",id);
        map.put("state",state);
        return cachetMapper.updatestate(map);
    }
}
