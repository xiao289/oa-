package com.service;

import com.bean.Document;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface DocumentService {

    int deleteByPrimaryKey(Integer id);

    int insert(Document record);

    int insertSelective(Document record);

    Document selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Document record);


    int updateByPrimaryKey(Document record);

    //文档列表模糊查+分页
    public PageInfo selectall(String name1, int[] ids, int pageindex, int size);

    //文档模糊查+分页
    public PageInfo selectall1(String name1, int[] ids, int pageindex, int size);

    //文档回收站删除全部
    int deletein(int[] single);

    //文档列表删除全部
    int updatein(int[] single);

    //文档列表根据id查找
    Document selectbyid(int id);

    //文档列表查询全部
    List<Document> selectalltoup();

    //查询二级全部
    PageInfo Dselect(Integer id, String name1, int[] ids, int pageindex, int size);

    //文档回收站查询全部
    PageInfo hssel(int[] ids, int pageindex, int size);

}
