package com.web;

import com.bean.Dept;
import com.bean.Leavex;
import com.bean.Role;
import com.bean.User;
import com.dao.UserMapper;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class RenshiController {
    @Autowired
    private UserService userService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private TrafficService trafficService;
    @Autowired
    private LeaveTypeService leaveTypeService;



    //请假申请页面
    @RequestMapping("/resource/renshi/demo1/getuser")
    public String finduser(ModelMap map, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("loginname");
        Dept dept=deptService.selectByPrimaryKey(user.getDeptid());
        List list1=leaveTypeService.getall();
        List admin = userService.querybyroleid1();
        map.put("dlist",dept);
        map.put("leavelist",list1);
        map.put("admins",admin);
        return "/resource/renshi/demo1/list";
    }



    //出差申请页面
    @RequestMapping("/resource/renshi/demo1/getuser2")
    public String finduser2(ModelMap map,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("loginname");
        Dept dept=deptService.selectByPrimaryKey(user.getDeptid());
        List list1=trafficService.getall();
        List<User> admin = userService.querybyroleid1();
        map.put("admins",admin);
        map.put("dlist",dept);
        map.put("trafficlist",list1);
        return "/resource/renshi/demo2/list";
    }

    //收入证明页面
    @RequestMapping("/resource/renshi/demo1/getuser3")
    public String finduser3(ModelMap map, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("loginname");
        Dept dept=deptService.selectByPrimaryKey(user.getDeptid());
        Role role=roleService.selectByPrimaryKey(user.getRoleid());
        List<User> admin = userService.querybyroleid1();
        map.put("admins",admin);
        map.put("dlist",dept);
        map.put("rlist",role);
        return "/resource/renshi/demo3/list";
    }
    


}
