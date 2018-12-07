package com.service.impl;

import com.bean.Document;
import com.dao.DocumentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return documentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Document record) {
        return documentMapper.insert(record);
    }

    @Override
    public int insertSelective(Document record) {
        return documentMapper.insertSelective(record);
    }

    @Override
    public Document selectByPrimaryKey(Integer id) {
        return documentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Document record) {
        return documentMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Document record) {
        return documentMapper.updateByPrimaryKey(record);
    }




    @Override
    public PageInfo selectall(String name1,int[] ids,int pageindex, int size) {
        //封装模糊查条件
        Map map=new HashMap();
        map.put("name1",name1);
        map.put("ids",ids);
        PageHelper.startPage(pageindex,size);
        List list= documentMapper.selectall(map);
        PageInfo pi=new PageInfo(list);
        return pi;
    }

    @Override
    public PageInfo selectall1(String name1,int[] ids,int pageindex, int size) {
        //封装模糊查条件
        Map map=new HashMap();
        map.put("name1",name1);
        map.put("ids",ids);
        PageHelper.startPage(pageindex,size);
        List list= documentMapper.selectall1(map);
        PageInfo pi=new PageInfo(list);
        return pi;
    }

    @Override
    public int deletein(int[] single) {
        //1、对取得的所有的文件夹信息分级存放
        List<Document> queryall = documentMapper.queryall(single);
        List<Document> first=new ArrayList<Document>();
        Map map=new HashMap();
        List<Document> selectall = documentMapper.selectalltoup();

        for (Document document : queryall) {
            if(document.getPid()==-1){
                List<Document> second=new ArrayList<Document>();
                for (Document document1 : selectall) {
                    if(document1.getPid()==document.getId()){
                        second.add(document1);
                    }
                }
                document.setLowd(second);
                first.add(document);
            }
        }
        //2、对分级一级菜单进行判断，存在二级菜单的不可以删除
        for (Document document : first) {
            if(document.getLowd().size()>0){
                System.out.println("document........");
                return 0;
            }
        }
        int in = documentMapper.deletein(single);
        return in;
    }

    @Override
    public Document selectbyid(int id) {
        return documentMapper.selectbyid(id);
    }


    @Override
       public List selectalltoup() {
            return documentMapper.selectalltoup();

    }

    @Override
    public PageInfo hssel(int[] ids, int pageindex, int size) {
        //封装模糊查条件
        Map map=new HashMap();
        map.put("ids",ids);
        PageHelper.startPage(pageindex,size);
        List list= documentMapper.hssel(map);
        PageInfo pi=new PageInfo(list);
        return pi;

    }

    @Override
    public PageInfo Dselect(Integer id, String name1, int[] ids, int pageindex, int size) {
        //封装模糊查条件
        Map map=new HashMap();
        map.put("name1",name1);
        System.out.println(name1+"serviceImpl");
        map.put("id",id);
        map.put("ids",ids);
        PageHelper.startPage(pageindex,size);
        List list= documentMapper.Dselect(map);
        PageInfo pi=new PageInfo(list);
        return pi;
    }

    @Override
    public int updatein(int[] single) {
        //1、对取得的所有的文件夹信息分级存放
        List<Document> queryall = documentMapper.queryall(single);
        List<Document> first=new ArrayList<Document>();
        Map map=new HashMap();
        List<Document> selectall = documentMapper.selectalltoup();

        for (Document document : queryall) {
            if(document.getPid()==-1){
                List<Document> second=new ArrayList<Document>();
                for (Document document1 : selectall) {
                    if(document1.getPid()==document.getId()){
                        second.add(document1);
                    }
                }
                document.setLowd(second);
                first.add(document);
            }
        }
        //2、对分级一级菜单进行判断，存在二级菜单的不可以删除
        for (Document document : first) {
            if(document.getLowd().size()>0){
                System.out.println("document........");
                return 0;
            }
        }
        int in = documentMapper.updatein(single);
        return in;
    }
}
