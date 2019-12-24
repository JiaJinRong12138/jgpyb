package com.jgpyb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jgpyb.pojo.User;
import com.jgpyb.services.UserService;
import com.jgpyb.utils.CODE;
import com.jgpyb.utils.FileUtils;
import com.jgpyb.utils.JsonUtils;
import com.jgpyb.utils.LogUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * @ClassName RegisterController
 * @Author 秃头的JJ
 * Date 2019/12/17 11:57
 * Version 1.0
 */
@Controller
public class RegisterController {
    @Autowired
    private UserService userService;
    private String path;

    @PostMapping("/reg/file")
    @ResponseBody
    public String registerFile(MultipartFile file, HttpServletRequest request){
        if(FileUtils.IsHadThisFile(new File(request.getServletContext().getRealPath("/file/img/")), file.getOriginalFilename())){
            String p = FileUtils.saveFile(file, request, "/file/img/");
            if(p != null) {
                this.path = p;
                return "success:Picture uploaded successfully";
            }
            return "error:Image upload failed";
        }
        return "error:The picture already exists";

    }
    @PostMapping("/reg")
    @ResponseBody
    public JSON register(@RequestBody User user){
        user.setId("user-" + UUID.randomUUID().toString());
        user.setHead_uri(this.path);
        System.out.println(user.toString());
        try {
            if(userService.userRegister(user)){
                return JsonUtils.getJsonObj(new JsonUtils(CODE.SUCCESS, "注册成功"));
            }
        } catch (Exception e) {
            LogUtils.LOGERROR(e.getMessage());
        }
        return JsonUtils.getJsonObj(new JsonUtils(CODE.ERROR, "注册失败，该账号和用户名已经存在"));
    }


    @Test
    public void test(){

    }



}
