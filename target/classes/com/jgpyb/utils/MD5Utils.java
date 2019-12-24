package com.jgpyb.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @ClassName MD5Utils
 * @Author 秃头的JJ
 * Date 2019/12/17 17:40
 * Version 1.0
 */
public class MD5Utils {
    public static String md5(String password) {

        byte[] bytes = null;
        try {
            //使用MD5加密获取byte数组
            bytes = MessageDigest.getInstance("md5").digest(password.getBytes());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        //按16进制转换byte数组
        String md5Code = new BigInteger(1, bytes).toString(16);

        for (int i = 0; i < 32 - md5Code.length(); i++) {
            md5Code = "0" + md5Code;
        }
        return md5Code;
    }
}
