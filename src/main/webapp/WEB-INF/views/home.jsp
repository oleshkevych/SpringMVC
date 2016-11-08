<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="ua.com.bestZoo.entity.UserRole" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--<link type="text/css" rel="stylesheet" href="resources/style.css">--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
<%--<title>Insert title here</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<sec:authorize access="!isAuthenticated()">--%>
<%--<a href="newUser">registration</a>--%>
<%--<br>--%>
<%--<a href="loginpage">login page</a>--%>
<%--</sec:authorize>--%>


<%--<br>--%>
<%--<c:forEach var="commodity" items="${commodities }">--%>
<%--${commodity.name } ${commodity.price}--%>
<%--<sec:authorize access="isAuthenticated()">--%>
<%--<a href="buy/${commodity.id}">Buy</a>--%>
<%--</sec:authorize>--%>
<%--<br>--%>
<%--</c:forEach>--%>


<%--<sec:authorize access="isAuthenticated()">--%>
<%--<a href="profile">Profile</a>--%>
<%--</sec:authorize>--%>


<%--<sec:authorize access="isAuthenticated()">--%>
<%--<sf:form action="logout" method="post">--%>
<%--<a href="commodity">add commodity</a>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%--<button>logout</button>--%>
<%--</sf:form>--%>
<%--</sec:authorize>--%>

<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Home</title>
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/huntersTheme.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <link href="resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
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
                                <li role="presentation" class="active footerList"><a href="h">Home</a></li>
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
                                <sec:authorize access="hasRole('ROLE_ADMIN')" >
                                    <li role="presentation" class="footerList" style="margin: auto;"><a href="admin">Admin</a>
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
                    <div>path=${pageContext.request.contextPath}
                        <br>
                        path1 = <%= request.getContextPath()%>
                        <br>
                        <img src="<%= request.getContextPath() %>/Resources/1.jpg" />
                        <br>
                        path2= <%=System.getProperty("catalina.home")%>/Resources/1.jpg
                        <br>
                        <img src="<%=System.getProperty("catalina.home")%>/Resources/1.jpg" />

                        <br>

                    </div>
                    <div id="mainImage">
                        <a href="textFormForAllQuestions"><img style="width: 100%" src="resources/images/baobao.jpg"
                                                               alt="Articles"></a>
                        <div id="mainImageDescription">
                            <a href="textFormForAllQuestions"><p id="mainImageDescriptionText">Learn more about our
                                animals!</p></a>
                        </div>
                        <p></p>
                    </div>

                    <div id="animalGallery">
                        <ul class="nav nav-pills">
                            <li role="presentation" class="imgList"><a href="forSale"> <img class="imgList"
                                                                                            src="resources/images/panda.png"
                                                                                            alt="panda"></a>
                            </li>
                            <li role="presentation" class="imgList"><a href="forSale"><img class="imgList"
                                                                                           src="resources/images/ape.png"
                                                                                           alt="ape"></a></li>
                            <li role="presentation" class="imgList"><a href="forSale"><img class="imgList"
                                                                                           src="resources/images/polarBear.png"
                                                                                           alt="polar bear"></a></li>
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