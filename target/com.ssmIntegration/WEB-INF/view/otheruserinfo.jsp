<%--
  Created by IntelliJ IDEA.
  User: jjr
  Date: 2019/12/18
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <c:if test="${otheruserinfo == null}"><title>信息</title></c:if>
    <c:if test="${otheruserinfo != null}"><title>${otheruserinfo.getNickname() }</title></c:if>
    <script src="js/jquery-3.4.0.min.js"></script>
    <script src="js/action.js"></script>
    <link href="css/page.css" type="text/css" rel="stylesheet" />
    <link href="css/xccss.css" type="text/css" rel="stylesheet" /> <style>
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
            <img src="${pageContext.request.contextPath}${otheruserinfo.getHead_uri()}" alt="头像" />
        </div>
        <br />
    </div>

    <div class="input_div">
        <font class="font_">账户：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${otheruserinfo.getUsername()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">邮箱：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${otheruserinfo.getEmail()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">昵称：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${otheruserinfo.getNickname()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">性别：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;女&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">兴趣：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${otheruserinfo.getHobby()}&nbsp;&nbsp;</b>
    </div>

    <div class="input_div">
        <font class="font_">简介：&nbsp;&nbsp;&nbsp;&nbsp;</font>
        <b class="input_">&nbsp;&nbsp;${otheruserinfo.getIntro()}&nbsp;&nbsp;</b>
    </div>
    <div class="input_div">
        <a class="input_" href="#">喜欢</a>
    </div>
</div>
<div style="width: 70%;" class="div2" id="div2">
    <%-- 动态 --%>

    <c:if test="${otheruserinfo.getActivities() == null}">
        <div class="input_div">
            <font class="font_">Ta 留下了秘密~</font>
        </div>
    </c:if>

    <c:forEach items="${otheruserinfo.getActivities() }" var="ac">
        <div class="input_div">
            <font class="font_">${ac.getContext() }</font>
            <c:if test="${otheruserinfo.getId() == userinfo.getId()}">
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
                            <c:if test="${lac.getActivity_id() == ac.getId() && lac.getUser_id() == userinfo.getId()  }">
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
    switch (${otheruserinfo.getSex() }) {
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
</script>
</html>
