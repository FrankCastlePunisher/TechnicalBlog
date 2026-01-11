<%-- 
    Document   : index
    Created on : Jul 25, 2024, 12:52:47 PM
    Author     : Admin
--%>

<%@page import="helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="normal_nav.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to TechBlog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <!-- Header Section -->
        <header>
            <div class="container header-section flex">
                <div class="header-left">
                    <h1>Welcome to TechBlog</h1>
                    <p>Discover insightful articles, coding tutorials, and the latest tech trends curated by passionate developers. Stay ahead, stay informed.</p>
                    <a href="loginpage.jsp" class="primary-button get-started-button">Get Started</a>
                </div>
                <div class="header-right">
                    <img src="./assets/asset 2.png" alt="hero image">
                </div>
            </div>
        </header>

        <!-- Big Feature Sections -->
        <section class="big-feature-section"> 
            <div class="container flex big-feature-container">
                <div class="feature-img">
                    <img src="./assets/asset 18.png" alt="">
                </div>
                <div class="features-desc flex">
                    <h4>Code. Learn. Share.</h4>
                    <h3>Design Professionals</h3>
                    <p>TechBlog is your digital journal where thoughts meet technology. Whether you're a beginner or a pro, this space is made for you.</p>
                </div>
            </div>
        </section>

        <section class="big-feature-section">
            <div class="container flex big-feature-container" style="flex-direction: row-reverse;">
                <div class="feature-img">
                    <img src="./assets/asset 21.png" alt="">
                </div>
                <div class="features-desc flex">
                    <h4>Where Ideas Become Innovations</h4>
                    <h3>Design Professionals</h3>
                    <p>Join a growing community of tech enthusiasts. Explore blogs, share your knowledge, and dive deep into the ever-evolving world of technology.</p>
                </div>
            </div>
        </section>

        <section class="big-feature-section">
            <div class="container flex big-feature-container">
                <div class="feature-img">
                    <img src="./assets/asset 24.png" alt="">
                </div>
                <div class="features-desc flex">
                    <h4>Effortless validation</h4>
                    <p><em>From logic to launch — your journey through code starts here.</em></p>
                </div>
            </div>
        </section>

        <!-- Footer Section -->
        <footer>
            <div class="container flex footer-container">
                <a href="#" class="company-logo">
                    <img src="./assets/companylogo.png" alt="company logo">
                </a>
                <!-- New Video Embed Section -->
                <div class="video-promo text-center" style="flex:1; padding:20px;">
                    <h5>Why Choose TechBlog?</h5>
                    <!-- Embedded YouTube video -->
                    <iframe width="100%" height="200"
                            src="https://www.youtube.com/embed/qpnATzAV02o"
                            title="Why Start a Tech Blog"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen>
                    </iframe>
                </div>
                <div class="link-column flex">
                    <h4>Our Features</h4>
                    <a href="Aboutus.jsp" class="hover-links">About‑Us</a>
                    <a href="loginpage.jsp" class="hover-links">Login</a>
                    <a href="registerpage.jsp" class="hover-links">Register</a>
                    <a href="sendMail.jsp" class="hover-links">Contact Us</a>
                </div>
            </div>
        </footer>


        <div class="subfooter">
            <div class="container flex subfooter-container">
                <a class="hover-links" href="privacy.jsp">Privacy Policy</a>
                <a class="hover-links" href="terms.jsp">Terms & Conditions</a>

            </div>
        </div>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>

        </script>
    </body>
</html>
