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
    <title>New Order</title>
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/newOrder.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap -->
    <link href="resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/bootstrap-3.3.7/js/bootstrap-select-master/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="resources/bootstrap-3.3.7/js/bootstrap-datetimepicker-master/build/css/bootstrap-datetimepicker.css"
          rel="stylesheet">


    <script src="resources/bootstrap-3.3.7/js/moment.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap-datetimepicker-master/build/js/bootstrap-datetimepicker.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap-select-master/dist/js/bootstrap-select.min.js"></script>


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
        <div class="wrapper">
        <!--order type-->

        <div class="container" id="containerOrderType">
            <div class="selected-item" id="selected-itemOrderType">
                <p>You Selected Country : <span>Empty</span></p>
            </div>

            <div class="dropdown" id="orderType">
                <span class="selLabel" id="selLabelOrderType">Select Country</span>
                <input type="hidden" name="cd-dropdown">
                <ul class="dropdown-list" id="dropdown-listOrderType">
                    <li data-value="1">
                        <span>Pakistan</span>
                    </li>
                    <li data-value="2">
                        <span>Saudia</span>
                    </li>
                    <li data-value="3">
                        <span>Turkey</span>
                    </li>
                    <li data-value="4">
                        <span>Bangladesh</span>
                    </li>
                </ul>
            </div>
        </div>

        <!--date-->
        <div class="container invisible data">
            <div class="form-group">
                <p>Select the date:</p>
                <div class='input-group date'>
                    <input type='text' class="form-control" id='datetimepicker'/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>

            </div>
        </div>


        <!--animal-->
        <div class="container animal invisible">
            <label for="animalSelect">Select the animals:</label>
            <select class="selectpicker anim" data-live-search="true" id="animalSelect">
                <option data-tokens=""value=""></option>
                <option data-tokens="ketchup mustard">Hot Dog, Fries and a Soda</option>
                <option data-tokens="mustard">Burger, Shake and a Smile</option>
                <option data-tokens="frosting">Sugar, Spice and all things nice</option>
            </select>
        </div>


        </div>
        <div class="wrapper">
        <!--weapon-->
        <div class="container invisible" id="containerWeapon">
            <div class="selected-item" id="selected-itemWeapon">
                <p>You Selected Country : <span>Empty</span></p>
            </div>

            <div class="dropdown" id="weapon">
                <span class="selLabel" id="selLabelWeapon">Select Country</span>
                <input type="hidden" name="cd-dropdown">
                <ul class="dropdown-list" id="dropdown-listWeapon">
                    <li data-value="1">
                        <span>Pakistan</span>
                    </li>
                    <li data-value="2">
                        <span>Saudia</span>
                    </li>
                    <li data-value="3">
                        <span>Turkey</span>
                    </li>
                    <li data-value="4">
                        <span>Bangladesh</span>
                    </li>
                </ul>
            </div>
        </div>

        <!--time of meeting-->
        <div class="container invisible" id="container-time">
            <div class="selected-item" id="selected-item-time">
                <p>You Selected Country : <span>Empty</span></p>
            </div>

            <div class="dropdown" id="time">
                <span class="selLabel" id="selLabel-time">Select Country</span>
                <input type="hidden" name="cd-dropdown">
                <ul class="dropdown-list" id="dropdown-list-time">
                    <li data-value="1">
                        <span>Pakistan</span>
                    </li>
                    <li data-value="2">
                        <span>Saudia</span>
                    </li>
                    <li data-value="3">
                        <span>Turkey</span>
                    </li>
                    <li data-value="4">
                        <span>Bangladesh</span>
                    </li>
                </ul>
            </div>
        </div>

        <!--distance-->
        <div class="container invisible" id="container-distance">
            <div class="selected-item" id="selected-item-distance">
                <p>You Selected Country : <span>Empty</span></p>
            </div>

            <div class="dropdown" id="distance">
                <span class="selLabel" id="selLabel-distance">Select Country</span>
                <input type="hidden" name="cd-dropdown">
                <ul class="dropdown-list" id="dropdown-list-distance">
                    <li data-value="1">
                        <span>Pakistan</span>
                    </li>
                    <li data-value="2">
                        <span>Saudia</span>
                    </li>
                    <li data-value="3">
                        <span>Turkey</span>
                    </li>
                    <li data-value="4">
                        <span>Bangladesh</span>
                    </li>
                </ul>
            </div>
        </div>
</div>
            <div class="wrapper">
        <!--freedom-->
        <div class="container invisible" id="container-freedom">
            <div class="selected-item" id="selected-item-freedom">
                <p>You Selected Country : <span>Empty</span></p>
            </div>

            <div class="dropdown" id="freedom">
                <span class="selLabel" id="selLabel-freedom">Select Country</span>
                <input type="hidden" name="cd-dropdown">
                <ul class="dropdown-list" id="dropdown-list-freedom">
                    <li data-value="1">
                        <span>Pakistan</span>
                    </li>
                    <li data-value="2">
                        <span>Saudia</span>
                    </li>
                    <li data-value="3">
                        <span>Turkey</span>
                    </li>
                    <li data-value="4">
                        <span>Bangladesh</span>
                    </li>
                </ul>
            </div>
        </div>


        <button type="button" class="btn btn-primary container invisible" id="confirmButton">Accept</button>
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
    $(document).ready(function () {

        $("#selLabelOrderType").click(function () {
            $('#orderType').toggleClass('active');
        });

        $("#dropdown-listOrderType li").click(function () {
            $('#selLabelOrderType').text($(this).text());
            $('#orderType').removeClass('active');
            $('#selected-itemOrderType p span').text($('#selLabelOrderType').text());

            $('.data').removeClass('invisible');
            $('.animal').removeClass('invisible');
        });

        $('.animal').change(function () {
            console.log($("#animalSelect").val())
            $('#containerWeapon').removeClass('invisible');
        })
        $("#selLabelWeapon").click(function () {
            $('#weapon').toggleClass('active');
        });

        $("#dropdown-listWeapon li").click(function () {
            $('#selLabelWeapon').text($(this).text());
            $('#weapon').removeClass('active');
            $('#selected-itemWeapon p span').text($('#selLabelWeapon').text());
            $('#container-time').removeClass('invisible');
        });

        $("#selLabel-time").click(function () {
            $('#time').toggleClass('active');
        });

        $("#dropdown-list-time li").click(function () {
            $('#selLabel-time').text($(this).text());
            $('#time').removeClass('active');
            $('#selected-item-time p span').text($('#selLabel-time').text());
            $('#container-distance').removeClass('invisible');
        });

        $("#selLabel-distance").click(function () {
            $('#distance').toggleClass('active');
        });

        $("#dropdown-list-distance li").click(function () {
            $('#selLabel-distance').text($(this).text());
            $('#distance').removeClass('active');
            $('#selected-item-distance p span').text($('#selLabel-distance').text());
            $('#container-freedom').removeClass('invisible');
        });

        $("#selLabel-freedom").click(function () {
            $('#freedom').toggleClass('active');
        });

        $("#dropdown-list-freedom li").click(function () {
            $('#selLabel-freedom').text($(this).text());
            $('#freedom').removeClass('active');
            $('#selected-item-freedom p span').text($('#selLabel-freedom').text());
            $('.btn').removeClass('invisible');
        });
//        $('#datetimepicker').data("DateTimePicker").FUNCTION()

        $(function () {
            // Bootstrap DateTimePicker v4
            $('#datetimepicker').datetimepicker(
            );
        });
    });
</script>


</body>
</html>