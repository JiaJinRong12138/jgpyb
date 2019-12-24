package com.jgpyb.controller;

import com.jgpyb.pojo.User;
import com.jgpyb.services.UserService;
import com.jgpyb.utils.LogUtils;
import com.jgpyb.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName LoginController
 * @Author 秃头的JJ
 * Date 2019/12/17 21:48
 * Version 1.0
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ModelAndView login(@RequestParam String username, @RequestParam String password, HttpSession session, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("index");
        System.out.println(username + "\t" + password);
        try {
            User user = userService.userLogin(username);
            if(user==null){
                modelAndView.setViewName("login");
                modelAndView.addObject("msg", "账号错误");
                return modelAndView;
            }
            if(MD5Utils.md5(password).equals(user.getPassword())){
                session.setAttribute("userinfo", user);
                // 一小时活动
                session.setMaxInactiveInterval(1000*60*60);
                response.sendRedirect("/jgpyb/index.html");
            }
            modelAndView.setViewName("login");
            modelAndView.addObject("msg", "密码错误");
        } catch (Exception e) {
            LogUtils.LOGERROR(e.getMessage());
        }
        return modelAndView;
    }

}
