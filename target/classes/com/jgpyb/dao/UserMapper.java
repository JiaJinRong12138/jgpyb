package com.jgpyb.dao;

import com.jgpyb.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @InterfaceName UserDao
 * @Author 秃头的JJ
 * Date 2019/12/17 16:24
 */
@Repository
public interface UserMapper {

    int addUser(User user);

    User getUser(String username);

    List<User> getAllUser();

    User getUserById(String id);
}
