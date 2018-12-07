package com.web;

import com.bean.Log;
import com.github.pagehelper.PageInfo;
import com.service.LogService;
import com.util.LogExcelUtil;
import com.util.LogUtil;
import com.util.UserExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class LogController {
    @Autowired
    private LogService logService;

    @RequestMapping("/resource/system/log/listlog")
    public String findalllog(@RequestParam(value = "index",defaultValue = "1") int index,
                             @RequestParam(value = "size", defaultValue = "5") int size, ModelMap map,
                             String usern, String shijian1,String shijian2){
        PageInfo pageInfo = logService.findalllog(index, size, usern, shijian1,shijian2);
        map.put("pi",pageInfo);
        map.put("username",usern);
        map.put("shijain1",shijian1);
        map.put("shijain2",shijian2);
        return "/resource/system/log/list";
    }

    /**
     * 导出excel
     * @param single
     *
     * @param response
     */
    @RequestMapping("/resource/system/log/daochuexcel")
    public void daochuexcel(int[] single, Log log, HttpServletResponse response){
        Log log1 = LogUtil.setterLog(log, "无", "导出日志到excel");
        logService.insertSelective(log1);
        List<Log> list = logService.findalllogbyarray(single);
        LogExcelUtil.headers = new String[]{"编号","操作用户登录名","角色","时间","备注","操作时间"};
        LogExcelUtil.createhead(6);
        LogExcelUtil.createother(list);
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddhhmmss");
        String date= simpleDateFormat.format(new Date());
        FileOutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream("f:\\log" + date + ".xls");
            LogExcelUtil.export(outputStream);
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
            out2.print("<script>alert('导出成功');location.href='/resource/system/log/listlog'</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
