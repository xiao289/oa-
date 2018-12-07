package com.service.impl;

import com.bean.Leavex;
import com.dao.LeavexMapper;
import com.service.ActivitiService;
import com.service.LeavexService;
import org.activiti.engine.*;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ActivitiServiceImpl implements ActivitiService {
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private LeavexMapper leavexMapper;
    @Autowired
    private LeavexService leavexService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private HistoryService historyService;


    @Override
    @Transactional  //如何将业务过程和流程定义进行关联
    public int qingjia(int leaveid, String username) {

        //1.修改请假单的状态
        leavexService.updatestate(leaveid,2);
        //2.启动流程实例时候，需要建立流程和业务之间的关系
        //使用business_key来保存业务的信息
        //business_key的组成方式: 流程定义的key+业务的id
        String  business="LeaveBill."+leaveid;
        Map map=new HashMap();
        map.put("busid",business);
        map.put("username",username);
        ProcessInstance instance=
                runtimeService.startProcessInstanceByKey("LeaveBill",business,map);
        //查询流程实例的id查询任务对象
        Task task=
                taskService.createTaskQuery()
                        .processInstanceId(instance.getId()).singleResult();
        //完成个人任务
        taskService.complete(task.getId());
        return 1;
    }

    @Override
    public List<Task> gettasks(String admin) {
        List list=
                taskService.createTaskQuery().taskAssignee(admin).list();

        return list;
    }

    @Override
    public String getformkey(String tid) {
        TaskFormData data=formService.getTaskFormData(tid);

        return  data.getFormKey();
    }

    @Override
    public Leavex findleavebillbytaskid(String tid) {
        //1.通过任务id查询任务对象
        Task task= taskService.createTaskQuery().taskId(tid).singleResult();
        //2.通过task得到流程实例的id
        String instanceid=task.getProcessInstanceId();
        //3.通过流程实例id查询流程实例对象
        ProcessInstance processInstance=
                runtimeService.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
        //4.通过流程实例的对象得到business_key
        String str= processInstance.getBusinessKey();
        //5.截取id
        String id=str.substring(str.indexOf(".")+1);
        //6.通过id查询请假单对象
        Leavex lb=leavexMapper.findbyleaveid(Integer.parseInt(id));
        return lb;
    }

    @Override
    public List<String> getnames(String tid) {
        List names=new ArrayList();
        //1.通过任务id查询任务对象
        Task task=taskService.createTaskQuery().taskId(tid).singleResult();
        //2.得到流程定义id
        String processdefinitionid= task.getProcessDefinitionId();
        //3.通过流程定义id得到流程图对象
        // repositoryService.createProcessDefinitionQuery().processDefinitionId("").singleResult();
        ProcessDefinitionEntity entity=(ProcessDefinitionEntity)
                repositoryService.getProcessDefinition(processdefinitionid);
        //4.得到当前任务正在活动的activiti_id
        String instanceid=task.getProcessInstanceId();//得到流程实例的id
        ProcessInstance instance=  //通过流程定义id查询流程实例
                runtimeService.createProcessInstanceQuery().processInstanceId(instanceid).singleResult();
        String act_id= instance.getActivityId();//得到正在获得的id
        //5.查找正在获得的act对象
        ActivityImpl activity= entity.findActivity(act_id);
       /* List<ActivityImpl> activity1=entity.getActivities();
        for (ActivityImpl activity2 : activity1) {
            System.out.println(activity2.getProperty("id"));
        }*/
        System.out.println(act_id+"//////"+entity+",,,,"+processdefinitionid+"..."+activity);
        List<PvmTransition> list=  activity.getOutgoingTransitions();
        if(list.size()>0){
            for (PvmTransition pvmTransition : list) {
                String name=(String) pvmTransition.getProperty("name");
                names.add(name);
            }
        }

        return names;
    }

    @Override
    public void chuli(String taskid, String rs, int id, String admin) {

        Task task=taskService.createTaskQuery().taskId(taskid).singleResult();


        Map map=new HashMap();
        map.put("rs",rs);
        //完成个人任务
        taskService.complete(taskid,map);
        //指定下一个任务的办理人---已经完成
        if(rs.equals("驳回")){
            //修改请假条状态
            leavexService.updatestate(id,3);
        }

        //3.判断任务是否执行完毕
        //查询流程实例对象
        ProcessInstance pro=
                runtimeService.createProcessInstanceQuery()
                        .processInstanceId(task.getProcessInstanceId())
                        .singleResult();
        if(pro==null){//任务完成
            //修改请假条状态
            leavexService.updatestate(id,2);
        }
    }

    @Override
    public List<Comment> getcomments(String tid) {
        List alllist=new ArrayList();
        //得到任务的流程实例id
        Task task=taskService.createTaskQuery().taskId(tid).singleResult();
        String instanceid= task.getProcessInstanceId();
        alllist=taskService.getProcessInstanceComments(instanceid);


        return alllist;
    }

    @Override
    public Leavex findbyleaveid(int lid) {
        return leavexMapper.findbyleaveid(lid);
    }
}
