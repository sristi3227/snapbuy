<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="login2.css">
<link
    href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
    rel="stylesheet"
/>
</head>
<body>

	<%
	HttpSession session1=request.getSession();
	String user=(String)session1.getAttribute("user");
	if(user!=null){
		response.sendRedirect("dashboard.jsp");
	}
%>
	
	<div class="container">
		<form id="loginForm" action="checklogine" method="post" onsubmit="return validateForm()">
			<div class="title">
				<h2>Hello, Welcome Back</h2>
			</div>
			<div class="form-field">
				<i class="ri-user-3-fill"></i>
				<input type="email" placeholder="username" name="username">
			</div>
			<div class="form-field">
				<i class="ri-lock-password-fill"></i>
				<input type="password" placeholder="password" name="pwd">
			</div>
			<div class="button-field">
				<input type="submit" value="Login">
			</div><br>
			<p>New User?<a href="register.jsp" style="text-decoration:none; color:#6c5bc4">Sign Up Here</a></p>
		</form>
		<div class="background"></div>
	</div>
	<div id="notification" >
		<div class='box' id='box' value="<%=(String)request.getAttribute("msg")%>">
		<p class='error' >Login failed!</p>
	</div> 
</div>
 

<script>
var box = document.getElementById("box");

if (box.getAttribute("value") === "failed") {
    const notification = document.getElementById("notification");
    
    
    notification.classList.add("show");
    box.classList.add("show");
    
    
    setTimeout(() => {
        notification.classList.remove("show");
        box.classList.remove("show");
    }, 3000);
}

	function validateForm(){
		var username=document.getElementById("loginForm").username.value;
		var pwd=document.getElementById("loginForm").pwd.value;

	if(username==='' || pwd===''){
		alert("Username and Password required");
		return false;
	}
	return true;
	}
</script>
	
</body>
</html>