package com.util;

import com.bean.Log;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogUtil {

    private static Log log = new Log();

    public static Log getLog() {
        return log;
    }

    public static void setLog(Log log) {
        LogUtil.log = log;
    }

    /**
     *
     * @param username 传递用户的name值
     * @param remark   备注信息
     * @param event    所做的时间
     * @return
     */
    public static Log setterLog(String username, String remark, String event){
        log= new Log();
        log.setUsername(username);
        log.setRemark(remark);
        log.setEvent(event);
        //修改的时间
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        log.setUpdatetime(Timestamp.valueOf(format));
        return log;
    }

    public static Log setterLog(Log log1, String event){
        log1.setEvent(event);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        log1.setUpdatetime(Timestamp.valueOf(format));
        return log1;
    }

    public static Log setterLog(Log log1){
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        log1.setUpdatetime(Timestamp.valueOf(format));
        return log1;
    }

    public static Log setterLog(Log log1, String remark,String event){
        log1.setRemark(remark);
        log1.setEvent(event);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        log1.setUpdatetime(Timestamp.valueOf(format));
        return log1;
    }
}
