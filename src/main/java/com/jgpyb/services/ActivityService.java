package com.jgpyb.services;

import com.alibaba.fastjson.JSONObject;
import com.jgpyb.utils.CODE;

import java.util.Map;

/**
 * @InterfaceName ActivityService
 * @Author 秃头的JJ
 * Date 2019/12/19 11:29
 */
public interface ActivityService {

    Map<String, CODE> addActivity(String userId, String imgPath, String context) throws Exception;

    Map<String, Object> getActivitisByUserId(String userId) ;

    JSONObject deleteActivityByAcId(String id);

    JSONObject putLike(String acId, String userId);

    JSONObject putUnLike(String acId, String userId);

    JSONObject getLikeInfo(String userId);

    JSONObject selectCount(String activityId);
}
