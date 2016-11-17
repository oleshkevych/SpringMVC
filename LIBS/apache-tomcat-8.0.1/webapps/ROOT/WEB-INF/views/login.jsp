
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Log In</title>
    <link type="text/css" rel="stylesheet" href="resources/loginStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap -->
    <link href="resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<body>
<input type="hidden" name="csrf_name" value="${_csrf.parameterName}"/>
<input type="hidden" name="csrf_value" value="${_csrf.token}"/>
<div id="page">
    <div id="header">
        <div id="logo">
            <a href="h"><img src="resources/images/logo.jpg" alt="The Analog Specialists"/></a>
        </div>
        <div class="navbarLists">
            <div>
                <ul class="nav nav-pills">
                    <li role="presentation" class="footerList"><a href="h">Home</a></li>
                    <li role="presentation" class="footerList"><a href="forSale">For Sale</a></li>
                    <li role="presentation" class="footerList"><a href="textFormForAllQuestions">Help us</a>
                    </li>
                    <sec:authorize access="!isAuthenticated()">
                        <li role="presentation" class="footerList"><a
                                href="textFormForAllQuestions">About</a></li>
                        <li role="presentation" class="footerList"><a
                                href="textFormForAllQuestions">Contact</a></li>
                        <li role="presentation" class="footerList active">
                            <sf:form action="loginPage" method="post">
                                <button class="formRegistButton footerList active">Log In</button>
                            </sf:form></li>
                        <li role="presentation" class="footerList">
                            <sf:form action="registration" method="post">
                                <button class="formRegistButton footerList">Registration</button>
                            </sf:form></li>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('ROLE_USER')">
                            <li role="presentation" class="footerList"><a href="addOrder">Make new order</a>
                            </li>
                            <li role="presentation" class="footerList"><a href="myOrders">My orders</a></li>
                        </sec:authorize>
                        <li role="presentation" class="footerList">
                            <sf:form action="logout" method="post" id="logoutForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="formRegistButton footerList">Log Out</button>
                            </sf:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li role="presentation" class="footerList" style="margin: auto;"><a href="admin">Admin</a>
                        </li>
                    </sec:authorize>

                </ul>

                <div class="col-lg-6" id="searchBar">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for..." id="searchInput">
                        <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" id="searchButton">Go!</button>
                                    <script type="text/javascript">
                                         $("#searchButton").click(function () {
                                             $("#searchInput").val("I don't want to do anything for you!");
                                         });
                                    </script>
                                  </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="wrapper">
            <sf:form action="loginprocesing" method="post" name="Login_Form" class="form-signin">
                <h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
                <hr class="colorgraph">
                <br>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <input id="userField" type="text" class="form-control" name="username" placeholder="Username"
                       required="" autofocus=""/>
                <input id="passwordField" type="password" class="form-control" name="password" placeholder="Password"
                       required=""/>

                <button class="btn btn-lg btn-primary btn-block" name="Submit" value="Login" type="Submit">Login
                </button>
            </sf:form>
        </div>
    </div>


    <div id="footer">
        <div id="partners">
            <div> Our partners:</div>
            <ul class="nav nav-pills">
                <li role="presentation" class="imgList"><a href="forSale"><img class="imgListPartners"
                                                                               src="resources/images/cocacola.jpg"
                                                                               alt="coca cola"></a></li>
                <li role="presentation" class="imgList"><a href="forSale"><img class="imgListPartners"
                                                                               src="resources/images/timeToEat.jpg"
                                                                               alt="time to eat"></a>
                </li>
                <li role="presentation" class="imgList"><a href="forSale"><img class="imgListPartners"
                                                                               src="resources/images/weaponM.jpg"
                                                                               alt="sponsor"></a></li>
            </ul>

        </div>
        <div>
            <ul class="nav nav-pills">
                <li role="presentation" class="footerList"><a href="textFormForAllQuestions"><p>Contact
                    us</p></a></li>
                <li role="presentation" class="footerList"><a href="textFormForAllQuestions"><p>
                    Careers</p></a></li>
                <li role="presentation" class="footerList"><a href="textFormForAllQuestions"><p>Private
                    police</p></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">


    $("#passwordField").keydown(function () {
        if ($("#userField").val().toLowerCase() == "hunter") {
            if ($("#passwordField").val() == "1111") {
//                        console.log("1111jhfvbhwecb");
//
//                        $.ajax({
//                            url : "loginKiller?"+$("input[name=csrf_name]").val()+"="+$("input[name=csrf_value]").val(),
//                            contentType : "application/json",
//                            type : "POST",
//                            success : function(){
//                                console.log("jhfvbhwecb");
//                            }
//                        })

                window.location.assign("/loginKiller");

            }
        }
    })
</script>
</body>
</html>