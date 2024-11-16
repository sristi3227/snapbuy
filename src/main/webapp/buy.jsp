<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <p style="margin-bottom:20px; font-size:20px;">Your order has been placed successfully.</p>
    <p style="margin-bottom:20px; font-size:15px;">We will notify you when your item has shipped.</p>
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