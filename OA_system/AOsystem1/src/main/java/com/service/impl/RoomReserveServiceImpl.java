package com.service.impl;

import com.bean.RoomReserve;
import com.bean.User;
import com.dao.RoomReserveMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.RoomReserveService;
import com.service.UserService;
import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class RoomReserveServiceImpl implements RoomReserveService {

    @Autowired
    private RoomReserveMapper roomReserveMapper;
    @Autowired
    private UserService userService;
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





    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int deletemany(int[] reserveids) {
        return roomReserveMapper.deletemany(reserveids);
    }

    @Override
    public List querynany(int[] reserveids) {
        List<RoomReserve> querymany = roomReserveMapper.querymany(reserveids);
        for (RoomReserve reserve : querymany) {
            User user = userService.selectByPrimaryKey(reserve.getAdminid());
            reserve.setAdmin(user);
        }
        return querymany;
    }

    @Override
    public PageInfo queryall(int index, int size, String roomname,
                             String yuname, int type,String starttime,String endtime) {

        PageHelper.startPage(index,size);
        Map map=new HashMap();
        map.put("roomname",roomname);
        map.put("yuname",yuname);
        map.put("type",type);
        map.put("starttime",starttime);
        map.put("endtime",endtime);
        List<RoomReserve> queryall = roomReserveMapper.queryall(map);
        for (RoomReserve reserve : queryall) {
            User user = userService.selectByPrimaryKey(reserve.getAdminid());
            reserve.setAdmin(user);
        }
        PageInfo pageInfo =new PageInfo(queryall);
        return pageInfo;
    }

    @Override
    public int insert(RoomReserve record) {
        return roomReserveMapper.insert(record);
    }

    @Override
    public List queryallbytime(String starttime, String endtime) {
        Map map=new HashMap();
        map.put("starttime",starttime);
        map.put("endtime",endtime);
        map.put("state",1);
        return roomReserveMapper.queryall(map);
    }

    @Override
    @Transactional
    public int addall(RoomReserve roomReserve, int[] roomids,
                      String starttime,String endtime,User user) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //判断部署是否存在，存在则不添加新的
        List<Deployment> list1 = repositoryService.createDeploymentQuery().list();
        int k=1;
        for (Deployment deployment : list1) {
            if("会议室预定".equals(deployment.getName())){
                k=2;
            }
        }
        if(k==1){
            repositoryService.createDeployment()
                    .addClasspathResource("/activeti/roomact.bpmn")
                    .addClasspathResource("/activeti/roomact.png").name("会议室预定")
                    .deploy();
        }
        try {
            Date start = simpleDateFormat.parse(starttime);
            Date end = simpleDateFormat.parse(endtime);
            roomReserve.setStarttime(start);
            roomReserve.setEndtime(end);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List list=new ArrayList();
        Map map=new HashMap();
        Map map1=new HashMap();
        User admin1 = userService.selectByPrimaryKey(roomReserve.getAdminid());
        for (int roomid : roomids) {
            roomReserve.setRoomid(roomid);
            roomReserve.setState(1);
            String business="room_reserve"+roomReserve.getUserid()+roomid+starttime;
            map.put("busid",business);
            map.put("user",user.getName());
            ProcessInstance reserve = runtimeService.startProcessInstanceByKey("room_reserve", business, map);
            //查询流程实例的id查询任务对象
            Task task = taskService.createTaskQuery().processInstanceId(reserve.getId()).singleResult();
            //完成个人任务
            roomReserve.setTaskid(Integer.parseInt(task.getId()));
            map1.put("admin",admin1.getName());
            taskService.complete(task.getId(),map1);
            list.add(roomReserve);
        }
        int i= roomReserveMapper.addall(list);
        return i;
    }

    @Override
    public List<User> queryuserbyrole() {
        List<User> users = userService.querybyroleid(2);
        return users;
    }

    @Override
    public List piliangyanzheng(int[] roomids) {
        return roomReserveMapper.piliangyanzheng(roomids);
    }

    @Override
    public List yanzhengroom(int roomid) {
        return roomReserveMapper.yanzhengroom(roomid);
    }

    @Override
    public int insertSelective(RoomReserve record) {
        return 0;
    }

    @Override
    public RoomReserve selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(RoomReserve record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(RoomReserve record) {
        return 0;
    }


}
