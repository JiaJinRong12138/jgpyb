function sendaction(url) {
    $.ajax(url, {
        data:{
            context: $('#about_self_').val()
        },
        contentType:"application/json",
        dataType: 'json',//服务器返回json格式数据
        secureuri: false,//是否启用安全提交  默认为false
        type: 'post',//HTTP请求类型
        timeout: 10000,//超时时间设置为10秒；
        success: function (data) {
            alert(data.msg);
            if(data.msg == "发布成功"){
                window.location = "/jgpyb/";
            }
        },
        error: function (xhr, type, errorThrown) {
        }
    });

}


$(window).ready(function () {
    $("#upload").click(function () {
        if($('#file').val() != ""){
            var formData = new FormData($('#form')[0]);//获取表单中的文件
            //ajax请求
            $.ajax({
                url:"/jgpyb/sendac/uploadfile",//后台的接口地址
                type:"post",//post请求方式
                data:formData,//参数
                cache: false,
                processData: false,
                contentType: false,
                success:function (data) {
                    alert(data.msg);
                },error:function () {
                    alert("上传失败，请联系管理员");
                }
            })
        }
        else{
            alert("请选择文件")
        }
    });

});

function dianzan(uri, acId) {
    $.ajax({
        url:uri,//后台的接口地址
        type:"put",
        data:acId,
        success:function (data) {
            console.log(data.msg);
            location.reload();
        },error:function () {
            alert("点赞失败，请联系管理员");
        }
    });

}

function quxiao(uri, acId) {
    $.ajax({
        url:uri,//后台的接口地址
        type:"put",
        data:acId,
        success:function (data) {
            console.log(data.msg);
            location.reload();
        },error:function () {
            alert("点赞失败，请联系管理员");
        }
    });

}