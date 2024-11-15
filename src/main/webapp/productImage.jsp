<%@ page import="java.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Image</title>
    <style>
    	body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
     box-sizing:border-box;
      background-image: url('reg&log/wp.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
     background-color: #000; 
            color: white;
}
        /* Styling for the image display */
        .image-container {
           width: 55%;
    height: 500px;
    border: 2px solid maroon;
    margin: 100px auto;
    border-radius: 5px;
    padding: 25px 50px;
    
    background: black;
    box-shadow: 0 0 50px rgba(139, 0, 0, 1);
            
        }
        img {
            width: 50%;
            max-width: 600px;
            height: auto;
            width: 55%;
   
    display: flex;
    align-items: center;
    justify-content: center;
    
    background: black;
    box-shadow: 0 0 50px rgba(139, 0, 0, 1);
        }
    </style>
</head>
<body>

<%
    // Get the image URL from the request parameter
    String productImage = request.getParameter("image");

    // If no image is provided, set a default image
    if (productImage == null || productImage.isEmpty()) {
        productImage = "images/default.jpg"; // Default image path
    }
%>

<div class="image-container">
    <h2>Product Image</h2>
    <img src="<%= productImage %>" alt="Product Image">
</div>

</body>
</html>
