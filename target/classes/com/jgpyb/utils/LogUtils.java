package com.jgpyb.utils;

import java.util.logging.Logger;

/**
 * @ClassName LogUtils
 * @Author 秃头的JJ
 * Date 2019/12/17 16:38
 * Version 1.0
 */
public class LogUtils {
    private static Logger logger = Logger.getLogger("LogUtils");
    public static void LOGINFO(String msg){
        logger.info("[INFO]" + msg);
    }
    public static void LOGERROR(String msg) {logger.warning("[ERROR]" + msg);}
}
