<%@ page import="java.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            height: 100%; /* Ensure body covers full height */
            background-image: url('reg&log/wp.jpg');
            background-size: cover; /* Make the background image cover the entire page */
            background-repeat: no-repeat; /* Avoid repeating the background */
            background-position: center center; /* Center the background image */
            background-color: #000;
            color: white;
        }

        /* Styling for the Back Button */
        .backBtn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
        }

        .backBtn:hover {
            background-color: #555;
        }

        .table-container {
            background-color: black;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        #historyTable {
            width: 100%;
            border-collapse: collapse;
        }

        #historyTable th, #historyTable td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        #historyTable th {
            background-color: #black;
        }

        #historyTable tr:nth-child(even) {
            background-color: black;
        }

        #historyTable tr:hover {
            background-color: black;
        }

        .cancelBtn {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius:5px;
        }

        .cancelBtn:hover {
            background-color: darkred;
        }

        .viewImageBtn {
            background-color: blue;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius:5px;
        }

        .viewImageBtn:hover {
            background-color: darkblue;
            
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.7);
            padding-top: 60px;
        }

        .modal-content {
            margin: auto;
            display: block;
            max-width: 95%;
            max-height: 80%;
            object-fit: contain;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 15px;
            right: 35px;
            transition: 0.3s;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Styling for the delivery message */
       .delivery-message {
    position: fixed;
    bottom: 0;
    width: 100%;
    text-align: center;
    padding: 15px;
    font-size: 18px;
    background-color: #333;
    color: white;
    border-radius: 5px 5px 0 0; /* Rounded top corners */
    margin: 0;
    z-index: 999; /* Ensure it's above other elements */
}
    </style>

    <script>
        // Function to open the modal and show the image
        function openModal(imageUrl) {
            var modal = document.getElementById("myModal");
            var modalImg = document.getElementById("modalImg");
            modal.style.display = "block";
            modalImg.src = imageUrl;
        }

        // Function to close the modal
        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }
    </script>
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
        <a href="dashboard.jsp" class="menu fw-bold"><i class="ri-arrow-go-back-fill"></i>Back To Home</a>
    </div>
</div><br>

<!-- Back Button -->
<h1>Purchase History</h1>

<%
String url = "jdbc:mysql://localhost:3306/project_e";
String username = "root";
String password = "W7301@jqir#";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    // Connect to the database
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    
    // Query to fetch the purchase history
    String query = "SELECT * FROM product_history";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);

    // Display the results in a table inside a container
    %>
    <div class="table-container">
        <table id="historyTable">
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Selected Size</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Purchase Date</th>
                <th>Product Image</th>
                <th>Action</th>
            </tr>
        <%
        while (rs.next()) {
            int historyId = rs.getInt("id"); 
            String productName = rs.getString("product_name");
            double price = rs.getDouble("price");
            String description = rs.getString("description");
            String selectedSize = rs.getString("selected_size");
            int quantity = rs.getInt("quantity");
            double totalPrice = price * quantity; 
            Timestamp purchaseDate = rs.getTimestamp("purchase_date"); 
            String imagePath;
            switch(productName) {
                case "Stylish Trendy Top":
                    imagePath = "images/Top1.jpg";
                    break;
                case "Mesh Top":
                    imagePath = "images/Top3.jpg";
                    break;
                case "Ladies Top":
                    imagePath = "images/Top2.jpg";
                    break;
                case "Party Wear Top":
                    imagePath = "images/Top4.jpg";
                    break;
                default:
                    imagePath = "images/default.jpg";
            }
        %>
            <tr>
                <td><%= productName %></td>
                <td>₹<%= price %></td>
                <td><%= description %></td>
                <td><%= selectedSize %></td>
                <td><%= quantity %></td>
                <td>₹<%= totalPrice %></td>
                <td><%= purchaseDate != null ? purchaseDate.toString() : "N/A" %></td>
                <td><button class="viewImageBtn" onclick="openModal('<%= imagePath %>')">View Image</button></td>
                <td>
                    <form method="post" action="purchaseHistory.jsp" onsubmit="confirmCancel(event, this)">
                        <input type="hidden" name="historyId" value="<%= historyId %>">
                        <button type="submit" name="action" value="cancel" class="cancelBtn">Cancel Order</button>
                    </form>
                </td>
            </tr>
        <%
        }
        %>
        </table>
    </div>
<%
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>Error retrieving purchase history: " + e.getMessage() + "</p>");
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

if ("cancel".equals(request.getParameter("action"))) {
    int historyId = Integer.parseInt(request.getParameter("historyId"));
    Connection cancelConn = null;
    PreparedStatement cancelStmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        cancelConn = DriverManager.getConnection(url, username, password);

        String deleteQuery = "DELETE FROM product_history WHERE id = ?";
        cancelStmt = cancelConn.prepareStatement(deleteQuery);
        cancelStmt.setInt(1, historyId);
        int rowsAffected = cancelStmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>alert('Order canceled successfully');</script>");
        } else {
            out.println("<script>alert('Error: Order could not be canceled');</script>");
        }

        response.sendRedirect("purchaseHistory.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error canceling the order: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (cancelStmt != null) cancelStmt.close();
            if (cancelConn != null) cancelConn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>

<!-- Modal for Image Preview -->
<div id="myModal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImg">
</div>

<!-- Bottom Message for Delivery Info -->
<div class="delivery-message">
    <p>The items will be delivered within 3-5 days after purchasing.</p>
</div>

</body>
</html>
