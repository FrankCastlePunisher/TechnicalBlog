<%-- 
    Document   : showpage
    Created on : Sep 8, 2024, 5:39:09 PM
    Author     : Admin
--%>

<%@page import="entities.Comments"%>
<%@page import="Dao.likedao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Category"%>
<%@page import="entities.Post"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="Dao.Postdao"%>
<%@page import="entities.User"%>
<%@page errorPage="errorpage.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("loginpage.jsp");
    }
%>

<%
    int postid = Integer.parseInt(request.getParameter("post_id"));
    Postdao d = new Postdao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostid(postid);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .post-title{
                font-family: cursive;
                font-style: italic;
                font-size: 30px;
            }
            .post-content{
                font-family: cursive;
                font-style: oblique;
                font-size: 25px;
            }
            .post-date{
                font-style: oblique;
            }
            .post-user{
                font-family: cursive;
                font-weight: bold;
            }
            body{
                background: url(img/Tech2.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

            /* Optional: Basic styling for the comments section */
            .comment-section {
                border-top: 1px solid #e0e0e0;
                padding: 15px;
                max-width: 400px; /* Adjust width as needed */
                margin: 0 auto; /* Center the comment section */
            }

            #comment-list {
                max-height: 150px; /* Optional: limit height and make it scrollable if needed */
                overflow-y: auto;
                margin-bottom: 10px;
            }

            .input-group {
                margin-top: 10px;
            }
        </style>



    </head>
    <body>

        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="profile.jsp"> <span class="fa fa-diamond"></span>  Project</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"> <span class="fa fa-institution"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-phone"></span>  Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk"></span>  Do Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span>  <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logoutservlet"> <span class="fa fa-user-plus"></span>  Log-Out</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of nav bar-->


        <!--main content of the body-->

        <div class="container">
            <div class="row my-4">
                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header">
                            <h4 class="post-title"><%=p.getPtitle()%></h4>
                        </div>

                        <div class="card-body">
                            <img class="card-img-top" src="blogphoto/<%=p.getPpic()%>" alt="Card image cap">

                            <div class="row my-1">
                                <div class="col-md-8">
                                    <%UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                                    <p class="post-user"><%= ud.getUserByPostId(p.getUserid()).getName()%> has posted: </p>  
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getPdate())%></p>
                                </div>
                            </div>

                            <p class="post-content"><%=p.getPcontent()%></p>

                            <br>
                            <br>

                            <div class="post-code">
                                <pre><%=p.getPcode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer">
                            <%
                                likedao ld = new likedao(ConnectionProvider.getConnection());
                            %>

                            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countlike(p.getPid())%></span> </a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span><%= d.countCommentOnPost(postid)%></a>
                        </div>

                        <!-- Simple Comment Section -->
                        <div class="comment-section">
                            <h6>Comments:</h6>

                            <form action="CommentServlet" method="post">
                                <input type="hidden" name="pid" value="<%= p.getPid()%>">

                                <div class="input-group mb-3">
                                    <input type="text" name="comment" class="form-control"
                                           placeholder="Add a comment..." required>
                                    <button class="btn btn-primary" type="submit">Post</button>
                                </div>
                            </form>
                            <%
                                Postdao s = new Postdao(ConnectionProvider.getConnection());
                                ArrayList<Comments> list2 = s.fetchAllComments(postid);

                                for (Comments cf : list2) {
                                    User cu = ud.getUserById(cf.getUid());
                            %>

                            <div class="media mb-3">
                                <img src="pics/<%= cu.getProfile()%>"
                                     class="mr-3 rounded-circle"
                                     style="width:40px;height:40px;">

                                <div class="media-body">
                                    <h6 class="mb-1"><%= cu.getName()%></h6>
                                    <p class="mb-0"><%= cf.getCommentdesc()%></p>
                                </div>
                            </div>

                            <%
                                }
                            %>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!--end of main content-->

        <!--profile model starting from here-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> Tech-Blog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%=user.getName()%> </h5>
                            <!--details-->

                            <div id="profile-detail">
                                <table class="table table-dark">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td> <%=user.getId()%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h2 class="mt-2">Please Edit Carefully</h2>
                                <form action="Editservlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID:</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td> <%=user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About:</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Select New pic:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-success">Save</button>
                                    </div>           


                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile model-->

        <!--add profile modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---select categories---</option>

                                    <%
                                        Postdao po = new Postdao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = po.getAllCategory();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control" />
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your Program:(If any)"></textarea>
                            </div>

                            <div class="form-group">
                                <lable>Select your pic..</lable>
                                <br>
                                <input type="file" name="pic"/>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>


        <!--end of post modal-->




        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {
                                        //                   alert("button clicked");

                                        if (editStatus == false)
                                        {
                                            $('#profile-detail').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else
                                        {
                                            $('#profile-detail').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }

                                    });
                                });

        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this code is get called when form is submitted
                    event.preventDefault();
                    console.log("you have clicked on submit..");

                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success..
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "post saved successfully!", "success");
                            } else {
                                swal("Good job!", "post saved successfully!", "success");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Error!", "somthing went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
