<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Photoblog</title>
    <link href="/Sophist/assets/css/css_main.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="content-area">
    <div class="login-box">
        <div class="login-greet">
            Welcome to PhotoBlog!
        </div>
        <div class="login-form">
        
            <form action="${pageContext.request.contextPath}/login/loginPro.jsp" method="post">
                <input type="email" placeholder="E-mail" name="email" class="login-box-input login-placeholder"><br><br>
                <input type="password" placeholder="Password" name="password" class="login-box-input login-placeholder"><br><br>
                <input type="submit" value="로그인" class="login-button">
            </form>
        </div>
        <div class="regist-recommend">
            <p>
                아직 회원이 아니신가요?&nbsp;&nbsp;<a href="/Sophist/Registration/registerPage.jsp"><font style="color:#66bfff;">가입하기</font></a>
            </p>
        </div>
    </div>
</div>
</body>
</html>