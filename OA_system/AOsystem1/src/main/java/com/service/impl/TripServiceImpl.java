package com.service.impl;

import com.bean.Trip;
import com.bean.User;
import com.dao.TripMapper;
import com.dao.UserMapper;
import com.service.TripService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TripServiceImpl implements TripService {

    @Autowired
    private TripMapper tripMapper;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private UserMapper userMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Trip record) {
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Trip record) {
        //1、启动部署（创建部署）
        List<Deployment> list=repositoryService.createDeploymentQuery().list();
        int k=1;
        for (Deployment deployment : list) {
            if("出差申请".equals(deployment.getName())){
                k=2;
            }
        }
        if(k==1){
            repositoryService.createDeployment()
                    .addClasspathResource("/activeti/trip.bpmn")
                    .addClasspathResource("/activeti/trip.png")
                    .name("出差申请")
                    .deploy();
        }

        String business="trip"+record.getId();
        //2、开启流程
        Map map=new HashMap();
        map.put("busiid",business);
        User user=userMapper.selectByPrimaryKey(record.getUserid());
        map.put("username",user.getName());
        ProcessInstance reserve=runtimeService.startProcessInstanceByKey("trip",business,map);
        //查询流程实例的id查询任务对象
        Task task=taskService.createTaskQuery().processInstanceId(reserve.getId()).singleResult();
        Map map1=new HashMap();
        User admin1=userMapper.selectByPrimaryKey(record.getAdminid());
        map1.put("admin",admin1.getName());
        //3、提交当前的task
        taskService.complete(task.getId(),map1);
        record.setTaskid(Integer.parseInt(task.getId()));
        record.setTypeall(2);
        record.setState(0);
        int i=tripMapper.insertSelective(record);
        return i;
    }

    @Override
    public Trip selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Trip record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Trip record) {
        return 0;
    }


    @Override
    public int updatestate(Integer id,int state) {

        Map map=new HashMap();
        map.put("id",id);
        map.put("state",state);
        return tripMapper.updatestate(map);
    }
}
