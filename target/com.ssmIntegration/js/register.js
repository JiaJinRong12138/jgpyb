
var sex = null;


function chageimg(obj){
	//选择图片马上预览
	var file = obj.files[0];
	var reader = new FileReader();

	reader.onload = function(e){
		var img = document.querySelector('body > div > form > div.head_img_ > img');
		img.src = e.target.result;
		imgres = img.src;
	}
	reader.readAsDataURL(file);
}
function getv(obj){
	sex = obj.value;
	console.log(obj.value);
}

function getSelecter(){
	console.log($('body > div > form > div:nth-child(10) > select').val())
}

function load(url) {
	if (isNull()) {
		var head = $('#file').val();
		var username = $('#username').val();
		var password = $('#password').val();
		var password_again = $('#password_again').val();
		var email = $('#email').val();
		var nickname = $('#nickname').val();
		var userSex = sex;
		var level = $('body > div > form > div:nth-child(10) > select').val();
		var work = $('#work').val();
		var addr = $('#addr').val();
		var hobby = $('#hobby').val();
		var intro = $('#about_self_').val();
		$.ajaxFileUpload({
			url: url + "/file",
			type: 'post',
			secureuri: false,         //一般设置为false
			fileElementId: 'file',     // 上传文件的id、name属性名
			allowType:'jpg,jpeg,png,JPG,JPEG,PNG',  //限制文件类型
			success: function(msg){
				console.log("SUCCESS");
			},
			error: function(msg){
				console.log("ERROR");
			}
		});
		$.ajax(url, {
			data: JSON.stringify({
				username:username,
				password:password,
				sex:userSex,
				email: email,
				nickname: nickname,
				education: level,
				work: work,
				city: addr,
				hobby: hobby,
				intro: intro
			}),
			contentType:"application/json",
			dataType: 'json',//服务器返回json格式数据
			secureuri: false,//是否启用安全提交  默认为false
			type: 'post',//HTTP请求类型

			timeout: 10000,//超时时间设置为10秒；
			success: function (data) {
				$('#tips').html(data.msg);
				if(data.msg == "注册成功"){
						window.location = "/jgpyb/";
				}
			},
			error: function (xhr, type, errorThrown) {
			}
		});
	}
}



function isNull() {
	var head = $('#file').val();
	var username = $('#username').val();
	var password = $('#password').val();
	var password_again = $('#password_again').val();
	var email = $('#email').val();
	var nickname = $('#nickname').val();
	var sex_ = sex;
	var level = $('body > div > form > div:nth-child(10) > select').val();
	var work = $('#work').val();
	var addr = $('#addr').val();
	var hobby = $('#hobby').val();

	if(head == ""){
		alert("请上传头像");
		return false;
	}
	if(username == ""){
		alert("请填写用户名");
		return false;
	}
	if(password == ""){
		alert("请填写密码");
		return false;
	}
	if(password_again == ""){
		alert("请填写密码");
		return false;
	}
	if(password != password_again){
		alert("两次密码不一样");
		return false;
	}
	if(email == ""){
		alert("请填写邮箱");
		return false;
	}
	if(nickname == ""){
		alert("请填写昵称");
		return false;
	}
	if(sex_ == null){
		alert("请选择性别");
		return false;
	}
	if(level == 0){
		alert("请选择学历");
		return false;
	}
	if(work == ""){
		alert("请填写工作");
		return false;
	}
	if(addr == ""){
		alert("请填写地址");
		return false;
	}
	if(hobby == ""){
		alert("请填写兴趣");
		return false;
	}
	return true;
}
			
			