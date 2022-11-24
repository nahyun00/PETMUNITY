<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://kit.fontawesome.com/764f658d1a.js" crossorigin="anonymous"></script>
<title>펫뮤니티</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; // 기본페이지
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
		 int boardID = 0;
			if (request.getParameter("boardID") != null){
				boardID = Integer.parseInt(request.getParameter("boardID"));
			}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp" style="padding: 15px 0px 0px 10px;">
				<img src="images/petmunity_logo.png" style="width : 90px; height : 37px; padding: 0; ">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background:#fff;">
			<ul class="nav navbar-nav" style="margin-left: 15px;">
				<% if (boardID == 1){ %>
					<li class="active"><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
					<li><a href="find.jsp"><b>검색</b></a></li>
					<li><a href="box.jsp"><b>채팅</b></a></li>
				<%} else if(boardID == 2){ %>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li class="active"><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
					<li><a href="find.jsp"><b>검색</b></a></li>
					<li><a href="box.jsp"><b>채팅</b></a></li>
				<% } else if(boardID == 3){%>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li class="active"><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
					<li><a href="find.jsp"><b>검색</b></a></li>
					<li><a href="box.jsp"><b>채팅</b></a></li>
				<% } else if(boardID == 4){%>
					<li><a href="bbs.jsp?boardID=1&pageNumber=1"><b>자유</b></a></li>
					<li><a href="bbs.jsp?boardID=2&pageNumber=1"><b>장터</b></a></li>
					<li><a href="bbs.jsp?boardID=3&pageNumber=1"><b>입양</b></a></li>
					<li class="active"><a href="bbs.jsp?boardID=4&pageNumber=1"><b>문의</b></a></li>
					<li><a href="find.jsp"><b>검색</b></a></li>
					<li><a href="box.jsp"><b>채팅</b></a></li>
				<% } %>
			</ul>
			<%
				if(userID == null){		//로그인이 되어있지 않은 경우
			%>
			<ul class="nav navbar-nav navbar-right" style="padding:0;">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false"><i class="fa-solid fa-power-off" style="color:rgb(252, 186, 44); padding-right: 10px;"></i><span class="caret"></span></a>
        		<ul class="dropdown-menu">
              		<li><a href="login_form.jsp" style="margin:0;">로그인 / 회원가입</a></li>
            		</ul>    
         		</li>
       		</ul>
			<% 
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false"><i class="fa-solid fa-power-off" style="color:rgb(252, 186, 44); padding-right: 10px;"></i><span class="caret"></span></a>
        		<ul class="dropdown-menu">
        			<li><a href="userUpdate.jsp">마이페이지</a></li>
        			<li><a href="profileUpdate.jsp">프로필 수정</a></li>
        			<li><a href="logoutAction.jsp">로그아웃</a></li>
            	</ul>    
         		</li>
       		</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
	<%
		if(boardID == 1){
	%>
			<h1>자유게시판<br></h1>
			<p>회원들과 서로 존중하며 자유로운 소통을 이곳에서 나눠보세요!<br><br></p>
	<% }
		else if(boardID == 2){
	%>
			<h1>장터게시판<br></h1>
			<p>회원들끼리 거래를 나눌 수 있는 게시판입니다. 상호 존중하며 거래를 이용합시다!<br><br></p>
	<% }
		else if(boardID == 3){
	%>
			<h1>입양게시판<br></h1>
			<p>반려동물 입양게시판입니다. 입양은 늘 신중히 선택해야 합니다!<br><br></p>
	<% }
		else if(boardID == 4){
	%>
			<h1>문의게시판<br></h1>
			<p>문의게시판입니다. 궁금한 점이 있다면 자유롭게 물어보세요!<br><br></p>
	<% } 
	%>
	
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(boardID, pageNumber);
							for(int i=0; i<list.size(); i++){	
						%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?boardID=<%=boardID%>&bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<form name = "p_search">
					<input type="button" value="검색" onclick="nwindow(<%=boardID%>)" style="background:rgb(252, 186, 44); border:none; color:#fff; padding:5px 13px 5px 13px;" />
					<a href="write.jsp?boardID=<%=boardID%>" class="btn-primary pull-right" style="background:rgb(252, 186, 44); padding:5px 18px 5px 18px;">작성</a>
				</form>				
			</div>
		</div>
		<div class=container style="text-align:center">
			<%
				BbsDAO bbsDAO1 = new BbsDAO();
				int pages = (int) Math.ceil(bbsDAO1.getCount(boardID)/10)+1;
				for(int i=1; i<=pages; i++){ %>
					<button type="button" onclick="location.href='bbs.jsp?boardID=<%=boardID %>&pageNumber=<%=i %>'"><%=i %></button>
				<%} %>
		</div>
	</div>
	
	<script>
	/* 게시물 검색 함수 */
	function nwindow(boardID){
		window.name = "parant";
		var url= "search.jsp?boardID="+boardID;
		window.open(url,"","width=250,height=200,left=300");
	}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>