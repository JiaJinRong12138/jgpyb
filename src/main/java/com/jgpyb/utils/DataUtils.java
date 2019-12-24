package com.jgpyb.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName DataUtils
 * @Author 秃头的JJ
 * Date 2019/12/18 23:19
 * Version 1.0
 */
public class DataUtils {
    public static String stampToDate(String stap){
        String time;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(stap);
        Date date = new Date(lt);
        time = simpleDateFormat.format(date);
        return time;
    }

    public static String dateToStamp(Date time) {
        long ts = time.getTime();//获取时间的时间戳
        String stap = String.valueOf(ts);
        return stap;
    }
}
