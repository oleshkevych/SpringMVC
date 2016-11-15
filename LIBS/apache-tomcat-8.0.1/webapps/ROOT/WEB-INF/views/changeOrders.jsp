<%@ page import="ua.com.bestZoo.entity.AnimalType" %>
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
    <title>Admin</title>
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
    <input type="hidden" id="idAnimal" value="${animalSelected.id}"/>
    <input type="hidden" id="idZooOrder" value="${zooOrderSelected.id}"/>
    <div id="container">
        <c:choose>
        <c:when test="${animalToChange}">
            <div class="animalChan">
            </c:when>
            <c:otherwise>
                <div class="animalChan" style="display: none">
                </c:otherwise>
                </c:choose>


            <div class="wrapper">

                <div class="container data">
                    <div class="form-group">
                        <p>Enter animal's photo:</p>
                        <div id="formUpload">
                            <%--<form enctype="multipart/form-data" id="uploadForm">--%>
                            <label for="file">New file upload:</label>
                            <input type="file" name="file" id="file" class="form-control inputAnim"><br/>
                            <p style="color: red" class="invisible" id="errorUpload"></p>
                            <label for="submit">Press here to upload the image!</label>
                            <input type="submit" value="Upload" id="submit" class="form-control inputAnim">
                            <%--</form>--%>
                        </div>
                        <div class="input-group date invisible" id="formDelete">
                            <label for="deleteI" id="confLabel">Your file <span></span> was uploaded.</label>
                            <input type="submit" value="Reload the file" id="deleteI" class="form-control inputAnim">
                        </div>
                    </div>
                </div>
                <%--name--%>
                <div class="container data" id="animalNameCont">
                    <div class="form-group">
                        <p>Enter animal's name:</p>
                        <div>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's name"
                                   aria-describedby="sizing-addon1" id="animalName" value="${animalSelected.name}"/>
                        </div>
                    </div>
                </div>

                <!--description-->
                <div class="container data" id="descriptionCont">
                    <div class="form-group">
                        <p>Enter something about the animal:</p>
                        <div>
                            <textarea rows="5" class="form-control" placeholder="Animal's information"
                                      aria-describedby="sizing-addon1"
                                      id="description">${animalSelected.description}</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapper">
                <!--age-->
                <div class="container data" id="ageCont">
                    <div class="form-group">
                        <p>Enter animal' age:</p>
                        <div class='input-group date'>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's age"
                                   aria-describedby="sizing-addon1" id="age" value="${animalSelected.age}"/>
                        </div>
                    </div>
                </div>

                <!--price-->
                <div class="container data" id="priceCont">
                    <div class="form-group">
                        <p>Enter animal' price:</p>
                        <div>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's age"
                                   aria-describedby="sizing-addon1" id="price" value="${animalSelected.price}"/>
                        </div>
                    </div>
                </div>
                <%--type--%>
                <div class="container " id="container-typeA">
                    <div class="selected-item" id="selected-item-typeA">
                        <p>You Selected Type : <span>${animalSelected.animalType}</span></p>
                    </div>

                    <div class="dropdown" id="typeA">
                        <span class="selLabel" id="selLabel-typeA">${animalSelected.animalType}</span>
                        <input type="hidden" name="cd-dropdown">
                        <ul class="dropdown-list" id="dropdown-list-typeA">
                            <li data-value="1">
                                <span>${cheep}</span>
                            </li>
                            <li data-value="2">
                                <span>${average}</span>
                            </li>
                            <li data-value="3">
                                <span>${expansive}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper">
                <!--for sale-->
                <div class="container " id="container-forSale">
                    <div class="selected-item" id="selected-item-forSale">
                        <p>You Selected sale Status : <span>${animalSelected.forSale}</span></p>
                    </div>

                    <div class="dropdown" id="forSale">
                        <span class="selLabel" id="selLabel-forSale">${animalSelected.forSale}</span>
                        <input type="hidden" name="cd-dropdown">
                        <ul class="dropdown-list" id="dropdown-list-forSale">
                            <li data-value="1">
                                <span>True</span>
                            </li>
                            <li data-value="2">
                                <span>False</span>
                            </li>
                        </ul>
                    </div>
                </div>


                <button type="button" class="btn btn-primary container " id="confirmButton">Accept</button>
            </div>
        </div>

                <c:choose>
                <c:when test="${zooOrderToChange}">
                <div class="createZooOrderCont" class="list-group">
                    </c:when>
                    <c:otherwise>
                        <div id="createZooOrderCont" class="list-group" style="display: none">
                        </c:otherwise>
                        </c:choose>
            <div class="wrapper">
                <!--Animal name-->

                <div class="container data " id="animalNameContO">
                    <div class="form-group">
                        <p>Enter animal's name:</p>
                        <div>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's name"
                                   aria-describedby="sizing-addon1" id="animalNameO" value="${zooOrderSelected.name}"/>
                        </div>
                    </div>
                </div>

                <!--description-->
                <div class="container data" id="descriptionContO">
                    <div class="form-group">
                        <p>Enter something about the animal:</p>
                        <div>
                            <textarea rows="5" class="form-control" placeholder="Animal's information"
                                      aria-describedby="sizing-addon1" id="descriptionO">${zooOrderSelected.description}</textarea>
                        </div>
                    </div>
                </div>
                <!--age-->
                <div class="container  data" id="ageContO">
                    <div class="form-group">
                        <p>Enter animal' age:</p>
                        <div class='input-group date'>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's age"
                                   aria-describedby="sizing-addon1" id="ageO" value="${zooOrderSelected.age}"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapper">
                <!--price-->
                <div class="container data" id="priceContO">
                    <div class="form-group">
                        <p>Enter animal' price:</p>
                        <div>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's age"
                                   aria-describedby="sizing-addon1" id="priceO" value="${zooOrderSelected.price}"/>
                        </div>
                    </div>
                </div>

                <!--animal type-->
                <div class="container" id="container-typeAO">
                    <div class="selected-item" id="selected-item-typeAO">
                        <p>You Selected Type : <span>${zooOrderSelected.animalType}</span></p>
                    </div>

                    <div class="dropdown" id="typeAO">
                        <span class="selLabel" id="selLabel-typeAO">${zooOrderSelected.animalType}</span>
                        <input type="hidden" name="cd-dropdown">
                        <ul class="dropdown-list" id="dropdown-list-typeAO">
                            <li data-value="1">
                                <span>${cheep}</span>
                            </li>
                            <li data-value="2">
                                <span>${average}</span>
                            </li>
                            <li data-value="3">
                                <span>${expansive}</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <!--date-->
                <div class="container data">
                    <div class="form-group">
                        <p>Select the date:</p>
                        <div class='input-group date'>
                            <input type='text' class="form-control" id='datetimepicker' value="${zooOrderSelected.date}"/>
                            <input type='hidden' id='oldDate' value="${zooOrderSelected.date}"/>
                            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                        </div>

                    </div>
                </div>

            </div>

            <div class="wrapper">
                <button type="button" class="btn btn-primary container " id="confirmButtonO">Accept</button>
            </div>
        </div>
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
<input type="hidden" name="csrf_name" value="${_csrf.parameterName}"/>
<input type="hidden" name="csrf_value" value="${_csrf.token}"/>

<script type="text/javascript">
    $(document).ready(function () {

//add photo
        $("#submit").click(function (event) {
            $("#animalNameCont").removeClass("invisible");
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
                        $("#formUpload").addClass("invisible");
                        $('#formDelete label span').text(res);
                        $("#formDelete").removeClass("invisible");


                    },
                    error: function (res) {
                        $("#errorUpload").text(res);
                        $("#errorUpload").removeClass("invisible");
                        $("#animalNameCont").addClass("invisible");

                    }
                })

            } else {
                alert("Give me the picture!!!")
            }
        });

        $("#formDelete").click(function (event) {
            event.preventDefault();
            $.ajax({
                url: "deleteFile?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                type: "POST",
                success: function (res) {
                    console.log(res);
                    $("#formUpload").removeClass("invisible");
                    $("#formDelete").addClass("invisible");
                },
                error: function (res) {
                    console.log(res);
//                    $("#errorUpload").test(res);
//                    $("#errorUpload").removeClass("invisible");
//                    $("#animalNameCont").addClass("invisible");

                }
            })
        });
    });
    $("#selLabel-typeA").click(function () {
        $('#typeA').toggleClass('active');
    });
    $("#dropdown-list-typeA li").click(function () {
        $('#selLabel-typeA').text($(this).text());
        $('#typeA').removeClass('active');
        $('#selected-item-typeA p span').text($('#selLabel-typeA').text());
        $('#container-forSale').removeClass('invisible');
    });

    $("#selLabel-forSale").click(function () {
        $('#forSale').toggleClass('active');
    });
    $("#dropdown-list-forSale li").click(function () {
        $('#selLabel-forSale').text($(this).text());
        $('#forSale').removeClass('active');
        $('#selected-item-forSale p span').text($('#selLabel-forSale').text());
        $('#confirmButton').removeClass('invisible');
    });

    $('#confirmButton').click(function (event) {
        event.preventDefault();

        $('#confirmButton').removeClass("btn-primary");
        $('#confirmButton').addClass("btn-default");
        var nameA = $('#animalName').val();
        var descriptionA = $('#description').val();
        var ageA = $('#age').val();
        var priceA = $('#price').val();
        var typeA = $('#selected-item-typeA p span').text();
        var forSaleA = ($('#selected-item-forSale p span').text());
        var imageA = $("#formUpload").hasClass("invisible");
        var idA = $("#idAnimal").val();
        var photoAdded = "false";
        if (imageA) {
            photoAdded = "true";
        }

        <%--if(typeAString == ${"cheep"}){--%>
        <%--<c:set var="typeA" value="<%=AnimalType.CHEEP%>"/>--%>
        <%--}else if(typeAString == ${"average"}){--%>
        <%--<c:set var="typeA" value="<%=AnimalType.AVERAGE%>"/>--%>
        <%--}else if(typeAString == ${"expansive"}){--%>
        <%--<c:set var="typeA" value="<%=AnimalType.EXPANSIVE%>"/>--%>
        <%--}--%>
        if (nameA) {
            if (descriptionA) {
                if ($.isNumeric(ageA)) {
                    if ($.isNumeric(priceA)) {
                        if (typeA) {

                            $('#confirmButton').prop('disabled', true);
                            var animal = {
                                id: idA,
                                name: nameA,
                                description: descriptionA,
                                age: ageA,
                                price: priceA,
                                forSale: forSaleA,
                                animalType: typeA,
                                photo: photoAdded
                            };
                            $.ajax({
                                url: "changeTheAnimal?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
                                contentType: "application/json",
                                type: "POST",
                                data: JSON.stringify(animal),
                                success: function (res) {
//                                            alert(res.splice(".")[0]);
//                                            $("#container").css("backgroundImage", (res.splice(".")[1]+"."+res.splice(".")[2]));
                                    $('#confirmButton').prop('disabled', false);
                                    $('#confirmButton').removeClass("btn-default");
                                    $('#confirmButton').addClass("btn-primary");
//                                            $.ajax({
//                                                url: "adminR?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
//                                                contentType: "application/json",
//                                                type: "GET"
//                                            });
                                    window.location.assign("/admin");
                                },
                                error: function (res) {
                                    alert(res);
                                }
                            })
                        } else {
                            alert("Add type!!")
                        }
                    } else {
                        alert("Enter price properly!!")
                    }
                } else {
                    alert("Enter age properly!!")
                }
            } else {
                alert("Add description!!")
            }
        } else {
            alert("Add name!!")
        }
    });

    $("#selLabel-typeAO").click(function () {
        $('#typeAO').toggleClass('active');
    });
    $("#dropdown-list-typeAO li").click(function () {
        $('#selLabel-typeAO').text($(this).text());
        $('#typeAO').removeClass('active');
        $('#selected-item-typeAO p span').text($('#selLabel-typeAO').text());
    });

    $(function () {
        $('#datetimepicker').datetimepicker();
    });

    $("#confirmButtonO").click(function () {
        $('#confirmButtonO').removeClass("btn-primary");
        $('#confirmButtonO').addClass("btn-default");
        var nameAO = $('#animalNameO').val();
        var descriptionAO = $('#descriptionO').val();
        var ageAO = $('#ageO').val();
        var priceAO = $('#priceO').val();
        var typeAO = $('#selected-item-typeAO p span').text();
        var dateAO = $('#datetimepicker').val();
        if(dateAO == $("#oldDate").val()){
            dateAO = "false";
        }
        $('#confirmButtonO').prop('disabled', true);
        var id = $("#idZooOrder").val();
        var zOrder = {
            id: id,
            name: nameAO,
            description: descriptionAO,
            age: ageAO,
            price: priceAO,
            date: dateAO,
            animalType: typeAO
        };
        $.ajax({
            url: "changeTheZooOrder?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
            contentType: "application/json",
            type: "POST",
            data: JSON.stringify(zOrder),
            success: function (res) {
                $('#confirmButtonO').prop('disabled', false);
                $('#confirmButtonO').removeClass("btn-default");
                $('#confirmButtonO').addClass("btn-primary");
                window.location.assign("/admin");
            },
            error: function (res) {
                alert(res);
            }
        })
    });
</script>
</body>
</html>
