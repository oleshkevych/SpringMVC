<%@ page import="ua.com.bestZoo.entity.UserRole" %>
<%@ page import="ua.com.bestZoo.entity.Weapon" %>
<%@ page import="ua.com.bestZoo.entity.OrderType" %>
<%@ page import="ua.com.bestZoo.entity.AnimalType" %>
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
    <link href="resources/bootstrap-3.3.7/js/bootstrap-select-master/dist/css/bootstrap-select.min.css"
          rel="stylesheet">
    <link href="resources/bootstrap-3.3.7/js/bootstrap-datetimepicker-master/build/css/bootstrap-datetimepicker.css"
          rel="stylesheet">


    <script src="resources/bootstrap-3.3.7/js/moment.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap-datetimepicker-master/build/js/bootstrap-datetimepicker.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap-3.3.7/js/bootstrap-select-master/dist/js/bootstrap-select.min.js"></script>


</head>
<body>
<c:set var="cheep" value="<%=AnimalType.CHEEP%>"/>
<c:set var="average" value="<%=AnimalType.AVERAGE%>"/>
<c:set var="expansive" value="<%=AnimalType.EXPANSIVE%>"/>
<c:set var="user" value="${userRoleText}"/>
<c:set var="NOHUNTER" value="<%=UserRole.NOTENOUGHSMART.getTexts()%>"/>

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
                                    <sec:authorize access="hasRole('ROLE_USER')" >
                                        <li role="presentation" class="footerList active"><a href="addOrder">New Order</a></li>
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
                    <div class="wrapper">

                        <!--date-->
                        <div class="container data">
                            <div class="invisible" id="errorMessage">
                                <div id="tooltip">
                                    <p>This animal is not available on <span></span></p>
                                </div>
                            </div>
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
                            <label for="animalSelect">Select the animal:</label>
                            <select class="selectpicker anim" data-live-search="true" id="animalSelect" onChange="updateAnim()">
                                <option value=""></option>
                                <c:forEach var="a" items="${animals}">
                                    <option value="${a.id}">${a.name},
                                        age: ${a.age}</option>
                                </c:forEach>

                            </select>
                        </div>

                        <!--time of meeting-->
                        <div class="container invisible" id="container-time">
                            <div class="selected-item" id="selected-item-time">
                                <p>You Selected: <span></span></p>
                            </div>

                            <div class="dropdown" id="time">
                                <span class="selLabel" id="selLabel-time">Select Time!</span>
                                <input type="hidden" name="cd-dropdown">
                                <ul class="dropdown-list" id="dropdown-list-time">
                                    <li data-value="1">
                                        <span>1 hour</span>
                                    </li>
                                    <li data-value="2">
                                        <span>1.5 hours</span>
                                    </li>
                                    <li data-value="3">
                                        <span>2 hours</span>
                                    </li>
                                    <li data-value="4">
                                        <span>more then 2 hours</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="wrapper">
                        <c:if test="${(user != NOHUNTER)}">
                        <!--weapon-->
                        <div class="container invisible" id="containerWeapon">
                            <div class="selected-item" id="selected-itemWeapon">
                                <p>You Selected Weapon : <span></span></p>
                            </div>

                            <div class="dropdown" id="weapon">
                                <span class="selLabel" id="selLabelWeapon">Select Weapon</span>
                                <input type="hidden" name="cd-dropdown">
                                <ul class="dropdown-list" id="dropdown-listWeapon">
                                    <li data-value="1">
                                        <span id="tooltip1"><%=Weapon.USERSWEAPON.getDisplayDescription()%><span><%=Weapon.USERSWEAPON.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="2">
                                        <span id="tooltip2"><%=Weapon.KNIF%><span><%=Weapon.KNIF.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="3">
                                        <span id="tooltip3"><%=Weapon.PISTOL%><span><%=Weapon.PISTOL.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="4">
                                        <span id="tooltip4"><%=Weapon.M16%><span><%=Weapon.M16.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="5">
                                        <span id="tooltip5"><%=Weapon.BARRETT%><span><%=Weapon.BARRETT.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="6">
                                        <span id="tooltip6"><%=Weapon.BAZOOKA%><span><%=Weapon.BAZOOKA.getDisplayDescription()%></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <!--order type-->

                        <div class="container invisible" id="containerOrderType">
                            <div class="selected-item" id="selected-itemOrderType">
                                <p>You Selected Type : <span></span></p>
                            </div>

                            <div class="dropdown" id="orderType">
                                <span class="selLabel" id="selLabelOrderType">Select Type</span>
                                <input type="hidden" name="cd-dropdown">
                                <ul class="dropdown-list" id="dropdown-listOrderType">
                                    <li data-value="1">
                                        <span id="tooltip7"><%=OrderType.MEETING%><span><%=OrderType.MEETING.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="2">
                                        <span id="tooltip8"><%=OrderType.HUNTING%><span><%=OrderType.HUNTING.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="3">
                                        <span id="tooltip9"><%=OrderType.FEED%><span><%=OrderType.FEED.getDisplayDescription()%></span></span>
                                    </li>
                                    <li data-value="4">
                                        <span id="tooltip10"><%=OrderType.SUICIDE%><span><%=OrderType.SUICIDE.getDisplayDescription()%></span></span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!--distance-->
                        <div class="container invisible" id="container-distance">
                            <div class="selected-item" id="selected-item-distance">
                                <p>You Selected Distance : <span></span></p>
                            </div>

                            <div class="dropdown" id="distance">
                                <span class="selLabel" id="selLabel-distance">Select Distance</span>
                                <input type="hidden" name="cd-dropdown">
                                <ul class="dropdown-list" id="dropdown-list-distance">
                                    <li data-value="1">
                                        <span>less then 50m</span>
                                    </li>
                                    <li data-value="2">
                                        <span>less then 500m</span>
                                    </li>
                                    <li data-value="3">
                                        <span>more then 50m</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="wrapper">
                        <!--freedom-->
                        <div class="container invisible" id="container-freedom">
                            <div class="selected-item" id="selected-item-freedom">
                                <p>You Selected: <span></span></p>
                            </div>

                            <div class="dropdown" id="freedom">
                                <span class="selLabel" id="selLabel-freedom">Will the animal free?</span>
                                <input type="hidden" name="cd-dropdown">
                                <ul class="dropdown-list" id="dropdown-list-freedom">
                                    <li data-value="1">
                                        <span>True</span>
                                    </li>
                                    <li data-value="2">
                                        <span>False</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        </c:if>
                        <div class="container invisible" id="container-price">
                            <div class="selected-item">
                                <p>Your price: <span></span></p>
                            </div>
                        </div>

                        <button type="button" class="btn btn-primary container invisible" id="confirmButton">Accept
                        </button>
                        <button type="button" class="btn btn-primary container invisible" id="OKButton">OK</button>
                    </div>

                </div>


                <c:choose>
                <c:when test="${(user != NOHUNTER)}">
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
            <input type="hidden" name="csrf_name" value="${_csrf.parameterName}"/>
            <input type="hidden" name="csrf_value" value="${_csrf.token}"/>

            <c:if test="${(user == NOHUNTER)}">
            <script type="text/javascript">
                var animalId;
                function updateAnim()
                {
                    animalId = $("#animalSelect option:selected").val();
                }

                $(document).ready(function () {


                    $(function () {
                        // Bootstrap DateTimePicker v4
                        $('.animal').removeClass('invisible');
                        $('#datetimepicker').datetimepicker();
                    });

                    $('.animal').change(function () {

                        $('#container-time').removeClass('invisible');
                    });


                    $("#selLabel-time").click(function () {
                        $('#time').toggleClass('active');
                    });

                    $("#dropdown-list-time li").click(function () {
                        $('#selLabel-time').text($(this).text());
                        $('#time').removeClass('active');
                        $('#selected-item-time p span').text($('#selLabel-time').text());
                        $('#confirmButton').removeClass('invisible');
                        var dateS = $('#datetimepicker').val();
                        var animalS = animalId;
                        var timeS = $('#selLabel-time').text();
                        var ot = "";

                        var dataVal = {
                            date: dateS,
                            id: animalS,
                            time: timeS,
                            orderType: ot
                        };
                        $.ajax({
                            url: "validatingDate?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                            contentType: "application/json",
                            type: "POST",
                            data: JSON.stringify(dataVal),
                            success: function (res) {
                                var resultAnswer = (res.split("!!!")[0] == "yes");
                                var resultMessage = res.split("!!!")[1];
                                if(resultAnswer){
                                    $('#selLabel-time').text("Select time");
                                    $('#selected-item-time p span').text("");
                                    $('#errorMessage p span').text(resultMessage);
                                    $('#errorMessage').removeClass("invisible");
                                    $('#datetimepicker').text("");
                                    $('#container-time').addClass('invisible');
                                    $('#confirmButton').addClass('invisible');
                                }else {
                                    $('#errorMessage').addClass("invisible");
                                }
                            }
                        });
                    });
                    $('#confirmButton').click(function (event) {
                        event.preventDefault();
                        var dateS = $('#datetimepicker').val();
                        var animalS = animalId;
                        var timeS = $('#selLabel-time').text();
                        var weaponS = "";
                        var orderTypeS = "";
                        var distanceS = "";
                        var isFreeS = "";

                        var data = {
                            date: dateS,
                            anim: animalS,
                            time: timeS,
                            weapon: weaponS,
                            orderType: orderTypeS,
                            distance: distanceS,
                            isFree: isFreeS
                        };
                        $.ajax({
                            url: "newOrder?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                            contentType: "application/json",
                            type: "POST",
                            data: JSON.stringify(data),
                            success: function (res) {

                                $("#container-price").removeClass("invisible");
                                $("#container-price div p span").text(res);
                                $("#confirmButton").addClass("invisible");
                                $("#OKButton").removeClass("invisible");
                                $("#OKButton").click(function (event) {
                                    event.preventDefault();
                                    $.ajax({
                                        url: "newOrderConfirm?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                                        contentType: "application/json",
                                        type: "POST",
                                        success: function (res) {
                                            console.log(res);
                                            window.location.assign("addOrder");
                                        },
                                        error: function (res) {
                                            alert(res);
                                        }
                                    })
                                })
                            },
                            error: function (res) {
                                alert(res);
                            }
                        })
                    });

                });
            </script>
            });
            </c:if>
            <c:if test="${(user != NOHUNTER)}">
            <script type="text/javascript">
                var animalId;
                function updateAnim()
                {
                    animalId = $("#animalSelect option:selected").val();
                }

                $(document).ready(function () {



                    $(function () {
                        // Bootstrap DateTimePicker v4
                        $('.animal').removeClass('invisible');
                        $('#datetimepicker').datetimepicker();
                    });

                    $('.animal').change(function () {

                        $('#container-time').removeClass('invisible');
                    });


                    $("#selLabel-time").click(function () {
                        $('#time').toggleClass('active');
                    });

                    $("#dropdown-list-time li").click(function () {
                        $('#selLabel-time').text($(this).text());
                        $('#time').removeClass('active');
                        $('#selected-item-time p span').text($('#selLabel-time').text());
                        $('#containerWeapon').removeClass('invisible');
                        var dateS = $('#datetimepicker').val();
                        var animalS = animalId;
                        var timeS = $('#selLabel-time').text();
                        var ot = "";

                        var dataVal = {
                            date: dateS,
                            id: animalS,
                            time: timeS,
                            orderType: ot
                        };
                        $.ajax({
                            url: "validatingDate?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                            contentType: "application/json",
                            type: "POST",
                            data: JSON.stringify(dataVal),
                            success: function (res) {
                                var resultAnswer = (res.split("!!!")[0] == "yes");
                                var resultMessage = res.split("!!!")[1];
                                if(resultAnswer){
                                    $('#selLabel-time').text("Select time");
                                    $('#selected-item-time p span').text($('#selLabel-time').text());
                                    $('#errorMessage p span').text(resultMessage);
                                    $('#errorMessage').removeClass("invisible");
                                    $('#containerWeapon').addClass('invisible');
                                    $('#container-time').addClass('invisible');
                                }else{
                                    $('#errorMessage').addClass("invisible");
                                }

                            },
                            error: function (res) {
                                console.log(res);
                            }
                        });

                    });

                    $("#selLabelWeapon").click(function () {
                        $('#weapon').toggleClass('active');
                    });

                    $("#dropdown-listWeapon li").click(function () {
                        $('#selLabelWeapon').text($("#"+$(this).children().attr("id")).clone().children().remove().end().text());
                        $('#weapon').removeClass('active');
                        $('#selected-itemWeapon p span').text($('#selLabelWeapon').text());
                        $('#containerOrderType').removeClass('invisible');
                    });


                    $("#selLabelOrderType").click(function () {
                        $('#orderType').toggleClass('active');
                    });

                    $("#dropdown-listOrderType li").click(function () {
                        $('#selLabelOrderType').text($("#"+$(this).children().attr("id")).clone().children().remove().end().text());
                        $('#orderType').removeClass('active');
                        $('#selected-itemOrderType p span').text($('#selLabelOrderType').text());

                        $('#container-distance').removeClass('invisible');
                        var dateS = $('#datetimepicker').val();
                        var animalS = animalId;
                        var timeS = $('#selLabel-time').text();
                        var ot = $('#selLabelOrderType').text();

                        var dataVal = {
                            date: dateS,
                            id: animalS,
                            time: timeS,
                            orderType: ot
                        };
                        $.ajax({
                            url: "validatingDate?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                            contentType: "application/json",
                            type: "POST",
                            data: JSON.stringify(dataVal),
                            success: function (res) {
                                var resultAnswer = (res.split("!!!")[0] == "yes");
                                var resultMessage = res.split("!!!")[1];
                                if(resultAnswer){
                                    $('#selLabel-time').text("Select time");
                                    $('#selected-item-time p span').text("");
                                    $('#errorMessage p span').text(resultMessage);
                                    $('#selLabelOrderType').text("Select Type");
                                    $('#selected-itemOrderType p span').text("");
                                    $('#errorMessage').removeClass("invisible");
                                    $('#datetimepicker').text("");
                                    $('#containerOrderType').addClass('invisible');
                                    $('#container-distance').addClass('invisible');
                                    $('#containerWeapon').addClass('invisible');
                                    $('#container-time').addClass('invisible');

                                }else {
                                    $('#errorMessage').addClass("invisible");
                                }
                            }
                        });
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
                        $('#confirmButton').removeClass('invisible');
                    });

                    $('#confirmButton').click(function (event) {
                        event.preventDefault();
                        var dateS = $('#datetimepicker').val();
                        var animalS = animalId;
                        var timeS = $('#selLabel-time').text();
                        var weaponS = $('#selLabelWeapon').text();
                        var orderTypeS = $('#selLabelOrderType').text();
                        var distanceS = $('#selLabel-distance').text();
                        var isFreeS = $('#selLabel-freedom').text();

                        var data = {
                            date: dateS,
                            anim: animalS,
                            time: timeS,
                            weapon: weaponS,
                            orderType: orderTypeS,
                            distance: distanceS,
                            isFree: isFreeS
                        };
                        $.ajax({
                            url: "newOrder?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                            contentType: "application/json",
                            type: "POST",
                            data: JSON.stringify(data),
                            success: function (res) {

                                $("#container-price").removeClass("invisible");
                                $("#container-price div p span").text(res);
                                $("#confirmButton").addClass("invisible");
                                $("#OKButton").removeClass("invisible");
                                $("#OKButton").click(function (event) {
                                    event.preventDefault();
                                    $.ajax({
                                        url: "newOrderConfirm?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                                        contentType: "application/json",
                                        type: "POST",
                                        success: function (res) {
                                            console.log(res);
                                            if(res == "redirect"){
                                                $("#logoutForm").serialize();
                                            }else {
                                                window.location.assign("addOrder");
                                            }
                                        },
                                        error: function (res) {
                                            alert(res);
                                        }
                                    })
                                })
                            },
                            error: function (res) {
                                alert(res);
                            }
                        })
                    });
                });
            </script>
            </c:if>

</body>
</html>