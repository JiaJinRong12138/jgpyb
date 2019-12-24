package com.jgpyb.pojo;

import com.sun.istack.internal.NotNull;
import lombok.Data;

import java.util.List;

/**
 * @ClassName User
 * @Author 秃头的JJ
 * Date 2019/12/17 11:49
 * Version 1.0
 */
@Data
public class User {
    private String id;
    private String username;
    private String password;
    private Integer sex;
    private String head_uri;
    private String email;
    private String nickname;
    private Integer education;
    private String work;
    private String city;
    private String hobby;
    private String intro;

    private List<Activity> activities;
}
