<%@ page import="java.util.Random" %>
<%@ page import="com.jgpyb.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: jjr
  Date: 2019/12/16
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <title>首页</title>
    <script src="js/jquery-3.4.0.min.js"></script>
    <link href="css/page.css" type="text/css" rel="stylesheet" />
    <link href="css/xccss.css" type="text/css" rel="stylesheet" />
</head>
<body>
<h1 style="color: cornflowerblue">JJ交友</h1>
<c:if test="${userinfo == null }">
    <a href="${pageContext.request.contextPath}/register.view">注册</a>
    <a href="${pageContext.request.contextPath}/login.view">登录</a><br />
</c:if>
<c:if test="${userinfo != null }">
    欢迎登录<b style="color: cornflowerblue"> ${userinfo.getNickname() } </b>
    <a href="${pageContext.request.contextPath}/logout">注销</a><br />
    <div class="head_img_">
        <img src="${pageContext.request.contextPath}${userinfo.getHead_uri()}" alt="头像" />
    </div>
</c:if>
<br />

<a href="${pageContext.request.contextPath}/sendaction.view">动态</a>
<a href="#">喜欢的人</a>
<a href="${pageContext.request.contextPath}/userinfo.view">我的</a>
<p></p>


<div class="parent">
    <c:forEach items="${usersinfo }" var="user">
        <div class="child">
            <img class="peo" src="${pageContext.request.contextPath}${user.getHead_uri() }" />
            <div class="intor_div">
                ${user.getNickname() }
                <div class="intor_div_view">
                    <a class="btn_" href="#">
                        喜欢
                    </a>
                    <a class="btn_" href="${pageContext.request.contextPath}/other.view?id=${user.getId()}">
                        信息
                    </a>
                </div>
            </div>
        </div>

    </c:forEach>

</div>


</body>
</html>
