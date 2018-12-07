package com.service.impl;

import com.bean.Leavex;
import com.bean.User;
import com.dao.LeavexMapper;
import com.dao.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.*;
import org.activiti.engine.*;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import com.service.LeavexService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LeavexServiceImpl implements LeavexService {

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

    @Autowired
    private TripService tripService ;
    @Autowired
    private CarReserveService carReserveService;
    @Autowired
    private CachetService cachetService;
    @Autowired
    private BooksService booksService;
   @Autowired
   private VcardService vcardService;
   @Autowired
   private IncomeService incomeService;

    @Autowired
    private UserMapper userMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return leavexMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Leavex record) {
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Leavex record) {
        //1、启动部署（创建部署）
        List<Deployment> list=repositoryService.createDeploymentQuery().list();
        int k=1;
        for (Deployment deployment : list) {
            if("请假申请".equals(deployment.getName())){
                k=2;
            }
        }
        if(k==1){
            repositoryService.createDeployment()
                    .addClasspathResource("/activeti/leavex.bpmn")
                    .addClasspathResource("/activeti/leavex.png")
                    .name("请假申请")
                    .deploy();
        }
        String business="leavex"+record.getId();
        //2、开启流程
        Map map=new HashMap();
        map.put("busiid",business);
        User user=userMapper.selectByPrimaryKey(record.getUserid());
        map.put("username",user.getName());
        ProcessInstance reserve=runtimeService.startProcessInstanceByKey("leavex",business,map);
        //查询流程实例的id查询任务对象
        Task task=taskService.createTaskQuery().processInstanceId(reserve.getId()).singleResult();
        int k1=record.getNumber();

        int ad;
        if(k1<=2){
            ad=2;
        }else if(k1>=3&&k1<=5){
            ad=3;
        }else {
            ad=4;
        }
        Map map1=new HashMap();
        User admin1=userMapper.selectByPrimaryKey(ad);
        map1.put("admin",admin1.getName());
        map1.put("day",k1);
        //3、提交当前的task
        taskService.complete(task.getId(),map1);
        record.setAdminid(ad);
        record.setTaskid(Integer.parseInt(task.getId()));
        record.setTypeall(1);
        record.setState(0);
        int i=leavexMapper.insertSelective(record);
        return i;
    }

    @Override
    public Leavex selectByPrimaryKey(Integer id) {
        return leavexMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Leavex record) {
        record.setState(1);
        return leavexMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Leavex record) {
        return leavexMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageInfo selectall(String starttime, String endtime, Integer typeall, int pageindex, int size,int[] ids,Integer userid) {
        Map map=new HashMap();

        map.put("starttime",starttime);
        map.put("endtime",endtime);
        map.put("typeall",typeall);
        map.put("ids",ids);
        map.put("userid",userid);

        PageHelper.startPage(pageindex,size);
        List list= leavexMapper.selectall(map);
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
                leavexMapper.deleteByPrimaryKey(id);
            }
            tx.commit(status);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updatestate(Integer id,int state) {

        Map map=new HashMap();
        map.put("id",id);
        map.put("state",state);
        return leavexMapper.updatestate(map);
    }

    @Override
    public Leavex findShenQing(Integer id, Integer type, Integer userid) {

        Map map = new HashMap();
        map.put("id",id);
        map.put("type",type);
        map.put("userid",userid);

        return leavexMapper.findShenQing(map);
    }

    @Override
    public Leavex findbyleaveid(int lid) {
        return leavexMapper.findbyleaveid(lid);
    }

    @Override
    public List findsingletask(Integer userid,Integer type, Integer taskid) {

        Map map = new HashMap();
        map.put("userid",userid);
        map.put("type",type);
        map.put("taskid",taskid);
        return leavexMapper.findsingletask(map);
    }

    @Override
    public void serviceState(Integer typeall,Integer leaveid,Integer state) {
        if(typeall == 1){
            String  business="leavex."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("leavex",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                leavexService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                leavexService.updatestate(leaveid,2);
            }
        }

        if (typeall ==2 ){
            String  business="trip."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("trip",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                tripService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                tripService.updatestate(leaveid,2);
            }
        }

        if (typeall == 3){

            String  business="carReserve."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("carReserve",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                carReserveService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                carReserveService.updatestate(leaveid,2);
            }
        }

        if (typeall ==4) {

            String  business="cachet."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("cachet",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                cachetService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                cachetService.updatestate(leaveid,2);
            }
        }

        if (typeall == 5){

            String  business="book_reserve."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("book_reserve",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                booksService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                booksService.updatestate(leaveid,2);
            }
        }

        if (typeall == 6){

            String  business="vcard."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("vcard",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                vcardService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                vcardService.updatestate(leaveid,2);
            }
        }

        if (typeall == 7){

            String  business="income."+leaveid;
            Map map=new HashMap();
            map.put("busid",business);
            ProcessInstance instance=
                    runtimeService.startProcessInstanceByKey("income",business,map);
            //查询流程实例的id查询任务对象
            Task task=
                    taskService.createTaskQuery()
                            .processInstanceId(instance.getId()).singleResult();
            //完成个人任务
            taskService.complete(task.getId());
            if(state == 3){
                incomeService.updatestate(leaveid,3);
            }
            //3.判断任务是否执行完毕
            //查询流程实例对象
            ProcessInstance pro=
                    runtimeService.createProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId())
                            .singleResult();
            if(pro==null){//任务完成
                //修改请假条状态
                incomeService.updatestate(leaveid,2);
            }
        }
    }

}
