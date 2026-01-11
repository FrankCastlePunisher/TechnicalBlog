<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About - Tech Blog Project</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .about-container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h1, h3 {
            color: #343a40;
        }
        p, li {
            font-size: 16px;
            color: #555;
        }
        .section-title {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="about-container">
    <h1>About Tech Blog Project</h1>
    <hr>

    <h3 class="section-title">👨‍💻 Developer Info</h3>
    <p><strong>Name:</strong> Sanket Katurde</p>
    <p><strong>Course:</strong> B.Sc. Computer Science, Savitribai Phule Pune University (SPPU)</p>

    <h3 class="section-title">📌 Project Overview</h3>
    <p><strong>Title:</strong> Tech Blog with Merchandise</p>
    <p>This project is a full-stack Java-based web application that allows users to read and write blogs, manage their profile, and shop for merchandise through a simple cart and billing system.</p>

    <h3 class="section-title">🔧 Technologies Used</h3>
    <ul>
        <li>Java (Servlets, JSP)</li>
        <li>MySQL (via phpMyAdmin)</li>
        <li>HTML5, CSS3, Bootstrap 4</li>
        <li>JDBC (Database connectivity)</li>
        <li>Apache Tomcat Server</li>
    </ul>

    <h3 class="section-title">📂 Main Modules</h3>
    <ul>
        <li><strong>User Registration & Login</strong> – Secure login and session handling</li>
        <li><strong>Blog System</strong> – Post, view, and read technical blogs</li>
        <li><strong>Contact Us / Email Utility</strong> – Send email to the site owner</li>
        <li><strong>Merchandise Section</strong> – View products, add to cart</li>
        <li><strong>Cart Management</strong> – Store user-specific products</li>
        <li><strong>Billing Page</strong> – Shows final bill with downloadable invoice</li>
    </ul>

    <h3 class="section-title">🗃️ Database Tables Used</h3>
    <ul>
        <li><strong>user</strong> – (id, name, email, password, gender, about)</li>
        <li><strong>post</strong> – (pid, title, content, code, category_id, user_id)</li>
        <li><strong>product</strong> – (pid, pname, pdesc, pprice, ppic)</li>
        <li><strong>cart</strong> – (addid, pid, uid [foreign key from user])</li>
    </ul>

    <h3 class="section-title">🎯 Objective</h3>
    <p>The main goal of this project is to demonstrate the use of Java EE for real-world application development by combining blog management with simple e-commerce functionality.</p>

    <h3 class="section-title">👥 Target Audience</h3>
    <ul>
        <li>Tech enthusiasts who want to share knowledge</li>
        <li>Students looking for blog and Java projects</li>
        <li>Java learners practicing Servlet & JSP integration</li>
    </ul>

    <p class="mt-4"><em>Thank you for visiting Tech Blog! For any queries, feel free to use our Contact Us page.</em></p>
</div>
</body>
</html>
