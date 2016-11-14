<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome Hunter</title>
    <link type="text/css" rel="stylesheet" href="resources/loginStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/huntersTheme.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap -->
    <link href="resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<body>
<div id="pageH"><!--hnrtghnrtg-->
    <div id="headerH"><!--hnrtghnrtg-->
        <div id="logo">
            <a href="h">
                <img src="resources/images/logoH.jpg" alt="The Analog Specialists"/><!--hnrtghnrtg-->
            </a>
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
                        <li role="presentation" class="active footerList">
                            <sf:form action="loginPage" method="post">
                                <button class="formRegistButton footerList">Log In</button>
                            </sf:form></li>
                        <li role="presentation" class="footerList">
                            <sf:form action="registration" method="post">
                                <button class="formRegistButton footerList">Registration</button>
                            </sf:form></li>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <li role="presentation" class="footerList"><a href="addOrder">Make new order</a>
                        </li>
                        <li role="presentation" class="footerList"><a href="myOrders">My orders</a></li>
                        <li role="presentation" class="footerList">
                            <sf:form action="logout" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="formRegistButton footerList">Log Out</button>
                            </sf:form>
                        </li>
                    </sec:authorize>

                </ul>

            </div>
            <div class="col-lg-6" id="searchBar">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
                </div>
            </div>
        </div>
    </div>
    <div class = "container">
        <div class="wrapper">
            <sf:form action="loginprocesing" method="post" name="Login_Form" class="form-signin">
                <h3 class="form-signin-heading">Welcome Back Dear Killer!</h3>
                <hr class="colorgraph"><br>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <input id="userField" type="text" class="form-control" name="username" placeholder="Username" required="" autofocus="" />
                <input id="passwordField" type="password" class="form-control" name="password" placeholder="Password" required=""/>

                <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">Login</button>
                <input type="hidden">
            </sf:form>
        </div>
    </div>


    <div id="footerH">
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

</body>
</html>