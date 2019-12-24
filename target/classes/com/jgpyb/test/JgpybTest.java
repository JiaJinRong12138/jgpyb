package com.jgpyb.test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jgpyb.dao.ActivityMapper;
import com.jgpyb.pojo.ToActivity;
import com.jgpyb.services.ActivityService;
import com.jgpyb.utils.CODE;
import com.jgpyb.utils.LogUtils;
import netscape.javascript.JSObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;

/**
 * @ClassName JgpybTest
 * @Author 秃头的JJ
 * Date 2019/12/19 17:27
 * Version 1.0
 */
public class JgpybTest {

    @Test
    public void testAMapper(){
        String s = "[\"/file/acimg/2019-12-19-07-58-03&c3ff54e2a76de0dddacd0a343ec334d9.jpeg\",\"/file/acimg/2019-12-19-07-58-03&fcad254183bf8a760b7f0475390e3297.jpeg\"]";
        s = s.substring(s.indexOf("/file/"), s.indexOf("\"]"));
        String[] str = s.split("\",\"");
        System.out.println(str[1]);
    }

    @Test
    public void testA(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationConfig.xml");
        ActivityService activityService = context.getBean(ActivityService.class);

        JSONObject json = activityService.selectCount("activity-cd672179-3290-47f2-9562-7d7f09cba64e");
        System.out.println(json.get("result"));
    }

    @Test
    public void testCode(){
        System.out.println(CODE.SUCCESS.toString().equals("SUCCESS"));

    }

}
