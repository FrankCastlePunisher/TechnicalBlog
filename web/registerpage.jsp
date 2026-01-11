

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                background: url(img/Tech5.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            p {
                color: #00897b;
                font-family: fantasy;
            }
        </style>
    </head>
    <body>
        <%@include file="normal_nav.jsp" %>

        <main style="padding-bottom: 60px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-2x fa-user-circle"></span>
                            <p>Register Here !</p>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="Registerservlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User name</label>
                                    <input name="user_name" required type="text" class="form-control" id="user_name" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender:</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="Male">Male
                                    <input type="radio" id="gender" name="gender" value="Female">Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" rows="2" class="form-control" placeholder="Enter something about yourself"></textarea>
                                </div>
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Terms And Conditions</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-gear fa-spin fa-2x"></span>
                                    <h4>Please Wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <div class="card-footer"></div>
                    </div>
                </div>
            </div>
        </main>

        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded..");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();

                    //send register servlet:
                    $.ajax({
                        url: "Registerservlet",
                        type: 'POST',
                        data: form,
                        processData: false,
                        contentType: false,
                        success: function (data, textStatus, jqXHR) {
                            console.log("Response Data: ", data);
                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done') {
                                console.log("Registration done, redirecting...");
                                swal("Registered successfully...we redirect you to login page")
                                    .then(() => {
                                        window.location = "loginpage.jsp";
                                    });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong");
                        }
                    });
                });
            });
        </script>
    </body>
</html>
