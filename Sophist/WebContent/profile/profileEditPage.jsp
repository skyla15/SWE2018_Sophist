<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbControl.MemberDAO" %>
<%@ page import="dbControl.MemberDTO" %>

<%
    request.setCharacterEncoding("UTF-8");
    //로그인 체크
    if(session.getAttribute("memId")==null){
%>
   <jsp:forward page="/Sophist/login/loginPage.jsp" />
<%
    // 접근방식 체크 본인여부 확인
    }else if(!session.getAttribute("AuthLevel").equals("manager") && (request.getParameter("user_id")==null || request.getParameter("user_id")=="" || Integer.parseInt(request.getParameter("user_id")) != (Integer)session.getAttribute("memId")) ){%>
<script>
    alert("잘못된 방식의 접근입니다.");
    history.go(-1);
</script>
<%
    }else{
    	int memId = Integer.parseInt((request.getParameter("user_id").toString()));
        MemberDAO memDao = new MemberDAO();
        MemberDTO profile = memDao.getProfile(memId);
%>
 <script language = "javascript"> // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.writeform;
   
   if(!form.passwd.value)   //form에 name값이 없을 때
   {
    alert( "변경할 비밀번호를 입력하세요" ); //경고창 띄움
    form.passwd.focus(); //form에 있는 name입력 위치로 이동
    return ;
   }
 
  form.submit(); //if문 모두 충족시 제출
  }
 </script>
<html>
<head>
    <title>프로필 편집</title>
    <link href="/Sophist/assets/css/css_main.css" type="text/css" rel="stylesheet">
</head>
<body>

<div class="content-area">
    <div class="profile-edit-box">
        <div class="profile-edit-header">
            <h1>프로필 편집</h1>
            <p class="align-right-header-font">프로필 사진을 클릭해서 사진을 변경할 수 있습니다.</p>
            <hr>
        </div>
        <div class="profile-edit-main">
            <div class="profile-edit-img-div">
                <a href="profileImageUpload.jsp?user_id=<%=memId%>">
                    <img src="${pageContext.request.contextPath}<%=profile.getProfile_img()%>" class="profile-edit-img">
                </a>
            </div>
            <div class="profile-edit-content">
                <form name=writeform class="profile-edit-form" action=profileEditPro.jsp method="post">
                    <input type="hidden" value="<%=profile.getId()%>" name="id">
                    <br>
                    <p>
                        <label>Nick Name</label><br>
                        <input type="text" name="nick" value="<%=profile.getNick()%>">
                    </p>
                    <p>
                        <label>Password</label><br>
                        <input type="password" name="password" id="passwd" value="<%=profile.getPassword()%>">
                    </p>
                    <p>
                        <label>소개</label><br>
                        <input type="text" name="profile_comment" value="<%=profile.getProfile_comment()%>">
                    </p>
                    <p>
                        <button OnClick="javascript:writeCheck(); return false;" type="submit" class="profile-img-change-button">제출</button>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%
     }
%>