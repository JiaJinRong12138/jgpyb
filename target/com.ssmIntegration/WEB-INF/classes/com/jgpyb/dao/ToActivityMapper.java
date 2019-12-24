package com.jgpyb.dao;

import com.jgpyb.pojo.ToActivity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName ToActivityMapper
 * @Author 秃头的JJ
 * Date 2019/12/17 16:28
 */
public interface ToActivityMapper {

    int insterToActivity(ToActivity toActivity);

    int deleteToActivity(ToActivity toActivity);

    List<ToActivity> getLikeInfo(@Param("userId") String userId);

    int selectCount(@Param("aid") String aid);

}
