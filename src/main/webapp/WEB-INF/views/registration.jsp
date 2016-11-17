<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link type="text/css" rel="stylesheet" href="resources/registration.css">
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
                        <li role="presentation" class="footerList">
                            <sf:form action="loginPage" method="post">
                                <button class="formRegistButton footerList">Log In</button>
                            </sf:form></li>
                        <li role="presentation" class="footerList active">
                            <sf:form action="registration" method="post">
                                <button class="formRegistButton footerList active">Registration</button>
                            </sf:form></li>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('ROLE_USER')">
                            <li role="presentation" class="footerList"><a href="addOrder">New Order</a></li>
                            <li role="presentation" class="footerList"><a href="myOrders">My Profile</a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li role="presentation" class="footerList" style="margin: auto;"><a href="admin">Admin</a>
                            </li>
                        </sec:authorize>
                        <li role="presentation" class="footerList">
                            <sf:form action="logout" method="post" id="logoutForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="formRegistButton footerList">Log Out</button>
                            </sf:form>
                        </li>
                    </sec:authorize>

                </ul>

            </div>
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
    <div class="container">
        <sf:form action="addUser" method="post" class="form-horizontal">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <!-- Form Name -->
            <legend>Register Here</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Name</label>
                <div class="col-md-4">
                    <input id="textinput" name="nameUser" value="${errorValN}" placeholder="Insert your Name"
                           class="form-control input-md" required="" type="text">
                    <span class="help-block"> </span>
                    <c:if test="${errorU}">
                        <p style="color: red">This name is used!</p>
                    </c:if>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Phone Number</label>
                <div class="col-md-4">
                    <input id="textinput" name="phoneUser" value="${errorValP}" placeholder="Insert your phone number"
                           class="form-control input-md" required="" type="text">
                    <span class="help-block"> </span>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Email</label>
                <div class="col-md-4">
                    <input id="textinput" name="emailUser" value="${errorValE}" placeholder="Insert your Email"
                           class="form-control input-md" required="" type="email">
                    <span class="help-block"> </span>
                    <c:if test="${errorE}">
                        <p style="color: red">This email already exists</p>
                    </c:if>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Password</label>
                <div class="col-md-4">
                    <input id="textinput" name="p1" value="${errorValP1}" placeholder="Insert your Password"
                           class="form-control input-md" required="" type="password">
                    <span class="help-block"> </span>
                    <c:if test="${errorP}">
                        <p style="color: red">Passwords are different!!</p>
                    </c:if>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Confirm Password</label>
                <div class="col-md-4">
                    <input id="textinput" name="p2" value="${errorValP2}" placeholder="Confirm your Password"
                           class="form-control input-md" required="" type="password">
                    <span class="help-block"> </span>
                    <c:if test="${errorP}">
                        <p style="color: red">Passwords are different!!</p>
                    </c:if>
                </div>
            </div>


            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton"> </label>
                <div class="col-md-4">
                    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </sf:form>

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
</div>
<script type="text/javascript">


    $("#passwordField").keydown(function () {
        console.log($("#userField").val());
        console.log($("#userField").val().toLowerCase());
        if ($("#userField").val().toLowerCase() == "hunter") {
            console.log(true);
            if ($("#passwordField").val() == "1111") {
                alert("1111");
                //TODO: ajax request -> to loginH page.
            }
        }
    })
</script>
</body>
</html>