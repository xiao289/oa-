package com.web;

import com.bean.Log;
import com.bean.Menu;
import com.github.pagehelper.PageInfo;
import com.service.LogService;
import com.service.MenuService;
import com.service.UserService;
import com.util.LogUtil;
import com.util.MenuExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;
    @Autowired
    private LogService logService;

    /**
     * 查询所有得menu菜单
     * @param menuname1
     * @param index
     * @param size
     * @param map
     * @return
     */
    @RequestMapping("/resource/system/menu/getallmenu")
    public String getmenu(String menuname1,
                          @RequestParam(value = "index",defaultValue = "1") int index,
                          @RequestParam(value = "size", defaultValue = "110") int size, ModelMap map){
        System.out.println(menuname1);
        PageInfo pageInfo = menuService.findmenu(index, size, menuname1);
        List<Menu> list = pageInfo.getList();
        ArrayList list1 = new ArrayList();

        for (Menu menu : list) {
            if (menu.getPid() == -1){
                ArrayList arrayList = new ArrayList();
                for (Menu menu1 : list) {
                    if (menu1.getPid() == menu.getId()){
                        arrayList.add(menu1);
                    }
                }
                menu.setLowmenu(arrayList);
                list1.add(menu);
            }
        }
        pageInfo.setList(list1);
        map.put("pi",pageInfo);
        map.put("menuname1",menuname1);
        return "/resource/system/menu/list";
    }

    /**
     * 查看menu信息
     * @param menuid
     * @param map
     * @return
     */
    @RequestMapping("/resource/system/menu/lookmenu")
    public String lookmenu(int menuid,ModelMap map){
        Menu menu = menuService.selectByPrimaryKey(menuid);
        Menu upmenu = new Menu();
        map.put("menu",menu);
        Integer pid = menu.getPid();
        if (pid != -1){
            upmenu = menuService.selectByPrimaryKey(pid);
        }else{
            upmenu.setMenuname("顶级菜单");
        }
        map.put("upmenu",upmenu);
        return "/resource/system/menu/look";
    }

    /**
     * 动态修改menu菜单得值
     * @param menu
     * @return
     */
    @RequestMapping("/resource/system/menu/edit1")
    public String editmenu(Menu menu, Log log){
        Log log1 = LogUtil.setterLog(log);
        //添加表单
        logService.insertSelective(log1);
        menuService.updateByPrimaryKeySelective(menu);
        return "redirect:/resource/system/menu/getallmenu";
    }

    /**
     * 修改前准备
     * @param menuid
     * @param map
     * @return
     */
    @RequestMapping("/resource/system/menu/editready")
    public String readyedit(int menuid, ModelMap map){
        Menu menu = menuService.selectByPrimaryKey(menuid);
        map.put("menu",menu);
        List<Menu> upmenu = menuService.findupmenu(-1);
        map.put("up",upmenu);
        return "/resource/system/menu/edit";
    }

    /**
     * 导出excel
     * @param single
     * @param response
     */
    @RequestMapping("/resource/system/menu/daochu")
    public void daochu(int[] single, HttpServletResponse response, Log log){
        Log log1 = LogUtil.setterLog(log, "无", "导出menu的excel");
        //插入进log表单
        logService.insertSelective(log1);

        List<Menu> list = menuService.findmenubyarray(single);
        List<Menu> list1 = menuService.findupmenu(-1);
        MenuExcelUtil.headers = new String[]{"菜单名称","父菜单","路径","状态"};
        MenuExcelUtil.createhead(4);
        MenuExcelUtil.createother(list,list1);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddhhmmss");
        String date= simpleDateFormat.format(new Date());
        FileOutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream("f:\\menu" + date + ".xls");
            MenuExcelUtil.export(outputStream);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out2=response.getWriter();
            out2.print("<script>alert('导出成功');location.href='/resource/system/menu/getallmenu'</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询顶级菜单
     * @param map
     * @return
     */
    @RequestMapping("/resource/system/menu/addready")
    public String readyaddmenu(ModelMap map){
        List<Menu> menus = menuService.findupmenu(-1);
        map.put("umenu",menus);
        return "/resource/system/menu/add";
    }

    /**
     * 添加菜单
     * @param menu
     * @return
     */
    @RequestMapping("/resource/system/menu/addmenu")
    public String addmenu(Menu menu, Log log){
        Log log1 = LogUtil.setterLog(log);
        //添加表单
        logService.insertSelective(log1);
        menuService.insertSelective(menu);
        return "redirect:/resource/system/menu/getallmenu";
    }

    /**
     * 批量删除
     * @param single
     * @param log
     * @return
     */
    @RequestMapping("/resource/system/user/deletemenus")
    private String deletemenu(int[] single, Log log){
        Log log1 = LogUtil.setterLog(log,"无","批量删除菜单");
        //插入进log表单
        logService.insertSelective(log1);



            int i = menuService.deletebtints(single);



        return "redirect:/resource/system/menu/getallmenu";
    }

    @RequestMapping("/resource/system/menu/deleteone")
    public void deleteOne(int id, Log log, HttpServletResponse response){
        Log log1 = LogUtil.setterLog(log);
        logService.insertSelective(log1);
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=response.getWriter();


            int k = menuService.deleteByPrimaryKey(id);



            if(k>0){
                out.print("<script>alert('删除成功');location.href='/resource/system/menu/getallmenu';</script>");
            }else{
                out.print("<script>alert('删除失败');location.href='/resource/system/menu/getallmenu';</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
