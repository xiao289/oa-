package com.dao;
import com.bean.Document;

import java.util.List;
import java.util.Map;

public interface DocumentMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Document record);

    int insertSelective(Document record);

    Document selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Document record);


    int updateByPrimaryKey(Document record);

    //模糊查+分页
    List<Document> selectall(Map map);

    //模糊查+分页
    List<Document> selectall1(Map map);

    //删除全部
    int deletein(int[] single);

    //文档删除
    int updatein(int[] single);

    //根据id查找
    Document selectbyid(int id);

    List<Document> queryall(int[] ids);

   //查询全部
    List<Document> Dselect(Map map);

    //查询全部
    List selectalltoup();

    //文档列表删除
    int deleteid(int id);

    //回收站查询全部
    List<Document> hssel(Map map);

}