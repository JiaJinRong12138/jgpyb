package com.jgpyb.utils;

import com.alibaba.fastjson.JSON;
import lombok.Data;
import org.apache.tools.ant.util.DateUtils;

import java.util.Date;

/**
 * @ClassName JsonUtils
 * @Author 秃头的JJ
 * Date 2019/12/17 12:06
 * Version 1.0
 */
@Data
public class JsonUtils {
    // 状态码
    private CODE code;
    // message
    private String msg;
    // 时间
    private String date;

    public JsonUtils(CODE code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static JSON getJsonObj(JsonUtils jsonUtils){
        jsonUtils.setDate(DateUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
        JSON json = (JSON) JSON.toJSON(jsonUtils);
        return json;
    }
}
