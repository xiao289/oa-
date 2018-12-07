package com.dao;

import com.bean.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> findalluser(Map map);
    //登陆
    public User login(String loginname);

    User selectByLoginname(String loginname);

    List<User> querybyroleid(Integer id);

    List<User> querybyroleid1();

    int deleteByArray(Map map);

    //
    public List<User> getuser(Integer id);


    User selectByusername(Map map);

    List<User> querybyroleid12(int roleid);

    User selectbyid(Integer userid);
}