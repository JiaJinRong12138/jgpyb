package com.jgpyb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jgpyb.pojo.Activity;
import com.jgpyb.pojo.User;
import com.jgpyb.services.ActivityService;
import com.jgpyb.utils.*;
import lombok.SneakyThrows;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * @ClassName ActivityController
 * @Author 秃头的JJ
 * Date 2019/12/18 19:24
 * Version 1.0
 */
@Controller
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    private JSON pathJson;
    @PostMapping("/sendac/uploadfile")
    @ResponseBody
    public JSON sendActionUpLoadFile(@RequestParam("file") MultipartFile[] files, HttpServletRequest request){
        List<String> paths = new ArrayList<String>();
        if(files.length >= 1 && !files[0].getOriginalFilename().equals("")){
            for (MultipartFile file:files){
                paths.add(FileUtils.saveFile(file, request, "/file/acimg/"));
            }
        }
        pathJson = (JSON) JSON.toJSON(paths);
        return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "上传成功"));

    }

    @PostMapping("/sendac")
    @ResponseBody
    public JSON sendAction(@RequestBody String context, HttpSession session){

        if(context.split("=").length > 1 || (pathJson != null && !("").equals(pathJson.toString()))){
            String context_ = "null";
            if(context.split("=").length > 1){
                String[] strs = context.split("=");
                StringBuffer sb = new StringBuffer();
                for(int i = 1; i<strs.length; i++){
                    sb.append(strs[i]);
                }
                context_ = sb.toString();
            }
            User u = (User)(session.getAttribute("userinfo"));
            try {

                Map<String, CODE> map;
                if(pathJson != null) {
                    map =  activityService.addActivity(u.getId(), pathJson.toString(), context_);
                }
                else{
                    map =  activityService.addActivity(u.getId(), null, context_);
                }
                if(CODE.SUCCESS.equals(map.get("result"))){
                    return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "发布成功"));
                }
            } catch (Exception e) {
                e.printStackTrace();
                LogUtils.LOGERROR(e.getMessage());
                return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "发布失败，请联系管理员"));
            }
        }
        return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "请填写内容"));
    }


    @DeleteMapping("/delete")
    @ResponseBody
    public JSON deleteActivity(@RequestBody String acId){
        JSONObject json = activityService.deleteActivityByAcId(acId);
        System.out.println(200 == (int)json.get("result"));
        if(200 == (int)json.get("result")){
            return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "删除成功"));
        }else{
            return JsonUtils.getJsonObj(new JsonUtils(CODE.ERROR, "删除失败"));
        }
    }


    /* 点赞 */
    @PutMapping("/dianz")
    @ResponseBody
    public JSON putLike(@RequestBody String acId, HttpSession session){
        User uTemp = (User)(session.getAttribute("userinfo"));
        String userId = uTemp.getId();
        uTemp = null;
        LogUtils.LOGINFO(acId);
        JSONObject json = activityService.putLike(acId, userId);
        if(200 == (int)json.get("result")){
            return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "点赞成功"));
        }else{
            return JsonUtils.getJsonObj(new JsonUtils(CODE.ERROR, "点赞失败"));
        }
    }


    @PutMapping("/quxiao")
    @ResponseBody
    public JSON putNuLike(@RequestBody String acId, HttpSession session){
        User uTemp = (User)(session.getAttribute("userinfo"));
        String userId = uTemp.getId();
        uTemp = null;
        LogUtils.LOGINFO(acId);
        JSONObject json = activityService.putUnLike(acId, userId);
        if(200 == (int)json.get("result")){
            return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "取消成功"));
        }else{
            return JsonUtils.getJsonObj(new JsonUtils(CODE.ERROR, "取消失败"));
        }
    }
}
