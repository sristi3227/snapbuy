<%@ page import="java.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String productName = request.getParameter("name");
    String url = "jdbc:mysql://localhost:3306/project_e";
    String username = "root";
    String password = "W7301@jqir#";

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String name = "", imageUrl = "", description = "";
    double price = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        String query = "SELECT * FROM tops WHERE name = ?";
        pst = conn.prepareStatement(query);
        pst.setString(1, productName);
        rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            imageUrl = rs.getString("image_url");
            price = rs.getDouble("price");
            description = rs.getString("description");
        } else {
            out.println("<p>No product found with the given name.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <link rel="stylesheet" href="newbuy1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
    <!-- Header Section -->
    <div class="header border-container">
        <div class="logo">
            <img src="images/logo.jpg" height="60px">
            <h1>SnapBuy</h1>
        </div>
        <div class="links">
            <a href="logout.jsp" title="Logout" class="menu fw-bold"><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i>Logout</a>
            <a href="#shop" class="menu fw-bold"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Shop</a>
            <a href="fashion.jsp" class="menu fw-bold"><i class="ri-arrow-go-back-fill"></i>Back</a>
        </div>
    </div><br>

    <!-- Product Details Section -->
    <div class="small-container single-product">
        <div class="rows">
            <div class="col-2">
                <img src="<%= imageUrl %>" width="100%" id="ProductImg">
            </div>
            <div class="col-2">
                <h1><%= name %></h1>
                <h4>₹<%= price %></h4>

                <h3>Product Details:</h3>
                <br>
                <p><%= description %></p>
            </div>
        </div>
    </div>

</body>
</html>
