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
    <title>Your Orders</title>
    <link type="text/css" rel="stylesheet" href="resources/homeStyle.css">
    <link type="text/css" rel="stylesheet" href="resources/userOrders.css">
    <link type="text/css" rel="stylesheet" href="resources/newOrder.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap -->
    <link href="resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="user" value="${userRoleText}"/>
<c:set var="HUNTER" value="<%=UserRole.HUNTER.getTexts()%>"/>
<c:choose>
<c:when test="${(user eq HUNTER)}">
<div id="pageH">
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
                                        <li role="presentation" class="footerList"><a href="addOrder">New Order</a></li>
                                        <li role="presentation" class="footerList active"><a href="myOrders">My Profile</a></li>
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
      <div>
          <div class="container data">
              <div class="form-group">

                  <p>Enter animal's photo:</p>
                  <div id="formUpload">
                      <label for="file">File to upload:</label>
                      <img id="avaImage" src="${activeUser.pathImage}" alt="Image">
                      <input type="file" name="file" id="file" class="form-control inputAnim"><br/>
                      <p style="color: red" class="invisible" id="errorUpload"></p>
                      <%--<label for="submit">Press on image to upload new image!</label>--%>
                      <%--<input type="submit" value="Upload" id="submit" class="form-control inputAnim">--%>
                  </div>
                  <%--<div class="input-group date invisible" id="formDelete">--%>
                      <%--<label for="deleteI" id="confLabel">Your file <span></span> was uploaded.</label>--%>
                      <%--<input type="submit" value="Reload the file" id="deleteI" class="form-control inputAnim">--%>
                  <%--</div>--%>
              </div>
              <div id="propertiesU">
              <div class="nameU">
                  <label id="nameU" style="cursor: pointer">user name: ${activeUser.userName()}</label>
                  <input id="nameUChanged" class="invisible" type="text" value="${activeUser.userName()}"/>
              </div>
              <div class="phoneU">
                  <label id="phoneU" style="cursor: pointer">phone number: ${activeUser.phoneNumber}</label>
                  <input id="phoneUChanged" class="invisible" type="text" value="${activeUser.phoneNumber}"/>
              </div>
              <div class="passwordU">
                  <label id="passwordU" style="cursor: pointer">Change your password</label>
                  <input id="passwordUChanged" class="invisible" type="text" value="password"/>
              </div>
              <div class="emailU">
                  <label id="emailU" style="cursor: pointer">email: ${activeUser.email}</label>
                  <input id="emailUChanged" class="invisible" type="text" value="${activeUser.email}"/>
              </div>
              <div class="bonusesU">
                  <label id="bonusesU">Your bonuses: ${activeUser.bonuses}</label>
              </div>
              <div class="actionsU">
                  <label id="actionsU">Your actions: ${activeUser.quantityActions}</label>
              </div>
              <div class="deleteU">
                  <button id="deleteU" class="btn btn-danger" style="cursor: pointer">DELETE</button>
              </div>
              </div>
              <div class="ordersU">

                      <label>Orders</label>
                  <ul id="ordersU">
                      <c:forEach var="a" items="${activeUser.userOrders}">
                          <li class="${a.id}"
                              style="cursor: pointer; border: 2px solid gray; border-radius: 10px; padding: 5px;">
                              animals: ${a.animals}, date: ${a.date}, price: ${a.price}</li>
                          <br>
                      </c:forEach>
                  </ul>
              </div>
          </div>
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
            <input type="hidden" name="csrf_name" value="${_csrf.parameterName}"/>
            <input type="hidden" name="csrf_value" value="${_csrf.token}"/>
<script type="text/javascript">
    $("#nameU").click(function(event){
        event.preventDefault();
        $("#nameU").addClass("invisible");
        $("#nameUChanged").removeClass("invisible");
        var oldValue = $("#nameUChanged").val();
        $("#nameUChanged").change(function () {
            var newValue = $("#nameUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadName?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#nameUChanged").addClass("invisible");
                        $("#nameU").text("name: "+newValue);
                        $("#nameU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
        $("#nameUChanged").blur(function () {
            var newValue = $("#nameUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadName?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#nameUChanged").addClass("invisible");
                        $("#nameU").text("name: "+newValue);
                        $("#nameU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
    });

    $("#phoneU").click(function(event){
        event.preventDefault();
        $("#phoneU").addClass("invisible");
        $("#phoneUChanged").removeClass("invisible");
        var oldValue = $("#phoneUChanged").val();
        $("#phoneUChanged").change(function () {
            var newValue = $("#phoneUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadPhone?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#phoneUChanged").addClass("invisible");
                        $("#phoneU").text("phone number: "+newValue);
                        $("#phoneU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
        $("#phoneUChanged").blur(function () {
            var newValue = $("#phoneUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadPhone?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#phoneUChanged").addClass("invisible");
                        $("#phoneU").text("phone number: "+newValue);
                        $("#phoneU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
    });

    $("#passwordU").click(function(event){
        event.preventDefault();
        $("#passwordU").addClass("invisible");
        $("#passwordUChanged").removeClass("invisible");
        var oldValue = $("#passwordUChanged").val();
        $("#passwordUChanged").change(function () {
            var newValue = $("#passwordUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadPassword?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#passwordUChanged").addClass("invisible");
                        $("#passwordU").text("new password: "+newValue);
                        $("#passwordU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
        $("#passwordUChanged").blur(function () {
            var newValue = $("#passwordUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadPassword?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#passwordUChanged").addClass("invisible");
                        $("#passwordU").text("new password: "+newValue);
                        $("#passwordU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
    });

    $("#emailU").click(function(event){
        event.preventDefault();
        $("#emailU").addClass("invisible");
        $("#emailUChanged").removeClass("invisible");
        var oldValue = $("#emailUChanged").val();
        $("#emailUChanged").change(function () {
            var newValue = $("#emailUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadEmail?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#emailUChanged").addClass("invisible");
                        $("#emailU").text("email: "+newValue);
                        $("#emailU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
        $("#emailUChanged").blur(function () {
            var newValue = $("#emailUChanged").val();
            if((oldValue != newValue)&&(newValue != "")) {
                $.ajax({
                    url: "uploadEmail?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                    contentType: "application/json",
                    type: "POST",
                    data: newValue,
                    success: function (res) {
                        $("#emailUChanged").addClass("invisible");
                        $("#emailU").text("email: "+newValue);
                        $("#emailU").removeClass("invisible");
                    },
                    error: function (res) {
                        alert("Error:" + res);
                    }
                })
            }
        });
    });

    $("#deleteU").click(function (event) {
        event.preventDefault();
        $.ajax({
            url: "deleteU?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
            contentType: "application/json",
            type: "POST",
            success: function () {
                window.location.assign("login");
            }
        })
    });

    $("#ordersU li").click(function(event){
        event.preventDefault();
        var orderId = $(this).attr('class');
        console.log(orderId);
            $.ajax({
                url: "uploadOrder?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                contentType: "application/json",
                type: "POST",
                data: orderId,
                success: function (res) {
                    window.location.assign("addOrder");
                },
                error: function (res) {
                    alert("Error:" +res);
                }
            })
    });

    $("#file").change(function (event) {
        event.preventDefault();
        if ($("#file").val().length !== 0) {
            var formData = new FormData();
            formData.append('file', $('input[type=file]')[0].files[0]);
            formData.append('name', $('input[type=file]')[0].files[0].name);

            $.ajax({
                url: "uploadFile?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                processData: false,
                contentType: false,
                type: "POST",
                data: formData,
                success: function (res) {

                    $.ajax({
                        url: "uploadImage?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                        contentType: "application/json",
                        type: "POST",
                        success: function (res) {
                            $("#avaImage").attr("src",res);

                        },
                        error: function (res) {
                            alert(res);
                        }
                    })


                },
                error: function (res) {
                    $("#errorUpload").text(res);
                    $("#errorUpload").removeClass("invisible");

                }
            })

        } else {
            alert("Give me the picture!!!")
        }
    })

</script>

</body>
</html>