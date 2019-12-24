package com.jgpyb.services.impl;

import com.jgpyb.dao.UserMapper;
import com.jgpyb.pojo.User;
import com.jgpyb.services.UserService;
import com.jgpyb.utils.LogUtils;
import com.jgpyb.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName UserServiceImpl
 * @Author 秃头的JJ
 * Date 2019/12/17 16:23
 * Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Boolean userRegister(User user) throws Exception {
        user.setPassword(MD5Utils.md5(user.getPassword()));
        LogUtils.LOGINFO(user.toString());

        return userMapper.addUser(user) == 1;
    }

    @Override
    public User userLogin(String username) throws Exception {
        User user = userMapper.getUser(username);
        return user;
    }

    @Override
    public List<User> getAllUserInfo() throws Exception {
        List<User> users = userMapper.getAllUser();
        return users;
    }

    @Override
    public User getUserById(String id) throws Exception {
        User user = userMapper.getUserById(id);
        return user;
    }
}
