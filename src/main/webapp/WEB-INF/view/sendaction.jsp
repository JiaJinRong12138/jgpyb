<%--
  Created by IntelliJ IDEA.
  User: jjr
  Date: 2019/12/18
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发表动态</title>
    <link href="css/page.css" type="text/css" rel="stylesheet" />
    <link href="css/xccss.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery-3.4.0.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    <script src="js/action.js"></script>
</head>
<body>
<div class="input_div">
    <font class="font_">记录美好生活</font>
    <br />
    <textarea type="textarea" class="textarea_1" id="about_self_" ></textarea><br />
    <form id="form" method="post" enctype="multipart/form-data">
        <input id="file" name="file" type="file" multiple="multiple"/>
        <input class="input_submit" id="upload" name="upload" type="button" value="上传">
    </form>
    <input class="input_submit_" type="button" value="发表" onclick="sendaction('${pageContext.request.contextPath}/sendac')" />

</div>

</body>
</html>
