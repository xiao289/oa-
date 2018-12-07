package com.service.impl;

import com.bean.Room;
import com.dao.RoomMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return roomMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PageInfo queryall(int index, int size) {
        PageHelper.startPage(index,size);
        List<Room> queryall = roomMapper.queryall();
        PageInfo pageInfo=new PageInfo(queryall);
        return pageInfo;
    }

    @Override
    public int querybyroomname(String roomname) {
        Room querybyroomname = roomMapper.querybyroomname(roomname);
        if(querybyroomname!=null){
            return 1;
        }
        return 0;
    }

    @Override
    public int deletemany(int[] roomids) {
        int deletemany = roomMapper.deletemany(roomids);
        return deletemany;
    }

    @Override
    public List<Room> querynany(int[] roomids) {
        for (int roomid : roomids) {
            System.out.println(roomid+"sercice-------------");
        }
        List<Room> querymany = roomMapper.querymany(roomids);
        return querymany;
    }

    @Override
    public int insert(Room record) {
        return 0;
    }

    @Override
    public int insertSelective(Room record) {
        return roomMapper.insertSelective(record);
    }

    @Override
    public Room selectByPrimaryKey(Integer id) {
        return roomMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Room record) {
        return roomMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Room record) {
        return roomMapper.updateByPrimaryKey(record);
    }
}
