package com.jgpyb.controller;

import com.alibaba.fastjson.JSONObject;
import com.jgpyb.pojo.ToActivity;
import com.jgpyb.pojo.User;
import com.jgpyb.services.ActivityService;
import com.jgpyb.services.UserService;
import com.jgpyb.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ViewController
 * @Author 秃头的JJ
 * Date 2019/12/16 16:52
 * Version 1.0
 */
@Controller
public class ViewController {

    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;

    @RequestMapping({"/", "/index.html"})
    public String toIndexJsp(HttpSession session){
        List<User> users;
        try {
            users = userService.getAllUserInfo();
            if(users != null){
                session.setAttribute("usersinfo", users);
            }
        } catch (Exception e) {
            LogUtils.LOGERROR(e.getMessage());
        }
        return "index";
    }

    @RequestMapping("/register.view")
    public String toRegisterJsp(){
        return "register";
    }

    @RequestMapping("/login.view")
    public String toLoginJsp(){
        return "login";
    }

    @RequestMapping("/userinfo.view")
    public ModelAndView toUserinfoJsp(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("userinfo");
        // 查询所有的关于自己的动态
        User u = (User) session.getAttribute("userinfo");
        Map<String, Object> map = activityService.getActivitisByUserId(u.getId());
        // 获取点赞信息
        JSONObject json = activityService.getLikeInfo(u.getId());
        List<ToActivity> activities = null;
        if(json.get("result") != null){
            activities = (List<ToActivity>) json.get("result");
        }
        modelAndView.addObject("likeac", activities);
        if(!map.get("result").equals("null")){
            modelAndView.addObject("userinfo_ac", (User)map.get("result"));
        }else{
            modelAndView.addObject("userinfo_ac", u);
        }
        return modelAndView;
    }

    @RequestMapping("/other.view")
    public ModelAndView toOtherUserinfoJsp(String id, HttpSession session, HttpServletResponse response){
        LogUtils.LOGINFO(id);
        ModelAndView modelAndView = new ModelAndView("otheruserinfo");
        User user;
        if(id != null) {
            User u = (User)session.getAttribute("userinfo");
            List<ToActivity> activities = null;
            if(u != null){
                JSONObject json = activityService.getLikeInfo(u.getId());
                if(json.get("result") != null){
                    activities = (List<ToActivity>) json.get("result");
                }
            }
            modelAndView.addObject("likeac", activities);
            if(u!=null && u.getId().equals(id)){
                try {
                    response.sendRedirect("/jgpyb/userinfo.view");
                } catch (IOException e) {
                    LogUtils.LOGERROR(e.getMessage());
                    modelAndView.setViewName("userinfo");
                    return modelAndView;
                }
            }
            try {
                Map<String, Object> map = activityService.getActivitisByUserId(id);
                if(!map.get("result").equals("null")){
                    modelAndView.addObject("otheruserinfo", (User)map.get("result"));
                }else {
                    user = userService.getUserById(id);
                    if (user != null) {
                        modelAndView.addObject("otheruserinfo", user);
                    }
                }
            } catch (Exception e) {
                LogUtils.LOGERROR(e.getMessage());
            }
        }
        return modelAndView;
    }

    @RequestMapping("/sendaction.view")
    public String toSendActionJsp(){
        return "sendaction";
    }

}
