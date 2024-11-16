<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="confirmation.css">
</head>
<body>
    <div class="confirmation-container">
        <h1>Thank You for Your Purchase!</h1>
        <p>Your order has been successfully placed.</p>
        
        <div class="order-details">
            <p><strong>Order ID:</strong> <%= request.getAttribute("orderId") %></p>
            <p><strong>Product:</strong> <%= request.getAttribute("productName") %></p>
            <p><strong>Amount Paid:</strong> <%= request.getAttribute("amountPaid") %></p>
        </div>
        
        <p>We will notify you when your item has shipped.</p>
        <a href="dashboard.jsp">Continue Shopping</a>
    </div>
</body>
</html>