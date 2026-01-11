<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="Dao.Cartdao"%>
<%@page import="Dao.Cartdao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page import="entities.Product"%>
<%@page import="entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("loginpage.jsp");
        return;
    }

    Cartdao cartDao = new Cartdao(ConnectionProvider.getConnection());
    List<Product> cartItems = cartDao.getCartItems(user.getId());

    int total = 0;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Your Cart</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <style>
            body {
                background: url(img/Thing8.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h2>Your Cart</h2>
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Product p : cartItems) {
                            total += p.getPprice();
                    %>
                    <tr>
                        <td><img src="images/<%=p.getPpic()%>" width="80"></td>
                        <td><%=p.getPname()%></td>
                        <td>₹<%=p.getPprice()%></td>
                        <td><a href="RemoveCartItemServlet?pid=<%=p.getPid()%>" class="btn btn-danger btn-sm">Remove</a></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <h4>Total: ₹<%=total%></h4>
            <a href="bill.jsp" class="btn btn-success">Proceed to Checkout</a>
        </div>
    </body>
</html>
