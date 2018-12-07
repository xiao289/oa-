package com.service.impl;

import com.bean.Menu;
import com.dao.MenuMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Autowired
    private DataSourceTransactionManager dataSourceTransactionManager;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int i = 0;
        Menu menu = menuMapper.selectByPrimaryKey(id);
        if (menu.getPid() == -1){
            List<Menu> findupmenu = menuMapper.findupmenu(id);
            if (findupmenu.isEmpty()){
                i = menuMapper.deleteByPrimaryKey(id);
            }
        }else{
            if (! (menu.getMenuname().equals("菜单管理"))){
                i = menuMapper.deleteByPrimaryKey(id);
            }
        }
        return i;
    }

    @Override
    public int insert(Menu record) {
        return menuMapper.insert(record);
    }

    @Override
    public int insertSelective(Menu record) {
        return menuMapper.insertSelective(record);
    }

    @Override
    public Menu selectByPrimaryKey(Integer id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Menu record) {
        return menuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Menu record) {
        return menuMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageInfo findmenu(int pagesize, int size, String menuname) {
        Map map = new HashMap();
        map.put("menuname1",menuname);
        PageHelper.startPage(pagesize,size);
        List<Menu> list = menuMapper.findmenu(map);

        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<Menu> findupmenu(int pid) {
        return menuMapper.findupmenu(pid);
    }

    @Override
    public List<Menu> findmenubyarray(int[] ids) {
        Map map = new HashMap();
        map.put("ids", ids);

        return menuMapper.findmenubyarray(map);
    }

    @Override
    @Transactional
    public int deletebtints(int[] ids) {
        DefaultTransactionDefinition defaultTransactionDefinition = new DefaultTransactionDefinition();
        TransactionStatus transaction = dataSourceTransactionManager.getTransaction(defaultTransactionDefinition);
        //保存一级菜单
        try {
            List<Menu> list = new ArrayList();
            for (int i = 0; i < ids.length; i++) {
                Menu menu = menuMapper.selectByPrimaryKey(ids[i]);
                if (menu.getPid() == -1){
                    list.add(menu);
                }else{
                    if (menu.getMenuname().equals("菜单管理")){
                        throw new Exception("aaa");
                    }else {
                        menuMapper.deleteByPrimaryKey(ids[i]);
                    }
                }
            }

            for (Menu menu : list) {
                List<Menu> menuList = menuMapper.findupmenu(menu.getId());
                if (menuList.isEmpty()){
                    menuMapper.deleteByPrimaryKey(menu.getId());
                }else {
                    throw new Exception("aaa");
                }
            }

            dataSourceTransactionManager.commit(transaction);

        } catch (Exception e) {
            dataSourceTransactionManager.rollback(transaction);
        }

        return 0;
    }

    @Override
    public Menu selectByMenuname(String name) {
        return menuMapper.selectByMenuname(name);
    }

    @Override
    public List<Menu> findbyroleid(int id) {
        return menuMapper.findbyroleid(id);
    }


}
