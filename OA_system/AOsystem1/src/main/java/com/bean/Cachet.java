package com.bean;

import java.util.Date;

public class Cachet {
    private Integer id;

    private Integer userid;

    private Date utime;

    private Integer deptid;

    private Integer type;

    private String remark;

    private Integer adminid;
    private Integer typeall;
    private Integer taskid;
    private Integer state;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }


    private Leavex leavex;

    public Leavex getLeavex() {
        return leavex;
    }

    public void setLeavex(Leavex leavex) {
        this.leavex = leavex;
    }


    public Integer getTypeall() {
        return typeall;
    }

    public void setTypeall(Integer typeall) {
        this.typeall = typeall;
    }

    public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getUtime() {
        return utime;
    }

    public void setUtime(Date utime) {
        this.utime = utime;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }
}