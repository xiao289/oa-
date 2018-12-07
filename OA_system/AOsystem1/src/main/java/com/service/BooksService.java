package com.service;

import com.bean.Book;
import com.bean.BookReserve;
import com.bean.User;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

public interface BooksService {

    PageInfo queryallbooks(int index,int size);
    int deleteByPrimaryKey(String bookid);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(String bookid);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    int addbook(BookReserve bookReserve,String starttime,String endtime);

    BookReserve yanzheng(String startTime,String endTime,int bookid);

    BookReserve findsingletask(Integer userid,Integer taskid);
    //    修改状态
    int updatestate(Integer id,int state);

}
