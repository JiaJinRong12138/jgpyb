package com.jgpyb.pojo;

import lombok.Data;

/**
 * @ClassName ToActivity
 * @Author 秃头的JJ
 * Date 2019/12/17 16:13
 * Version 1.0
 */
@Data
public class ToActivity {
    private String activity_id;
    private String user_id;

    public ToActivity(String activity_id, String user_id) {
        this.activity_id = activity_id;
        this.user_id = user_id;
    }

    public ToActivity() {
    }
}
