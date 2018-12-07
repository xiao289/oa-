package com.dao;

import com.bean.BookReserve;
import com.bean.User;

import java.util.Map;

public interface BookReserveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BookReserve record);

    int insertSelective(BookReserve record);

    BookReserve selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BookReserve record);

    int updateByPrimaryKey(BookReserve record);
    BookReserve yanzheng(Map map);

    BookReserve findsingletask(Map map);

    int updatestate(Map map);
}