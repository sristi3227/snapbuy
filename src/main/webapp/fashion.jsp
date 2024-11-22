<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fashion</title>
<link rel="stylesheet" href="fashion2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link

    href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
    rel="stylesheet"
/>
</head>
<body style="background-color:black; margin:auto">

<div class="header border-container">
    <div class=logo>
    <div><img src="images/logo.jpg" height="60px"></div>
        <h1>SnapBuy</h1>
        
			</div>
		<div class="links">
		            <a href="logout.jsp" title="Logout" class="menu fw-bold"><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i>Logout</a>
		
            <a href="#shop" class="menu fw-bold"><i class="fa fa-shopping-cart " aria-hidden="true"></i>Shop</a>
            <a href="dashboard.jsp" class="menu fw-bold"><i class="ri-home-4-line"></i>Home</a>
        </div>
    </div><br>
<div class="options">
	<a href="#tops ">Tops</a>
	<a href="#shirts ">Shirts</a>
	<a href="#shoes ">Shoes</a>
	<a href="#hoodies">Hoodies</a>
	<a href="#jeans ">Jeans</a>
	<a href="#combo ">Combo</a>
</div>


<div id=tops>
<h2 Style="color:white">Tops For Women</h2>
     <div class="card-container">
        <div class="card">
            <img src="images/Top1.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Stylish Trendy top</h3>

     <div class="option">
     <span style="text-decoration: line-through; padding-right:2px;">Rs.500</span>
     <p> Rs.250</p><a href="newbuy.jsp?id=1" class="btn">
     <i class="ri-shopping-cart-fill"></i></a>
     </div>

            </div>
        </div>

         <div class="card">
            <img src="images/Top2.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Ladies top</h3>
                <div class="option">
     <span style="text-decoration: line-through; padding-right:2px;">Rs.400</span>
     <p> Rs.200</p><a href="newbuy.jsp?id=2" class="btn">
     <i class="ri-shopping-cart-fill"></i></a>
     </div>
                
                
            </div>
        </div>

        <div class="card">
            <img src="images/Top3.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Mesh Tops</h3>
                <div class="option">
     <span style="text-decoration: line-through; padding-right:2px;">Rs.500</span>
     <p> Rs.250</p><a href="newbuy.jsp?id=3" class="btn">
     <i class="ri-shopping-cart-fill"></i></a>
     </div>
                
            </div>
        </div>

         <div class="card">
            <img src="images/Top4.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Party Wear top</h3>
               <div class="option">
     <span style="text-decoration: line-through; padding-right:2px;">Rs.600</span>
     <p> Rs.420</p><a href="newbuy.jsp?id=4" class="btn">
     <i class="ri-shopping-cart-fill"></i></a>
     </div>
                
            </div>
        </div>
        
        <br>
    
        
    </div>
    <br><br>
</div>
<!-- ----------------------------------------------------------------------------------------- -->

<div id=shirts>
<h2 Style="color:white">Shirts For Men</h2>
     <div class="card-container">
        <!-- Card 1 -->
        <div class="card">
            <img src="images/shirt1.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Stylish Trendy top</h3>
                <a href="#" class="btn">Rs.200</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

         <div class="card">
            <img src="images/shirts2.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Lymio Casual Shirt</h3>
                <a href="#" class="btn">Rs.150</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

        <div class="card">
            <img src="images/shirts3.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Lymio Stylish Shirt</h3>
                <a href="#" class="btn">Rs.150</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

         <div class="card">
            <img src="images/shirts4.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Trendy Hawaiian Style Shirt</h3>
                <a href="#" class="btn">Rs.200</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>
        
        <br>
    
        
    </div>
    <br><br>
</div>
<!-- --------------------------------------------------------------------------------- -->
<div id=shoes>
<h2 Style="color:white">Shoes</h2>
     <div class="card-container">
        <!-- Card 1 -->
        <div class="card">
            <img src="images/shoe1.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Stylish Trendy Shoes</h3>
                <a href="#" class="btn">Rs.200</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

         <div class="card">
            <img src="images/shoe2.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Synthetic foam trendy shoes</h3>
                <a href="#" class="btn">Rs.150</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

        <div class="card">
            <img src="images/shoe3.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Casual Sneakers shoes</h3>
     
                <a href="#" class="btn">Rs.1,100</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

         <div class="card">
            <img src="images/shoe4.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Casual Denim Sneakers</h3>
                <a href="#" class="btn">Rs.800</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>
        
        <br>
    
        
    </div>
    <br><br>
</div>
<!-------------------------------------------------------------------------------->
<div id=hoodies>
<h2 Style="color:white">Hoodies</h2>
     <div class="card-container">
        <!-- Card 1 -->
        <div class="card">
            <img src="images/hood1.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Cute Hoodie</h3>
                <a href="#" class="btn">Rs.200</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

         <div class="card">
            <img src="images/hood2.jpg" alt="Image 1" height="200px" width="200px">
            <div class="card-content">
                <h3>Fleece Winter hoodie</h3>
                <a href="#" class="btn">Rs.150</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

        <div class="card">
            <img src="images/hood3.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Cute crop hoodie</h3>
     
                <a href="#" class="btn">Rs.150</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>

        <!-- Card 3 -->
         <div class="card">
            <img src="images/hood4.jpg" alt="Image 2" height="100px" width="100px">
            <div class="card-content">
                <h3>Women's bear hoodie</h3>
                <a href="#" class="btn">Rs.200</a>
                     <div class="option"><p>50%off</p><a href="#" class="btn"><i class="ri-shopping-cart-fill"></i></a></div>
                
            </div>
        </div>
        
        <br>
    
        
    </div>
    <br><br>
</div>
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
    <li><a href="#home" class="fw-bold">Payment&Shipping</a></li>
    <li><a href="#category" class="fw-bold">FAQ</a></li>
    <li><a href="#contact" class="fw-bold">Terms Of Use</a></li>
</ul>
</div>
<div class="updates">
</div>
</div>
</div>
<div class="copyright">
    <p>&copy;2024.snapbuy All rights reserved</p>
</div>

</body>
</html>