package com.jgpyb.utils;

import org.apache.tools.ant.util.DateUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * @ClassName FileUtils
 * @Author 秃头的JJ
 * Date 2019/12/16 22:56
 * Version 1.0
 */
public class FileUtils {

    public static String saveFile(MultipartFile file, HttpServletRequest request, String path){
        if(file != null){
            String fileName = file.getOriginalFilename();
            File filePath = new File(request.getServletContext().getRealPath(path));
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            fileName = DateUtils.format(new Date(), "yyyy-MM-dd-HH-mm-ss") + "&" + fileName;

            try {
                String fPath = filePath + "/"+ fileName;
                file.transferTo(new File(filePath + "/"+ fileName));
                return path + fileName;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    public static Boolean IsHadThisFile(File file, String fileName)
    {
        if(file.isDirectory()){
            File[] fs = file.listFiles();
            for (File f:fs
                 ) {
                String[] strs = f.getName().split("&");
                if(fileName.equals(strs[strs.length - 1])){
                    return false;
                }
            }
            return true;
        }
        return false;
    }
}
