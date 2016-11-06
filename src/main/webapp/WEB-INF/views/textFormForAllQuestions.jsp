<%@ page import="ua.com.bestZoo.entity.UserRole" %>
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
    <title>Go Away!!!!</title>
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/textFormForAllQuestions.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap -->
    <link href="resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<body>
<c:set var="user" value="${userRoleText}"/>
${user}
<c:set var="HUNTER" value="<%=UserRole.HUNTER.getTexts()%>"/>
<c:choose>
<c:when test="${(user eq HUNTER)}">
<div id="pageH">
    <div id="headerH">
        <div id="logo">
            <a href="h"><img src="resources/images/logoH.jpg" alt="The Analog Specialists"/></a>
            </c:when>
            <c:otherwise>

            <div id="page">
                <div id="header">
                    <div id="logo">
                        <a href="h"><img src="resources/images/logo.jpg" alt="The Analog Specialists"/></a>
                        </c:otherwise>
                        </c:choose>
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

    <div id="container">

        <div class="articleTextForm">
            <h1>About</h1>
            <p> We are the best zoo in the world! </p>
        </div>
        <div class="articleTextForm">
            <h1>Contact</h1>
            <p> Call us: 564456156 </p>
        </div>
        <div class="articleTextForm">
            <h1>Help Us</h1>
            <p>We don't have enough money to feed all of the animals. Please, give us some money: </p>
            <div class="" id="payCartSection">
                <div class="input-group">
                    <input id="payCartInput" type="text" class="form-control"
                           placeholder="enter the number of the card">
                    <span class="input-group-btn">
        <button id="payCartBtn" class="btn btn-default" type="button">Confirm number</button>
      </span>
                </div>
            </div>
        </div>
        <div class="articleTextForm">
            <h1>Careers</h1>
            <p>We don't have any opened jobs for YOU!!! GO AWAY!!!!! </p>
        </div>
        <div class="articleTextForm">
            <h1>Private police</h1>
            <p>Don't disturb! No one will know about our deals and no one will not remember you if you are the
                RAT!!!</p>
        </div>


    </div>

    <c:choose>
    <c:when test="${(user eq HUNTER)}">
    <div id="footerH">
        </c:when>
        <c:otherwise>
        <div id="footer">
            </c:otherwise>
            </c:choose>

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
    $("#payCartBtn").click(function () {
        if ($("#payCartInput").val().length == 16) {
            var reg = new RegExp('^\\d+$');
            if (reg.test($("#payCartInput").val())) {
                alert("Spasibo za vashi dengi. Mi zabrali vse. HA-HA-HA");
            }
        }else{
            alert("Oops, we have the problems with this number. Probably you have missed some number.");
        }
    })
</script>
</body>
</html>