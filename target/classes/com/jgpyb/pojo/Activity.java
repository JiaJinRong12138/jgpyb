package com.jgpyb.pojo;

import lombok.Data;

/**
 * @ClassName Acitivity
 * @Author 秃头的JJ
 * Date 2019/12/17 16:11
 * Version 1.0
 */
@Data
public class Activity {
    private String id;
    private String user_id;
    private String time;
    private String img_uri;
    private String context;
    private String[] uris;

    public Activity(String id, String user_id, String time, String img_uri, String context) {
        this.id = id;
        this.user_id = user_id;
        this.time = time;
        this.img_uri = img_uri;
        this.context = context;
    }

    public Activity() {
    }
}
