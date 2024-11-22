<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="confirmation1.css">
</head>
<body>
    <div class="confirmation-container">
       <h2 style="margin-bottom:20px; font-size:40px;">Thank you for Your Purchase!</h2>
    <p style="margin-bottom:20px; font-size:20px; font-weight:bold;">Your order has been placed successfully.</p>
    <p style="margin-bottom:20px; font-size:15px; font-weight:bold;">We will notify you when your item has shipped.</p>
       <div class="opt">
        <form action="purchaseHistory.jsp" method="get">
        <button type="submit" class="btns" class="btn" >View your Purchase History</button>
    </form>
       <br><br>
        <a href="dashboard.jsp" class="btns">Continue to Shopping</a>
    </div>
    </div>
</body>
</html>