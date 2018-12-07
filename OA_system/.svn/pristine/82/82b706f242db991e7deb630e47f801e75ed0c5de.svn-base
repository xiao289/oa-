package com.dao;

import com.bean.Book;
import com.bean.User;
import org.springframework.mail.MailParseException;

import java.util.List;
import java.util.Map;

public interface BookMapper {
    int deleteByPrimaryKey(String bookid);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(String bookid);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> queryallbooks();


}