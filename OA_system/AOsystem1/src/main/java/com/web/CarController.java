package com.web;


import com.bean.Car;
import com.bean.CarReserve;
import com.bean.Log;
import com.bean.User;
import com.github.pagehelper.PageInfo;
import com.service.CarReserveService;
import com.service.CarService;
import com.service.LogService;
import com.service.UserService;
import com.util.CarExcelUtil;
import com.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CarController {
    @Autowired
    private CarService carService;
    @Autowired
    private UserService userService;
    @Autowired
    private CarReserveService carReserveService;
    @Autowired
    private LogService logService;

    @RequestMapping("/resource/xingzheng/demo2/getcarlist")
    public String getcarlist(@RequestParam(value="index",defaultValue = "1")int pageindex,
                             @RequestParam(value="size",defaultValue = "5")int size, ModelMap map){
        PageInfo pageInfo=carService.getall(pageindex,size);
        map.put("pa",pageInfo);
        map.put("size",size);
        return "/resource/xingzheng/demo2/list";
    }

    //校验carid是否重复
    @RequestMapping("/resource/xingzheng/demo2/checkcarid")
    public void checkcar(String carid,HttpServletResponse resp){
        try {
            List<Car> list=carService.findcar(carid);
            String str="true";
                    if(list!=null&&list.size()>0){
                        //已存在
                        str="false";
                    }
            //输出
            resp.setContentType("text/html;charset=utf-8");
            ServletOutputStream out=resp.getOutputStream();
            out.write(str.getBytes());
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //校验carid是否重复但自己可重名
    @RequestMapping("/resource/xingzheng/demo2/checkcarid2")
    @ResponseBody
    public List checkcar2(String carid){
            List<Car> list=carService.findcar2(carid);
            return  list;
    }


    //新增
    @RequestMapping("/resource/xingzheng/demo2/addcar")
    public void addcar(Car car, HttpServletResponse resp,Log log){

        Log log1 = LogUtil.setterLog(log);
        //添加表单
        logService.insertSelective(log1);
        int k=carService.insertSelective(car);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            if (k>0){
                out.print("<script>location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }else {
                out.print("<script>alert('新增失败');location.href='/resource/xingzheng/demo2/add'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //id查询
    @RequestMapping("/resource/xingzheng/demo2/getcarbyid")
    public String getcarbyid(int id,ModelMap map){
        Car car=carService.selectByPrimaryKey(id);
        map.put("car",car);
        return "/resource/xingzheng/demo2/edit";
    }
    //更新
    @RequestMapping("/resource/xingzheng/demo2/updatecarbyid")
    public void updatecar(Car car, HttpServletResponse resp, Log log){
        Log log1 = LogUtil.setterLog(log);
        //添加表单
        logService.insertSelective(log1);
        int k=carService.updateByPrimaryKeySelective(car);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            if (k>0){
                out.print("<script>location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }else {
                out.print("<script>alert('修改失败');location.href='/resource/xingzheng/demo2/edit'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //删除
    @RequestMapping("/resource/xingzheng/demo2/deletecarbyid")
    public void deletecar(int id,HttpServletResponse resp,String username){

        Log log = new Log();
        log.setUsername(username);
        System.out.println("1111111111111111wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"+log.getUsername());

        Log log1 = LogUtil.setterLog(log, "wu", "删除车辆");
        int i = logService.insertSelective(log1);

        System.out.println("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"+i);
        int k=carService.deleteByPrimaryKey(id);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            if (k>0){
                out.print("<script>location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }else {
                out.print("<script>alert('删除失败');location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //导出数据
    @RequestMapping("/resource/xingzheng/demo2/toexport")
    public void export(int[] single,HttpServletResponse response,Log log){
        Log log1 = LogUtil.setterLog(log, "无", "导出car的excel");
        //插入进log表单
        logService.insertSelective(log1);

        List<Car> list=carService.getall2(single);
        CarExcelUtil.creatheader();
        CarExcelUtil.creatother(list);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddhhmmss");
        String date= simpleDateFormat.format(new Date());
        FileOutputStream out=null;
        try {
            out=new FileOutputStream("g:\\Car"+date+".xls");
            CarExcelUtil.export(out);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out2=response.getWriter();
            out2.print("<script>alert('导出成功');location.href='/resource/xingzheng/demo2/getcarlist'</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //批量删除
    @RequestMapping("/resource/xingzheng/demo2/deleteall")
    public void deletall(int[] single,HttpServletResponse resp,Log log){
        Log log1 = LogUtil.setterLog(log,"无","批量删除车辆");
        //插入进log表单
        logService.insertSelective(log1);

        int k=carService.deleteall(single);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            if (k>0){
                out.print("<script>location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }else {
                out.print("<script>alert('删除失败');location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/resource/xingzheng/demo2/toyuding")
    public String yuding(ModelMap map){
        List admin = userService.querybyroleid1();
        map.put("admins",admin);
        return "/resource/xingzheng/demo2/yuding";
    }

    @RequestMapping("/resource/xingzheng/demo2/check")
    @ResponseBody
    public List check(String carid){
        System.out.println(carid);
        System.out.println("------------------------");
        List<CarService> list=carReserveService.check(carid);
        return  list;
    }


    @RequestMapping("/resource/xingzheng/demo2/addcaryuding")
    public void addcaryuding(CarReserve carReserve,HttpServletResponse resp,Log log){
        Log log1 = LogUtil.setterLog(log);
        //添加表单
        logService.insertSelective(log1);
        int k=carReserveService.insertSelective(carReserve);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            if (k>0){
                out.print("<script>location.href='/resource/xingzheng/demo2/getcarlist'</script>");
            }else {
                out.print("<script>alert('预定失败');location.href='/resource/xingzheng/demo2/toyuding'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
