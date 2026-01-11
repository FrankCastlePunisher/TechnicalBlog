<%@page import="entities.User"%>
<%@page import="Dao.likedao"%>
<%@page import="entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="Dao.Postdao"%>

<div class="row">

    <%
        
        User uuu=(User)session.getAttribute("currentUser");
        Thread.sleep(1000);
        Postdao d = new Postdao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllposts();
        } else {
            posts = d.getPostbycid(cid);
        }
        if (posts.size() == 0) {
            out.println("<h4 class='display-3 text-center' style='color: white;'>No Posts In This Category</h4>");
            return;
        }
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blogphoto/<%=p.getPpic()%>" width="300" height="200" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getPtitle()%></b>
                <p><%=p.getPcontent()%></p>

            </div>
            <div class="card-footer">
                <a href="showpage.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>
                <%
                    likedao ld = new likedao(ConnectionProvider.getConnection());
                %>

                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countlike(p.getPid())%></span> </a>
                <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span><%= d.countCommentOnPost(p.getPid()) %></a>
            </div>
        </div>

    </div>  

    <%
        }
    %>
</div>