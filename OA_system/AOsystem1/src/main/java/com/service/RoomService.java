package com.service;

import com.bean.Room;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface RoomService {
    int deleteByPrimaryKey(Integer id);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
    //查询所有的会议室信息
    PageInfo queryall(int index, int size);
    List<Room> querynany(int[] roomids);

    int deletemany(int[] roomids);

    int querybyroomname(String roomname);
}
