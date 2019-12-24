package com.jgpyb.services;

import com.jgpyb.pojo.User;

import java.util.List;

/**
 * @ClassName UserService
 * @Author 秃头的JJ
 * Date 2019/12/17 16:22
 * Version 1.0
 */
public interface UserService {

    Boolean userRegister(User user) throws Exception;

    User userLogin(String username) throws Exception;

    List<User> getAllUserInfo() throws Exception;

    User getUserById(String id) throws Exception;
}
