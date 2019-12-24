package com.jgpyb.dao;

import com.jgpyb.pojo.Activity;
import com.jgpyb.pojo.User;

import java.util.List;

/**
 * @InterfaceName ActivityMapper
 * @Author 秃头的JJ
 * Date 2019/12/17 16:27
 */
public interface ActivityMapper {

    int insterActivity(Activity activity);

    User getActivitisByUserId(String id);

    int deleteAcById(String id);

}
