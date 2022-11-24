<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="loginStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> 
    <title>펫뮤니티 로그인</title>
</head>

<body>
    <%
       String userID = null;
       if(session.getAttribute("userID") != null) {
    	   userID = (String) session.getAttribute("userID");
       }
       if(userID != null) {
    	  session.setAttribute("messageType", "오류 메시지");
    	  session.setAttribute("messageContent", "현재 로그인이 되어 있는 상태입니다.");
    	  response.sendRedirect("index.jsp");
    	  return;
       }
    %>
    
  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="images/frontImg.jpg" alt=""> 
        <div class="text">
          <span class="text-1">펫뮤니티에 오신 것을<br> 환영합니다!</span>
          <span class="text-2">모두와 함께 소통을 나눠보세요</span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="images/backImg.jpg" alt=""> 
        <div class="text">
          <span class="text-1">펫뮤니티에 오신 것을<br> 환영합니다!</span>
          <span class="text-2">모두와 함께 소통을 나눠보세요</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">로그인</div>
              <form method="post" action="./userLogin">
                <div class="input-boxes">
                  <div class="input-box">
                    <i class="fas fa-envelope"></i>
                    <input type="text" placeholder="아이디를 입력하세요" name="userID" required>
                  </div>
                  <div class="input-box">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="비밀번호를 입력하세요" name="userPassword" required>
                  </div>
                  <div class="text"><a href="#">비밀번호를 잊으셨나요?</a></div>
                  <div class="button input-box">
                    <input type="submit" value="로그인">
                  </div>
                  <div class="text sign-up-text">처음 방문하셨나요? <label for="flip">회원가입</label></div>
                </div>
              </form>
          </div>
          
          <div class="signup-form">
            <div class="title">회원가입</div>
        	  <form method="post" action="./userRegister">
                <div class="input-box">
                  <i class="fas fa-envelope"></i>
                  <input type="text" placeholder="아이디를 입력하세요" name="userID" required>
                </div>
                <div class="input-box">
                  <i class="fas fa-lock"></i>
                  <input type="password" placeholder="비밀번호를 입력하세요" name="userPassword" required>
                </div>
                <div class="input-box">
                  <i class="fas fa-user"></i>
                  <input type="email" placeholder="이메일을 입력하세요" name="userEmail" required>
                </div>
                <div class="input-box">
                  <i class="fas fa-location-arrow"></i>
                  <input type="text" placeholder="지역을 입력하세요" name="userArea" required>
                </div>
                <div class="button input-box">
                  <input type="submit" value="가입">
                </div>
                <div class="text sign-up-text">이미 계정이 있으신가요? <label for="flip">로그인</label></div>
        	  </form>
          </div>
        </div>
    </div>
  </div>
</body>
</html>