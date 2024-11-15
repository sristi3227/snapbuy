<%@ page import="java.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");
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
        String query = "SELECT * FROM tops WHERE id = ?";
        pst = conn.prepareStatement(query);
        pst.setString(1, id);
        rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            imageUrl = rs.getString("image_url");
            price = rs.getDouble("price");
            description = rs.getString("description");
        } else {
            out.println("<p>No product found with the given ID.</p>");
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
    <title>Product Container</title>
    <link rel="stylesheet" href="newbuy1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet" />
</head>
<body>
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

<div class="small-container single-product">
    <div class="rows">
        <div class="col-2">
            <img src="<%= imageUrl %>" width="100%" id="ProductImg">
        </div>
        <div class="col-2">
            <h1><%= name %></h1>
            <h4>₹<%= price %></h4>

            <a href="javascript:void(0);" class="btn" id="addToCartBtn">Add to Cart</a>

            <h3>Product Details :~</h3>
            <br>
            <p><%= description %></p>
        </div>
    </div>
</div>

<div id="hiddenSection" style="display:none;">
    <div class="product-container" id="productContainer">
        <img src="<%= imageUrl %>" alt="<%= name %>">
        <h2><%= name %><br> <p style="font-size:15px; color:black">Added to cart</p></h2>
        <button class="close-btn" id="closeBtn">×</button>
    </div>

    <table id="productDetails" style="display:none;">
        <tr>
            <th>Product Name</th>
            <td><%= name %></td>
        </tr>
        <tr>
            <th>Price</th>
            <td>₹<%= price %></td>
        </tr>
        <tr>
            <th>Description</th>
            <td><%= description %></td>
        </tr>
    </table>

    <div class="foot" style="display:none;" id="footSection">
        <a href="confirm.jsp?id=<%= id %>" id="buyButton" class="menu fw-bold">Buy Now</a>
    </div>
</div>

<div id="emptyCartMessage" style="display:none;">There is no item in the cart.</div>

<!--------------------------------------------------------------------------------------------->

<script>
    document.getElementById("addToCartBtn").addEventListener("click", function() {
        document.getElementById("hiddenSection").style.display = "block";
        document.getElementById("productDetails").style.display = "none";
        document.getElementById("emptyCartMessage").style.display = "none";
    });

    // Show table, total price, and buy button when the container is clicked
    document.getElementById('productContainer').addEventListener('click', function() {
        document.getElementById('productDetails').style.display = 'table';
        document.getElementById('footSection').style.display = 'block';
        document.getElementById('buyButton').style.display = 'inline-block';
    });

    // Close the table and hide buy button
    document.getElementById('closeBtn').addEventListener('click', function(event) {
        event.stopPropagation();
        document.getElementById('productContainer').style.display = 'none';
        document.getElementById('productDetails').style.display = 'none';
        document.getElementById('footSection').style.display = 'none';
        checkIfCartIsEmpty();
    });

    // Check if cart is empty and show message
    function checkIfCartIsEmpty() {
        var productContainer = document.getElementById('productContainer');
        if (productContainer.style.display === 'none') {
            document.getElementById('emptyCartMessage').style.display = 'block';
        }
    }
</script>
</body>
</html>
