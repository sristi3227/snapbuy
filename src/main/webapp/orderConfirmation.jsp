<%@ page import="java.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="confirm.css">
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .confirmation-message {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .purchase-history-button {
            text-align: center;
        }
        .button {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Order Confirmed</h1>
    <p class="confirmation-message">Your order has been successfully added to your history!</p>
    
    <!-- Button to view purchase history -->
    <div class="purchase-history-button">
        <a href="purchaseHistory.jsp" class="button">View Purchase History</a>
    </div>
</div>

</body>
</html>
