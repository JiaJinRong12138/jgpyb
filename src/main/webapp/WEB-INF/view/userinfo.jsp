<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jjr
  Date: 2019/12/18
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <title>信息</title>
    <script src="js/jquery-3.4.0.min.js"></script>
    <script src="js/action.js"></script>
    <link href="css/page.css" type="text/css" rel="stylesheet" />
    <link href="css/xccss.css" type="text/css" rel="stylesheet" />
    <style>
        #div1{
            float: left;
        }
        #div2 {
            float: right;
        }

    </style>

</head>
<body>
<div class="div1" id="div1" style="width: 30%;">

    <div class="input_div" style="margin-bottom: 80px;">
        <div class="head_img_">
            <img src="${pageContext.request.contextPath}${userinfo_ac.getHead_uri()}" alt="头像" />
        </div>
        <br />
    </div>

    <div class="input_div">
        <font class="font_">账户：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getUsername()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">邮箱：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getEmail()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">昵称：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getNickname()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">性别：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;男&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">学历：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;大学&nbsp;&nbsp;</b>
    </div>
    <div class="input_div">
        <font class="font_">工作：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getWork() }&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">地址：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getCity() }&nbsp;&nbsp;</b>
    </div>
    <div class="input_div">
        <font class="font_">兴趣：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getHobby() }&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">简介：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${userinfo_ac.getIntro() }&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <a class="input_" href="#">修改信息</a>
    </div>


</div>
<div style="width: 70%;" class="div2" id="div2">
<%-- 动态 --%>

    <c:if test="${userinfo_ac.getActivities() == null  } ">
        <div class="input_div">
            <font class="font_">Ta 留下了秘密~</font>
        </div>
    </c:if>
    <c:forEach items="${userinfo_ac.getActivities() }" var="ac">
        <div class="input_div">
            <font class="font_">${ac.getContext() }</font>
            <c:if test="${userinfo_ac.getId() == userinfo.getId()}">
                <button class="input_btn" id="input_btn" onclick="deleteAc('${ac.getId() }')">删除</button>
            </c:if>
            <div class="input_div" style="margin-bottom: 80px;">
                <c:if test="${ac.getUris() != null}">
                    <c:forEach items="${ac.getUris() }" var="uri">
                        <div class="head_img_">
                            <img src="${pageContext.request.contextPath}${uri }" alt="心情" />
                        </div>
                    </c:forEach>
                </c:if>
                <br />
                <c:if test="${userinfo != null}">
                    <c:if test="${likeac != null}">
                        <%int target = 0; %>
                        <c:forEach items="${likeac }" var="lac">
                            <c:if test="${lac.getActivity_id() == ac.getId() && lac.getUser_id() == userinfo_ac.getId()  }">
                                <% target = 1; %>
                                <%-- 退出循环 --%>
                                <c:set var="exitID" value="0"></c:set>
                            </c:if>
                        </c:forEach>
                        <c:if test="<%=target == 1%>">
                            <button class="input_btn" href="#" onclick="quxiao('${pageContext.request.contextPath}/quxiao', '${ac.getId() }')">取消</button>
                        </c:if>
                        <c:if test="<%=target == 0%>">
                            <button class="input_btn" href="#" onclick="dianzan('${pageContext.request.contextPath}/dianz','${ac.getId() }' )">点赞</button>
                        </c:if>
                    </c:if>
                    <c:if test="${likeac == null}">
                        <button class="input_" href="#" onclick="dianzan('${pageContext.request.contextPath}/dianz','${ac.getId() }' )">点赞</button>
                    </c:if>
                </c:if>

                <div style="font-size: 10px; float: initial;">时间：${ac.getTime() }</div>
            </div>
        </div>


        <br /><br /><br /><br /><br /><br />
    </c:forEach>


</div>
</body>
<script type="application/javascript">

    switch (${userinfo_ac.getSex() }) {
        case 0:{
            $('body > div:nth-child(5) > b').html('&nbsp;&nbsp;女&nbsp;&nbsp;');
        };break;
        case 1:{
            $('body > div:nth-child(5) > b').html('&nbsp;&nbsp;男&nbsp;&nbsp;');
        };break;
        case 2:{
            $('body > div:nth-child(5) > b').html('&nbsp;&nbsp;秘密&nbsp;&nbsp;');
        };break;
    }

    switch (${userinfo_ac.getEducation() }) {
        case 1:{
            $('body > div:nth-child(6) > b').html('&nbsp;&nbsp;小学&nbsp;&nbsp;')
        };break;
        case 2:{
            $('body > div:nth-child(6) > b').html('&nbsp;&nbsp;初中&nbsp;&nbsp;')
        };break;
        case 3:{
            $('body > div:nth-child(6) > b').html('&nbsp;&nbsp;高中&nbsp;&nbsp;')
        };break;
        case 4:{
            $('body > div:nth-child(6) > b').html('&nbsp;&nbsp;大学&nbsp;&nbsp;')
        };break;
        case 5:{
            $('body > div:nth-child(6) > b').html('&nbsp;&nbsp;硕士&nbsp;&nbsp;')
        };break;
        case 6:{
            $('body > div:nth-child(6) > b').html('&nbsp;&nbsp;博士&nbsp;&nbsp;')
        };break;
    }
    function deleteAc(acId) {
       $.ajax({
            url:"${pageContext.request.contextPath}/delete",//后台的接口地址
            type:"delete",//post请求方式
            data:acId,
            cache: false,
            processData: false,
            contentType: false,
            success:function (data) {
                alert(data.msg);
                window.location = "${pageContext.request.contextPath}/userinfo.view";
            },error:function () {
                alert("删除失败，请联系管理员");
            }
        });
    }
</script>
</html>
