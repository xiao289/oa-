package com.web;

import com.bean.Announce;
import com.util.AnnounceExcelUtil;
import com.github.pagehelper.PageInfo;
import com.service.AnnounceService;
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
import java.util.Date;
import java.util.List;

/*
    通告
 */

@Controller
public class AnnounceController {

    @Autowired
    private AnnounceService announceService;

    //查询+模糊查
    @RequestMapping("/resource/tonggao/demo1/selectlist")
    public String selectlist(String title, String starttime, String endtime,
                                @RequestParam(value="index", defaultValue = "1") int pageindex,
                                ModelMap map,
                                @RequestParam(value="size",defaultValue = "3") int size){
        //设置分页
        PageInfo pageInfo=announceService.selectall(title,starttime,endtime,pageindex,null,size,null);
        pageInfo.setPageSize(size);
        map.put("pi",pageInfo);
        map.put("title",title);
        map.put("starttime",starttime);
        map.put("endtime",endtime);
        return "/resource/tonggao/demo1/list";
    }

    //批量导出
    @RequestMapping("/resource/tonggao/demo1/daochu")
    public void daochu(int[] single, HttpServletResponse response,
                       @RequestParam(value="index", defaultValue = "1") int pageindex,
                       @RequestParam(value="size",defaultValue = "3") int size){
        PageInfo pg = announceService.selectall(null,null,null,pageindex,single,size,null);
        List<Announce> list = pg.getList();
        AnnounceExcelUtil.headers=new String[]{"名称","发布人","开始时间","结束时间","发布时间","状态"};
        AnnounceExcelUtil.createhead(6);
        AnnounceExcelUtil.createother(list);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddhhmmss");
        String date= simpleDateFormat.format(new Date());
        FileOutputStream out= null;
        try {
            out = new FileOutputStream("f:\\class"+date+".xls");
            AnnounceExcelUtil.export(out);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally{
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out2=response.getWriter();
            out2.print("<script>alert('导出成功');location.href='/resource/tonggao/demo1/selectlist'</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //总删除
    @RequestMapping("/resource/tonggao/demo1/deleteall")
    public void deleteall(int[] single,HttpServletResponse response){
        int i = announceService.deletein(single);
        System.out.println("announceconroller");
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=response.getWriter();
            if(i>0){
                out.print("<script>alert('批量删除成功');location.href='/resource/tonggao/demo1/selectlist';</script>");
            }else{
                out.print("<script>alert('批量删除失败');location.href='/resource/tonggao/demo1/selectlist';</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //添加
    @RequestMapping("/resource/tonggao/demo1/addtonggao")
    public String addtonggao(Announce announce){
        announceService.insertSelective(announce);
        return "redirect:/resource/tonggao/demo1/selectlist";
    }

    //添加+发布
    @RequestMapping("/resource/tonggao/demo1/fabu")
    public String fabu(Announce announce){
        announceService.insert(announce);
        return "redirect:/resource/tonggao/demo1/selectlist";
    }


    //发布状态
    @RequestMapping("/resource/tonggao/demo1/upp")
    public String upp(Announce announce){
        announceService.updateByPrimaryKeySelective(announce);
        return "redirect:/resource/tonggao/demo1/selectlist";
    }

    //删除
    @RequestMapping("/resource/tonggao/demo1/delete")
    public void delete(int id, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=response.getWriter();
            int k=announceService.deleteByPrimaryKey(id);
            if(k>0){
                out.print("<script>alert('删除成功');location.href='/resource/tonggao/demo1/selectlist';</script>");
            }else{
                out.print("<script>alert('删除失败');location.href='/resource/tonggao/demo1/selectlist';</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //通告修改
    @RequestMapping("/resource/tonggao/demo1/update")
    public void update(HttpServletResponse resp, ModelMap map,Announce announce) {
        int k = announceService.updateByPrimaryKeySelective(announce);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out = resp.getWriter();
            if (k > 0) {
                out.write("<script>alert('修改成功');location.href='/resource/tonggao/demo1/selectlist'</script>");
            } else {
                out.write("<script>alert('修改失败');location.href='/resource/tonggao/demo1/selectbyid'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //通告修改 根据id查询
    @RequestMapping("/resource/tonggao/demo1/selectbyid")
    public String selectbyid(ModelMap map,Announce announce){
        Announce announce1 = announceService.selectbyid(announce.getId());
        map.put("a1",announce1);
        return "resource/tonggao/demo1/edit";
    }

    //通告查看 根据id查询
    @RequestMapping("/resource/tonggao/demo1/sid")
    public String sid(ModelMap map,Announce announce){
        Announce announce1 = announceService.selectbyid(announce.getId());
        map.put("a1",announce1);
        return "resource/tonggao/demo1/look";
    }
}
