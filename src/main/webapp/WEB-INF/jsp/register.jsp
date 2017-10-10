<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-6
  Time: 下午11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>

</body>
</html>

<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <style>
    </style>
</head>
<body>
<div>
    <h1>
        注册
    </h1>
    <form id="myform" action="/homework/user/register">
        <label for="username">用户名：</label>
        <input type="text" id="username" name="username"><span></span><br>
        <label>设置密码：</label>
        <input type="password" id="password" name="password"><span></span><br>
        <label for="password2">确认密码：</label>
        <input type="password" id="password2" name="password2"><span></span><br>
        <label for="email">邮箱：</label>
        <input type="email" id="email" name="email"><span></span><br>
        <label>昵称：</label>
        <input type="text" id="nickname" name="nickname"><span></span><br>
        <label>学院：</label>
        <input type="text" id="college" name="college"><span></span><br>
        <label>年级：</label>
        <input type="text" id="grade" name="grade"><span></span><br>
        <label>专业：</label>
        <input type="text" id="major" name="major"><span></span><br>
        <label>班级：</label>
        <input type="text" id="classes" name="classes"><span></span><br>
        <label>方向：</label>
        <input type="text" id="area" name="area"><span></span><br>

        <input type="submit" value="提交">
        <input type="reset" value="重置" id="reset"><span></span>
    </form>
</div>
<script>
    //账号验证
    function zhanghao_yz() {
        var reg = /^[A-Za-z]\w+$/; //正则表达式 必须以字母开头的账号
        if ($("#username").val().search(reg) == -1) {
            $("#username").next().html("账号必须是以 字母开头的 可以包含数字字母下划线的字符串");
            /*alert("密码只能是6-9位数字");*/
            return false;
        } else {
            $("#username").next().html("账号验证成功");
            /*  alert("验证成功");*/
            return true;
        }
        return true;
    }

    function password_check2() {
        if ($("#password").val() != $("#password2").val()) {
            $("#password2").next().html("两次输入的密码不相同");
            return false;
        } else {
            $("#password2").next().html("密码确认成功");
            return true;
        }

    }


    //邮箱验证
    function email_check() {
        var reg = /^\w+@\w+(\.\w+){1,2}$/; //因为邮箱 xxx @ xxx . xxx     xxx 可以是 数字字母下划线 结束 可以 是 .com 或者 .com.cn
        if ($("#email").val().search(reg) == -1) {
            $("#email").next().html("邮箱格式不正确 xxx @ xxx . xxx");
            return false;
        } else {
            $("#email").next().html("邮箱验证成功");
            return true;
        }
        return true;
    }

    $("#username").blur(zhanghao_yz);
    $("#password2").blur(password_check2);
    $("#email").blur(email_check);

    function tijiao() {
        /* alert( typeof (zhanghao_yz() && password_check() && password_check2() && email_check() && mobile_check() && web_check()));
         * 这里弹出 boolean 类型的值
         * */
        if($("#password").val() != $("#password2").val()){
            return false;
        }

        if ($("#username").val() == "" || $("#password").val() == "" || $("#email").val() == "" || $("#nickname").val() == ""
            || $("#college").val() == "" || $("#grade").val() == "" || $("#classes").val() == "" || $("#major").val() == "" || $("#area").val() == "") {
            $("#reset").next().html("看看你是不是填完了");
            return false;
        }
        if (!(zhanghao_yz() &&  password_check2() && email_check() )) { //只要有其中一项 返回值是 false 就会 进入 这个 语句
            $("#reset").next().html("上面的验证都通过了吗？");
            return false;
        } else {
            $("#reset").next().html("好的 验证通过了。");
            return true;
        }
        return true;
    }
    $("#myform").submit(function() {
        return tijiao();
    });
</script>
</body>
</html>
