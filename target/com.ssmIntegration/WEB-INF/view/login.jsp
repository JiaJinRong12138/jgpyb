<%--
  Created by IntelliJ IDEA.
  User: jjr
  Date: 2019/12/16
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="css/page.css" type="text/css" rel="stylesheet" />
</head>
<body>
<h1 style="color: cornflowerblue">JJ交友</h1>
<form action="${pageContext.request.contextPath}/login" method="post">

    <div class="input_div">
        <font class="font_">账户：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <input type="text" class="input_" name="username" id="username" placeholder="请输入账户" />
    </div>
    <div class="input_div">
        <font class="font_">密码：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <input type="password" class="input_" name="password"  id="password" placeholder="请输入密码" />
    </div>

    <div class="input_div">
        <input class="input_submit" type="submit" value="登录"  />
    </div>
</form>
<p style="color: #FF0000;" id="tips">${msg }</p>
</body>
</html>
