package com.web;

import com.bean.*;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class JsonController {

    @Autowired
    private OrgDeptService orgDeptService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private UserService userService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private RoleService roleService;


    /**
     * 通过获取中中间表  deptid  ，再获取dept列表
     * @param oid
     * @return list集合
     */
    @RequestMapping("/resource/system/user/organizagetdept")
    @ResponseBody
    public List finddept(int oid){
        System.out.println(oid);
        List<OrgDeptKey> list = orgDeptService.finddeptidbyorgid(oid);
        if (list==null || list.isEmpty()){
            return null;
        }else{
            List<Dept> list1 = deptService.findalldeptbyid(list);
            return list1;
        }
    }


    /**
     * 检测输入得用户名是否重复
     * @param loginname  输入得用户名
     * @return
     */
    @RequestMapping(value = {"/resource/system/user/checkloginName"},produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String checkusername(String loginname){
        User user = userService.selectByLoginname(loginname);
        if (user == null){
            return "ok";
        }else {
            return "用户名重复，请重新输入";
        }
    }

    @RequestMapping(value = {"/resource/system/menu/checkmenuname"},produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String checkmenuname(String menuname){
        Menu menu = menuService.selectByMenuname(menuname);
        if (menu == null){
            return "ok";
        }else {
            return "菜单名不可用";
        }

    }


    @RequestMapping(value = {"/resource/system/menu/checkrolename"},produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String checkrolename(String name){
        Role role = roleService.selectByName(name);
        if (role == null){
            return "ok";
        }else {
            return "角色名不可用";
        }

    }

}
