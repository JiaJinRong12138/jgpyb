package com.jgpyb.services.impl;

import com.alibaba.fastjson.JSONObject;
import com.jgpyb.dao.ActivityMapper;
import com.jgpyb.dao.ToActivityMapper;
import com.jgpyb.pojo.Activity;
import com.jgpyb.pojo.ToActivity;
import com.jgpyb.pojo.User;
import com.jgpyb.services.ActivityService;
import com.jgpyb.utils.CODE;
import com.jgpyb.utils.CharUtils;
import com.jgpyb.utils.DataUtils;
import com.jgpyb.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @ClassName ActivityServiceImpl
 * @Author 秃头的JJ
 * Date 2019/12/19 11:31
 * Version 1.0
 */
@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private ToActivityMapper toActivityMapper;

    @Override
    public Map<String, CODE> addActivity(String userId, String imgPath, String context) throws Exception {
        String id = "activity-" + UUID.randomUUID().toString();
        String time = DataUtils.dateToStamp(new Date());
        Activity ac = new Activity(id, userId, time, imgPath, CharUtils.unescape(context));

        Map<String, CODE> map = new HashMap<>();
        if(activityMapper.insterActivity(ac) == 1){
            map.put("result", CODE.SUCCESS);
        }else{
            map.put("result", CODE.ERROR);
        }

        return map;
    }

    @Override
    public Map<String, Object> getActivitisByUserId(String userId) {
        Map<String, Object> map = new HashMap<>();
        User u = activityMapper.getActivitisByUserId(userId);
        if(u != null){
            LogUtils.LOGINFO(u.toString());
            List<Activity> activityList = u.getActivities();
            List<Activity> newAc = new ArrayList<>();
            for (Activity a : activityList) {
                System.out.println("====>" + a.toString());
                if(a.getImg_uri() != null) {
                    String s = a.getImg_uri();
                    s = s.substring(s.indexOf("/file/"), s.indexOf("\"]"));
                    a.setUris(s.split("\",\""));
                }
                a.setTime(DataUtils.stampToDate(a.getTime()));
                newAc.add(a);
            }
            u.setActivities(newAc);
            LogUtils.LOGINFO(u.toString());
            map.put("result", u);
        }else{
            map.put("result", "null");
        }
        return map;
    }

    @Override
    public JSONObject deleteActivityByAcId(String id) {
        JSONObject json = new JSONObject();
        int i = activityMapper.deleteAcById(id);
        if(i == 1){
            json.put("result", 200);
        }else{
            json.put("result", 400);
        }
        return json;
    }

    @Override
    public JSONObject putLike(String acId, String userId) {

        JSONObject json = new JSONObject();
        ToActivity toActivity = new ToActivity(acId, userId);
        System.out.println(toActivity.toString());
        int i = toActivityMapper.insterToActivity(toActivity);

        if(i == 1){
            json.put("result", 200);
        }else{
            json.put("result", 400);
        }
        return json;
    }

    @Override
    public JSONObject putUnLike(String acId, String userId){
        JSONObject json = new JSONObject();
        ToActivity toActivity = new ToActivity(acId, userId);
        System.out.println(toActivity.toString());
        int i = toActivityMapper.deleteToActivity(toActivity);
        if(i == 1){
            json.put("result", 200);
        }else{
            json.put("result", 400);
        }
        return json;
    }

    @Override
    public JSONObject getLikeInfo(String userId) {

        JSONObject json = new JSONObject();
        List<ToActivity> activities = toActivityMapper.getLikeInfo(userId);

        if(activities != null){
            json.put("result", activities);
        }else{
            json.put("result", 400);
        }
        return json;
    }

    @Override
    public JSONObject selectCount(String activityId) {
        JSONObject json = new JSONObject();
        int count = toActivityMapper.selectCount(activityId);
        json.put("result", count);
        return json;
    }
}
