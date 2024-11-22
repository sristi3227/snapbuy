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
<title>Dashboard</title>
<link rel="stylesheet" href="dash2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link

    href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
    rel="stylesheet"
/>
</head>
<body style="background-color:black; margin:auto">
	<%
	HttpSession session1=request.getSession();
	String user=(String)session1.getAttribute("user");
	
	
	String fullname="";
	String username="";
	String contact="";
	
	if(user==null){
		response.sendRedirect("login.jsp");
	}else{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_e","root","W7301@jqir#");
			String sql="SELECT Fullname,Username, ContactNo FROM register WHERE Username=?";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1,  user);
			
			
			ResultSet rs=stmt.executeQuery();
			if(rs.next()) {
				fullname=rs.getString(1);
				username=rs.getString(2);
				contact=rs.getString(3);
			}
			stmt.close();
			
			
			con.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	

	
%>
<!-- Prevent caching -->
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
    %>
	
	<div class="header border-container">
    <div class=logo>
    <div><img src="images/logo.jpg" height="60px"></div>
        <h1>SnapBuy</h1>
<div class="search">
    <div class="search-container">
        <input type="text" placeholder="Search Trendy Outfits" class="inp" id="searchInput">
        <button id="searchButton"><i class="ri-search-eye-line"></i></button>
    </div>
</div>

			</div>
		<div class="links">
		            <a href="logout.jsp" title="Logout" class="menu fw-bold"><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i>Logout</a>
		
            <a href="#shop" class="menu fw-bold"><i class="fa fa-shopping-cart " aria-hidden="true"></i>Shop</a>
   <!-- Sidebar Button -->
    <button class="open-btn" onclick="openSidebar()">Profile</button>

    <!-- Sidebar Content -->
    <div id="sidebar" class="sidebar">
        <a href="javascript:void(0)" class="close-btn" onclick="closeSidebar()">&times;</a>
        <h2>Welcome, <%=fullname %></h2>
        <h2>Your Profile Details</h2>
       <p><strong>Name:</strong> <%=fullname %></p>
		<p><strong >Email:</strong><span class="e_mail" style="text-transform:lowercase"> <%= username %></span></p>
		<p><strong>Phone No:</strong> <%=contact %></p>
		<form action="purchaseHistory.jsp" method="get">
        <button type="submit" class="purchase" style="margin-top: 20px;">View Purchase History</button>
    </form>
    </div>
        </div>
    </div>
    
     
       <h2 Style="color:white">Top deals On Fashion</h2>
     <div class="card-container">
        <!-- Card 1 -->
        <div class="card">
            <img src="images/Top1.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Stylish Trendy Women Tops</h3>
                <div class="options"><p>50%off</p><a href="newbuy.jsp?id=1" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>

         <div class="card">
            <img src="images/shirt1.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Stylish Shirts</h3>
                <div class="options"><p>New collections</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="card">
            <img src="images/shoe1.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Trendy Shoes</h3>
                     <div class="options"><p>From Rs.150</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
     
               

            </div>
        </div>

        <!-- Card 3 -->
         <div class="card">
            <img src="images/hood1.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Cool Hoodies</h3>
                <div class="options"><p>Grab now</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>
        <a href="fashion.jsp" title="View More" class="view"><i class="ri-arrow-drop-right-line"></i></a>
        <br>
        <div class="bcaro"><a href="https://www.example.com/link4" target="_blank">
                    <img src="img/fashion.png" alt="Image 4" class="bcaro">
                </a></div>
        
    </div>
    <br><br>
    
    <!-----------------------------------------------------------------------------------  -->
          
           <h2 Style="color:white">Upgrade Your Life with Smart Electronics</h2>
    <div class="card-container">
    <div class="card">
            <img src="images/headphone.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Best Wireless Headphones</h3>
                
                <div class="options"><p>Grab now</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        
        <div class="card">
            <img src="images/printer.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Digital Printers</h3>
                <div class="options"><p>From Rs.300</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        <div class="card">
            <img src="images/monitor.jpg" alt="Image 1" height="100px" width="100px">
            <div class="card-content">
                <h3>FullHD Monitors</h3>
                <div class="options"><p>From Rs.2000</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        

        <!-- Card 3 -->
         <div class="card">
            <img src="images/projector.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Projectors</h3>
                <div class="options"><p>From Rs.2050</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        
                <a href="#" class="view"><i class="ri-arrow-drop-right-line"></i></a>
        
    </div>
    
     <div class="bcaro"><a href="https://www.example.com/link4" target="_blank">
                    <img src="img/caro2.jpeg" alt="Image 4" class="bcaro">
                </a></div>
       <div class="bcaro"><a href="https://www.example.com/link4" target="_blank">
                    <img src="img/caro6.png" alt="Image 4" class="bcaro">
                </a></div>
        <!-----------------------------------------------------------------------------------  -->
    
    <h2 Style="color:white">TV Appliances& More</h2>
    <div class="card-container">
    <div class="card">
            <img src="images/tv1.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>HD Ready LED TV</h3>
                
                <div class="options"><p>75% Off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        
        <div class="card">
            <img src="images/fridge1.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Five Star Refrigerator</h3>
                <div class="options"><p>From Rs.5000</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        <div class="card">
            <img src="images/Mix.jpg" alt="Image 1" height="100px" width="100px">
            <div class="card-content">
                <h3>Juicer Mixer Grinder</h3>
                <div class="options"><p>Buy now</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        

        <!-- Card 3 -->
         <div class="card">
            <img src="images/heater.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Room Heater</h3>
                <div class="options"><p>40% Off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        
                <a href="#" class="view"><i class="ri-arrow-drop-right-line"></i></a>
        
    </div>
    
            <!-----------------------------------------------------------------------------------  -->
       <h2 Style="color:white">SpecialDeals on SmartPhones</h2>
    <div class="card-container1">
    <div class="card">
            <img src="images/phone1.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Samsung S22 Ultra</h3>
                
                <div class="options"><p>40% Off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        <div class="card">
         <img src="images/Phone2.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Moto5G</h3>
                
                     <div class="options"><p>144Hz Curved display</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
                
            </div>
        </div>
        
        
        <div class="card">
            <img src="images/phone3.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>One Plus</h3>
                     <div class="options"><p>Add to Cart</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        <div class="card">
            <img src="images/phone4.png" alt="Image 1" height="100px" width="100px">
            <div class="card-content">
                <h3>RedmeA2</h3>
                     <div class="options"><p>From Rs.7999</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        

        <!-- Card 3 -->
         <div class="card">
            <img src="images/phone5.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Google Pixel 8Pro</h3>
                     <div class="options"><p>30% Off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
            </div>
        </div>
        
               
        
    </div>
    <div class="bcaro"><a href="https://www.example.com/link4" target="_blank">
                    <img src="img/caro3.png" alt="Image 4" class="bcaro">
                </a></div>
   
 </div>
 
 
        <br>
        
        

   <div class="footer-container">
        <div class="footer">
        
        <div class="cards">
                <div class="cards-title"><h2>About</h2></div>
                <div>
                    <ul>
                        <li><a href="#home" class="fw-bold"><i class="fa fa-home me-1" aria-hidden="true"></i>Home</a></li>
            			<li><a href="#category" class="fw-bold"><i class="fa fa-shopping-cart " aria-hidden="true"></i>Category</a></li>
           				 <li><a href="#contact" class="fw-bold"><i class="fa fa-phone " aria-hidden="true"></i>Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="cards">
                <div class="cards-title"><h2>SnapBuy</h2></div>
                <div><p>At SnapBuy, we believe in delivering a seamless, enjoyable, and trendy shopping experience. From the latest fashion apparel to cutting-edge electronics, we curate a wide range of high-quality products to meet your every need.</p></div>
            </div>
            
            <div class="cards">
                <div class="cards-title"><h2>Mail Us:</h2></div>
                
                 <div class="footer-box">
                    
                    <i class="ri-mail-open-line"></i>
                    <p style="font-weight:bold">snapbuyindia@gmail.com</p>
                </div>   
                  <div><br>
                  <div class="cards-title"><h2>Social:</h2></div>
                  <div class="footer-box">
                    
                     <div class="social">
                <a href="https://www.linkedin.com/in/sristi-mazumder-621720254/"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a>
                <a href="https://www.instagram.com/mazumder.sristi/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="https://www.facebook.com/sristi.mazumder/"><i class="fa fa-facebook-official" aria-hidden="true"></i></a>
                </div>
                </div> 
                </div>

                
            </div>
            <div class="cards">

                <div class="cards-title"><h2>Help</h2></div>
					 <div>
                    <ul>
                        <li><a href="#home" class="fw-bold"></i>Payment&Shipping</a></li>
            			<li><a href="#category" class="fw-bold">FAQ</a></li>
           				 <li><a href="#contact" class="fw-bold">Terms Of Use</a></li>
                    </ul>
                </div>
                <div class="updates">
                   


                    
                </div>
            </div>
            </div>
            <div class="copyright">
    <p>&copy;2024.snapbuy All rights reserved</p></div>
            </div>
            
	<script>
    function openSidebar() {
        document.getElementById("sidebar").style.width = "350px";
    }


    function closeSidebar() {
        document.getElementById("sidebar").style.width = "0";
    }
    
    const searchInput = document.getElementById('searchInput');
    const searchButton = document.getElementById('searchButton'); // Add a search button to HTML

    searchButton.addEventListener('click', function() {
        const searchTerm = searchInput.value.toLowerCase();
        const fashions = ['tops', 'shirt', 'hoodie', 'shoes'];
        const households = ['tv', 'heater', 'fridge'];
       // const phones = ['mobile','phone','gadget'];

        // Check if any fashion word exists in the search term
        const hasFashionMatch = fashions.some(fashion => 
            searchTerm.split(' ').some(word => word === fashion)
        );

        // Check if any household word exists in the search term
        const hasHouseholdMatch = households.some(household => 
            searchTerm.split(' ').some(word => word === household)
        );
        
       // const hasPhoneMatch = phones.some(phone => 
        //searchTerm.split(' ').some(word => word === phone)
       // );

        if (hasFashionMatch) {
            window.location.href = 'fashion.jsp';
        } else if (hasHouseholdMatch) {
            window.location.href = 'household.jsp';
        } //else if(hasPhoneMatch) {
        //	window.location.href = 'phone.jsp';
        //}
    });

    // Optional: Allow Enter key to trigger search
    searchInput.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            searchButton.click();
        }
    });
    
   
    function preventBack() {
        window.history.forward(); 
    }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>
</body>
</html>