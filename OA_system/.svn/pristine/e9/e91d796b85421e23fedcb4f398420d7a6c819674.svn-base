package com.web;

import com.bean.Log;
import com.bean.Trip;
import com.service.LogService;
import com.service.TripService;
import com.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class TripController {

    @Autowired
    private TripService tripService;
    @Autowired
    private LogService logService;
    //add出差
    @RequestMapping("/resource/renshi/demo2/addtrip")
    public void addtrip(Trip trip, HttpServletResponse resp, Log log){
        Log log1 = LogUtil.setterLog(log);
        //添加表单
        logService.insertSelective(log1);
        int k=tripService.insertSelective(trip);
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            if(k>0){
                out.print("<script>top.location.href='/index.jsp'</script>");
            }else {
                out.print("<script>alert('添加失败');location.href='/resource/renshi/demo1/getuser2'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
