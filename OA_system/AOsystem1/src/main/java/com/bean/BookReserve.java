package com.bean;

import java.util.Date;

public class BookReserve {
    private Integer id;

    private Integer userid;

    private Date starttime;

    private Date endtime;

    private Integer deptid;

    private Integer bookid;

    private Integer adminid;
    private Integer state;
    private Integer typeall;
    private Integer taskid;



    public void setTypeall(Integer typeall) {
        this.typeall = typeall;
    }



    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

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
    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }

    public int getTypeall() {
        return typeall;
    }

    public void setTypeall(int typeall) {
        this.typeall = typeall;
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

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }
}