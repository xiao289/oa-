package com.dao;

import com.bean.RoomReserve;

import java.util.List;
import java.util.Map;

public interface RoomReserveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoomReserve record);

    int insertSelective(RoomReserve record);

    RoomReserve selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoomReserve record);

    int updateByPrimaryKey(RoomReserve record);

    List queryall(Map map);

    int deletemany(int[] reserveids);
    List querymany(int[] reserveids);

    int addall(List list);

    List yanzhengroom(int roomid);
    List piliangyanzheng(int[] roomids);
}