<%@page import="java.util.List"%>
<%@page import="entities.Product"%>
<%@page import="Dao.Productdao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Our Merchandise</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                background: url(img/Thing8.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .product-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                border: none;
                border-radius: 10px;
            }
            .product-card:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            }
            .product-img {
                height: 220px;
                object-fit: cover;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }
            .product-title {
                font-weight: bold;
                font-size: 18px;
            }
            .product-price {
                font-size: 20px;
                color: #28a745;
                font-weight: bold;
            }
            .btn-cart {
                background-color: #007bff;
                color: white;
                font-weight: bold;
                width: 100%;
            }
            .btn-cart:hover,
            .btn-cart:focus {
                background-color: #0056b3;
                color: white;
                outline: none;
                box-shadow: none;
                text-decoration: none;
                opacity: 1 !important;
                filter: none !important;
            }

        </style>
    </head>
    <body>

        <div class="container mt-5">
            <h2 class="text-center mb-4">Explore Our Merchandise</h2>
            <div class="row">
                <%
                    Productdao dao = new Productdao(ConnectionProvider.getConnection());
                    List<Product> products = dao.getAllProducts();

                    if (products != null && !products.isEmpty()) {
                        for (Product p : products) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card product-card">
                        <img src="images/<%= p.getPpic()%>" class="product-img card-img-top" alt="<%= p.getPname()%>">
                        <div class="card-body text-center">
                            <h5 class="product-title"><%= p.getPname()%></h5>
                            <p class="card-text text-muted"><%= p.getPdesc()%></p>
                            <p class="product-price">₹ <%= p.getPprice()%></p>
                            <a href="AddToCartServlet?pid=<%= p.getPid()%>" class="btn btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </a>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-12 text-center">
                    <h4>No products available right now.</h4>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
