<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.time.LocalDate" %>

<html>
<head>
    <title>Product Confirmation</title>
   
    <link rel="stylesheet" type="text/css" href="confirm.css">
</head>
<body>
<%
String id = request.getParameter("id");
String selectedSize = request.getParameter("selectedSize");
String selectedQuantity = request.getParameter("selectedQuantity");

String url = "jdbc:mysql://localhost:3306/project_e";
String username = "root";
String password = "W7301@jqir#";

Connection conn = null;
PreparedStatement pst = null;
ResultSet rs = null;
String name = "", description = "";
double price = 0.0;

try {
    // Fetch product details from the `tops` table
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    String query = "SELECT * FROM tops WHERE id = ?";
    pst = conn.prepareStatement(query);
    pst.setString(1, id);
    rs = pst.executeQuery();

    if (rs.next()) {
        name = rs.getString("name");
        price = rs.getDouble("price");
        description = rs.getString("description");
    } else {
        out.println("<p>No product found with the given ID.</p>");
    }
    
    // Insert product details along with selected size and quantity into `product_history` table
    if (selectedSize != null && selectedQuantity != null && !selectedSize.isEmpty() && !selectedQuantity.isEmpty()) {
        String insertQuery = "INSERT INTO product_history (product_name, price, description, selected_size, quantity) VALUES (?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(insertQuery);
        pst.setString(1, name);
        pst.setDouble(2, price);
        pst.setString(3, description);
        pst.setString(4, selectedSize);
        pst.setInt(5, Integer.parseInt(selectedQuantity));
        pst.executeUpdate();
        
        // Redirect to the history page after inserting the record
        response.sendRedirect("buy.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>Error: " + e.getMessage() + "</p>");
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

<!-- HTML Form inside a container -->
<div class="container">
    <h2>Product Confirmation</h2>
    <form method="post" action="confirm.jsp?id=<%= id %>">
        <table id="productDetails">
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
            <tr>
                <th>Selected Size</th>
                <td >
                    <select name="selectedSize">
                    <option>Select size</option>
                    <option>XXL</option>
                    <option>XL</option>
                    <option>LARGE</option>
                    <option>MEDIUM</option>
                    <option>SMALL</option>
                </select>
                </td>
            </tr>
            <tr>
                <th >Quantity</th>
                <td>
                    <input class="inputs" type="number" name="selectedQuantity" required min="1" placeholder="Enter quantity">
                </td>
            </tr>
        </table>

        <!-- Additional fields outside the table -->
        <div>
            <label for="userAddress">Delivery Address:</label>
            <input type="text" name="userAddress" required placeholder="Enter delivery address" style="width: 100%; height: 60px; border: 2px solid red; background-color: black; color: white"></textarea>
        </div>

        <div style="margin-top: 4px">
            <label for="deliveryDate">Estimated Delivery Date:</label>
            <input type="text" value="<%= LocalDate.now().plusDays(5) %>" disabled>
        </div>

        <div style="margin-top: 4px">
            <label for="paymentOption">Payment Option:</label><br>
            <div style="display:flex; flex-direction: row; align-items: center; justify-content: start; gap: 6px"><input type="radio" name="paymentOption" value="cod" checked> Cash on Delivery</div>
        </div>

        <button type="submit" name="action" value="add to history" style="margin-top: 20px; border: 2px solid red; background-color: black; color: white; border-radius: 10px; padding: 6px">Pay Now</button>
    </form>
</div>
</body>
</html>
