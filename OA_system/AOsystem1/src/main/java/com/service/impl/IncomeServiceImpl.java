package com.service.impl;

import com.bean.Income;
import com.bean.User;
import com.dao.IncomeMapper;
import com.dao.UserMapper;
import com.service.IncomeService;
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
public class IncomeServiceImpl implements IncomeService {

    @Autowired
    private IncomeMapper incomeMapper;
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
    public int insert(Income record) {
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Income record) {

        //流程部署
        List<Deployment> list=repositoryService.createDeploymentQuery().list();
        int k=1;
        for (Deployment deployment : list) {
            if("证明流程".equals(deployment.getName())){
                k=2;
            }
        }
        if(k==1){
            repositoryService.createDeployment()
                    .addClasspathResource("/activeti/income.bpmn")
                    .addClasspathResource("/activeti/income.png")
                    .name("证明流程")
                    .deploy();
        }
        String business="income"+record.getId();


        //开启流程
        Map map=new HashMap();
        map.put("busiid",business);
        User user=userMapper.selectByPrimaryKey(record.getUserid());
        map.put("username",user.getName());
        ProcessInstance reserve=runtimeService.startProcessInstanceByKey("income",business,map);
        //查询流程实例id查询任务对象
        Task task=taskService.createTaskQuery().processInstanceId(reserve.getId()).singleResult();
        Map map1=new HashMap();
        User admin1=userMapper.selectByPrimaryKey(record.getAdminid());
        map1.put("admin",admin1.getName());


        //提交当前任务
        taskService.complete(task.getId(),map1);
        record.setTaskid(Integer.parseInt(task.getId()));
        record.setTypeall(7);
        record.setState(0);
        int i=incomeMapper.insertSelective(record);
        return i;
    }

    @Override
    public Income selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Income record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Income record) {
        return 0;
    }


    @Override
    public int updatestate(Integer id,int state) {

        Map map=new HashMap();
        map.put("id",id);
        map.put("state",state);
        return incomeMapper.updatestate(map);
    }
}
