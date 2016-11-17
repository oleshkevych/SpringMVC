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
    <title>For Sale</title>
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/forSale.css">
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
                                <li role="presentation" class="active footerList"><a href="forSale">For Sale</a></li>
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
                                    <sec:authorize access="hasRole('ROLE_USER')" >
                                        <li role="presentation" class="footerList"><a href="addOrder">New Order</a></li>
                                        <li role="presentation" class="footerList"><a href="myOrders">My Profile</a></li>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')" >
                                        <li role="presentation" class="footerList" style="margin: auto;"><a href="admin">Admin</a>
                                        </li>
                                    </sec:authorize>
                                    <li role="presentation" class="footerList">
                                        <sf:form action="logout" method="post" id="logoutForm">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button class="formRegistButton footerList">Log Out</button>

                                        </sf:form>
                                        <script type="text/javascript">
                                        $("#logoutForm").click(function () {
                                            $.ajax({
                                                url: "logoutS?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                                                contentType: "application/json",
                                                type: "POST",
                                                success: function (res) {
                                                    console.log(res);
                                                }
                                            })
                                        });
                                    </script>
                                    </li>
                                </sec:authorize>


                            </ul>

                        </div>
                        <div class="col-lg-6" id="searchBar">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for..." id="searchInput">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" id="searchButton">Go!</button>
                                    <script type="text/javascript" >
                                         $("#searchButton").click(function(){
                                             $("#searchInput").val("I don't want to do anything for you!");
                                         });
                                    </script>
                                  </span>
                            </div>
                        </div>
                    </div>
                </div>

    <div id="container">

        <div id="animalGallery">

            <ul class="nav nav-pills">
                <li role="presentation" class="imgList"><img class="imgList" style="width: 350px; height: 350px"
                                                             src="resources/images/panda.png" alt="panda">
                    <div class="description">Lorem ipsum dolor sit amet, nec dolor vestibulum turpis quis, risus
                        porttitor velit venenatis dictum, ac nibh, consectetuer ac ornare dignissim nullam, nullam
                        imperdiet lacus nunc quam et vitae. Odio ut magna lectus quam nisl non. Malesuada lectus
                        volutpat. A porttitor quaerat sed, fusce odio, id ac rhoncus, nesciunt eros risus fermentum. Nam
                        blandit vitae eleifend ante ad etiam, rhoncus dolor non faucibus interdum, tempor suspendisse
                        suspendisse, nulla luctus egestas nisl mollis, suspendisse sed. Rutrum sapien porta adipiscing.
                        Egestas nulla, etiam urna, sociosqu scelerisque, sem enim dignissim.
                        Tempus tempor vel condimentum, blandit necessitatibus integer lectus mauris sodales, dui non
                        tincidunt dui tincidunt ligula non. Nunc massa convallis non quisque, senectus cras, etiam
                        tellus facilisis suscipit. Mauris tempor egestas enim ad ullamcorper, lacus lobortis tortor
                        risus amet aliquam, quis nunc pede vel. Adipiscing torquent viverra massa. Volutpat mauris
                        praesent pede non, tortor potenti et arcu quasi est, pede ut dictum, vitae leo posuere lorem
                        aliquam placerat. Molestie quis purus a, massa aliquam placerat potenti eleifend, viverra
                        bibendum vel accumsan ipsum magna.
                        Varius et eu. Nunc ut etiam, tristique volutpat urna quam amet, eget nulla. Egestas est id in,
                        vivamus nullam metus. Tortor vestibulum quam suspendisse urna ipsum turpis, cras turpis eros
                        justo blandit, felis fringilla nisl curae ante sed, in integer, malesuada sed eget rutrum.
                        Aliquam placerat dictum sit justo, amet suspendisse magna libero eu optio mi. Explicabo tempor
                        non nunc egestas, lacus risus, nunc dictumst quisque pharetra, at litora vulputate magna a urna
                        ullamcorper.
                    </div>
                </li>
                <li role="presentation" class="imgList"><img class="imgList" src="resources/images/ape.png"
                                                             alt="ape">
                    <div class="description">Lorem ipsum dolor sit amet, nec dolor vestibulum turpis quis, risus
                        porttitor velit venenatis dictum, ac nibh, consectetuer ac ornare dignissim nullam, nullam
                        imperdiet lacus nunc quam et vitae. Odio ut magna lectus quam nisl non. Malesuada lectus
                        volutpat. A porttitor quaerat sed, fusce odio, id ac rhoncus, nesciunt eros risus fermentum. Nam
                        blandit vitae eleifend ante ad etiam, rhoncus dolor non faucibus interdum, tempor suspendisse
                        suspendisse, nulla luctus egestas nisl mollis, suspendisse sed. Rutrum sapien porta adipiscing.
                        Egestas nulla, etiam urna, sociosqu scelerisque, sem enim dignissim.
                        Tempus tempor vel condimentum, blandit necessitatibus integer lectus mauris sodales, dui non
                        tincidunt dui tincidunt ligula non. Nunc massa convallis non quisque, senectus cras, etiam
                        tellus facilisis suscipit. Mauris tempor egestas enim ad ullamcorper, lacus lobortis tortor
                        risus amet aliquam, quis nunc pede vel. Adipiscing torquent viverra massa. Volutpat mauris
                        praesent pede non, tortor potenti et arcu quasi est, pede ut dictum, vitae leo posuere lorem
                        aliquam placerat. Molestie quis purus a, massa aliquam placerat potenti eleifend, viverra
                        bibendum vel accumsan ipsum magna.
                        Varius et eu. Nunc ut etiam, tristique volutpat urna quam amet, eget nulla. Egestas est id in,
                        vivamus nullam metus. Tortor vestibulum quam suspendisse urna ipsum turpis, cras turpis eros
                        justo blandit, felis fringilla nisl curae ante sed, in integer, malesuada sed eget rutrum.
                        Aliquam placerat dictum sit justo, amet suspendisse magna libero eu optio mi. Explicabo tempor
                        non nunc egestas, lacus risus, nunc dictumst quisque pharetra, at litora vulputate magna a urna
                        ullamcorper.
                    </div></li>
                <li role="presentation" class="imgList"><img class="imgList"
                                                             src="resources/images/polarBear.png"
                                                             alt="polar bear">
                    <div class="description">Lorem ipsum dolor sit amet, nec dolor vestibulum turpis quis, risus
                        porttitor velit venenatis dictum, ac nibh, consectetuer ac ornare dignissim nullam, nullam
                        imperdiet lacus nunc quam et vitae. Odio ut magna lectus quam nisl non. Malesuada lectus
                        volutpat. A porttitor quaerat sed, fusce odio, id ac rhoncus, nesciunt eros risus fermentum. Nam
                        blandit vitae eleifend ante ad etiam, rhoncus dolor non faucibus interdum, tempor suspendisse
                        suspendisse, nulla luctus egestas nisl mollis, suspendisse sed. Rutrum sapien porta adipiscing.
                        Egestas nulla, etiam urna, sociosqu scelerisque, sem enim dignissim.
                        Tempus tempor vel condimentum, blandit necessitatibus integer lectus mauris sodales, dui non
                        tincidunt dui tincidunt ligula non. Nunc massa convallis non quisque, senectus cras, etiam
                        tellus facilisis suscipit. Mauris tempor egestas enim ad ullamcorper, lacus lobortis tortor
                        risus amet aliquam, quis nunc pede vel. Adipiscing torquent viverra massa. Volutpat mauris
                        praesent pede non, tortor potenti et arcu quasi est, pede ut dictum, vitae leo posuere lorem
                        aliquam placerat. Molestie quis purus a, massa aliquam placerat potenti eleifend, viverra
                        bibendum vel accumsan ipsum magna.
                        Varius et eu. Nunc ut etiam, tristique volutpat urna quam amet, eget nulla. Egestas est id in,
                        vivamus nullam metus. Tortor vestibulum quam suspendisse urna ipsum turpis, cras turpis eros
                        justo blandit, felis fringilla nisl curae ante sed, in integer, malesuada sed eget rutrum.
                        Aliquam placerat dictum sit justo, amet suspendisse magna libero eu optio mi. Explicabo tempor
                        non nunc egestas, lacus risus, nunc dictumst quisque pharetra, at litora vulputate magna a urna
                        ullamcorper.
                    </div></li>
                <c:forEach var="zo" items="${animals }">
                    <li>
                    <div class="descriptionPanel">
                        <div class="dataO">
                            <p>Name: ${zo.name}</p>
                            <p>This animal is fore sale: ${zo.forSale}</p>
                        </div>
                        <br>
                        <div class="dataO">
                            <img src="${zo.imagePath}" style="width: 350px; height: 350px" alt="Photo"/>
                        </div>
                        <br>
                        <div class="dataO" style="float: none">
                            <p> ${zo.description}</p>
                        </div>
                        <br>
                        <div class="dataO">
                            <p>Age: ${zo.age}; Animal Type: ${zo.animalType}; Price: ${zo.price}; Is present in the Zoo: ${zo.isAlive}</p>
                        </div>
                    </div>
                    </li>
                </c:forEach>
            </ul>
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


</body>
</html>