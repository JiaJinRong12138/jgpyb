<%--
  Created by IntelliJ IDEA.
  User: jjr
  Date: 2019/12/16
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/page.css" type="text/css" rel="stylesheet" />
    <script src="js/register.js"></script>
    <script src="js/jquery-3.4.0.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>

    <title>注册</title>
</head>
<body>
<div class="div_all">


    <!-- JSON数据类型传输 -->
    <form action="#" method="post" enctype="multipart/form-data">
        <div class="head_img_">
            <img src="" />
        </div>
        <br />
        <input class="cimg" type="file" id="file" name="file" onchange="chageimg(this)" />
        <div class="input_div">
            <font class="font_">账户：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="text" class="input_" id="username" placeholder="请创建账户" />
        </div>
        <div class="input_div">
            <font class="font_">密码：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="password" class="input_"  id="password" placeholder="请输入密码" />
        </div>
        <div class="input_div">
            <font class="font_">密码：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="password" class="input_"  id="password_again" placeholder="请再次输入密码" />
        </div>

        <div class="input_div">
            <font class="font_">邮箱：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="text" class="input_"  id="email" placeholder="请输入邮箱" />
        </div>

        <div class="input_div">
            <font class="font_">昵称：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="text" class="input_"  id="nickname" placeholder="请创建昵称" />
        </div>

        <div class="input_div">
            <font class="font_">性别：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <div class="input_" style="display: inline-block" >
                男<input type="radio"  name="sex" onclick="getv(this)" value="1"/>
                女<input type="radio"  name="sex" onclick="getv(this)" value="0" />
                秘密<input type="radio"  name="sex" onclick="getv(this)" value="2" />
            </div>
        </div>

        <div class="input_div">
            <font class="font_">学历：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <select class="input_" onchange="getSelecter()">
                <option value="0">请选择</option>
                <option value="1">小学</option>
                <option value="2">初中</option>
                <option value="3">高中</option>
                <option value="4">大学</option>
                <option value="5">硕士</option>
                <option value="6">博士</option>
            </select>
        </div>
        <div class="input_div">
            <font class="font_">工作：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="text" class="input_"  id="work" placeholder="请填写工作" />
        </div>

        <div class="input_div">
            <font class="font_">地址：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="text" class="input_"  id="addr" placeholder="请输入地址" />
        </div>
        <div class="input_div">
            <font class="font_">兴趣：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <input type="text" class="input_"  id="hobby" placeholder="请填写兴趣（如：学习/吃饭/游戏）" />
        </div>

        <div class="input_div">
            <font class="font_">简介：&nbsp;&nbsp;&nbsp;&nbsp;</font>
            <textarea class="textarea_" id="about_self_" ></textarea>
        </div>

        <div class="input_div">
            <input class="input_submit" type="button" value="注册" onclick="load('${pageContext.request.contextPath}/reg')" />
        </div>
    </form>
    <p style="color: #FF0000;" id="tips"></p>


</div>
<script>

</script>

</body>
</html>

