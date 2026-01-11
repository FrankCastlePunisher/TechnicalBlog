<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <title>Bill</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Your Bill</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Product p : cartItems) {
                            total += p.getPprice();
                    %>
                    <tr>
                        <td><%=p.getPname()%></td>
                        <td>₹<%=p.getPprice()%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <h3>Total Amount: ₹<%=total%></h3>
            <button onclick="window.print()" class="btn btn-primary">Download Invoice</button>
        </div>
        <div class="text-center mt-3">
            <a href="ClearCartServlet" class="btn btn-danger">Clear Cart</a>
        </div>

    </body>
</html>
