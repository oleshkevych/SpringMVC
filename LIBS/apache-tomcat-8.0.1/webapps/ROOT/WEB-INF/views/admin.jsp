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

    <script src="resources/bootstrap-3.3.7/js/jquery.min.js"></script>
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
                    <li role="presentation" class="footerList"><a href="addOrder">Make new order</a>
                    </li>
                    <li role="presentation" class="footerList active"><a href="admin">My page</a></li>
                    <li role="presentation" class="footerList">
                        <sf:form action="logout" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="formRegistButton footerList">Log Out</button>
                        </sf:form>
                    </li>

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
        <button class="btn bg-primary" id="showAddAnimal">Add Animal</button>
        <div id="addAnimal" class="invisible list-group">

            <div class="wrapper">

                <!--image-->
                <div class="container data">
                    <div class="form-group">
                        <p>Enter animal's photo:</p>
                        <div id="formUpload">
                            <%--<form enctype="multipart/form-data" id="uploadForm">--%>
                            <label for="file">File to upload:</label>
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

                <!--Animal name-->

                <div class="container data invisible" id="animalNameCont">
                    <div class="form-group">
                        <p>Enter animal's name:</p>
                        <div>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's name"
                                   aria-describedby="sizing-addon1" id="animalName"/>
                        </div>
                    </div>
                </div>

                <!--description-->
                <div class="container invisible data" id="descriptionCont">
                    <div class="form-group">
                        <p>Enter something about the animal:</p>
                        <div>
                            <textarea rows="5" class="form-control" placeholder="Animal's information"
                                      aria-describedby="sizing-addon1" id="description"></textarea>
                        </div>
                    </div>
                </div>


            </div>
            <div class="wrapper">
                <!--age-->
                <div class="container invisible data" id="ageCont">
                    <div class="form-group">
                        <p>Enter animal' age:</p>
                        <div class='input-group date'>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's age"
                                   aria-describedby="sizing-addon1" id="age"/>
                        </div>
                    </div>
                </div>

                <!--price-->
                <div class="container invisible data" id="priceCont">
                    <div class="form-group">
                        <p>Enter animal' price:</p>
                        <div>
                            <input type="text" class="form-control inputAnim" placeholder="Animal's age"
                                   aria-describedby="sizing-addon1" id="price"/>
                        </div>
                    </div>
                </div>

                <!--animal type-->
                <div class="container invisible" id="container-typeA">
                    <div class="selected-item" id="selected-item-typeA">
                        <p>You Selected Type : <span></span></p>
                    </div>

                    <div class="dropdown" id="typeA">
                        <span class="selLabel" id="selLabel-typeA">Select Animal's Type:</span>
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
                <div class="container invisible" id="container-forSale">
                    <div class="selected-item" id="selected-item-forSale">
                        <p>You Selected sale Status : <span></span></p>
                    </div>

                    <div class="dropdown" id="forSale">
                        <span class="selLabel" id="selLabel-forSale">Selected sale Status</span>
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


                <button type="button" class="btn btn-primary container invisible" id="confirmButton">Accept</button>
            </div>


        </div>
        <button class="btn bg-primary" id="showZooOrders">Zoo Orders</button>
        <div id="zooOrders" class="invisible list-group">

            <div id="zooOrdersCont" class="invisible list-group">

                <c:forEach var="zo" items="${zooOrders }">
                    <div class="descriptionPanel">
                        <div class="dataO">
                            <p> ${zo.name}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.description}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.price}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.age}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.date}</p>
                        </div>

                        <div class="dataO">
                            <p> ${zo.animalType}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.completed}</p>
                        </div>
                    </div>
                    <br>
                </c:forEach>
            </div>
        </div>

        <button class="btn bg-primary" id="showUsers">Users</button>
        <div id="users" class="invisible list-group">

                <c:forEach var="zo" items="${users }">
                    <div class="descriptionPanel">
                        <div class="dataO">
                            <img src="${zo.pathImage}" alt="Photo"/>
                        </div>
                        <div class="dataO">
                            <p> ${zo.username}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.phoneNumber}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.email}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.bonuses}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.quantityActions}</p>
                        </div>

                        <div class="dataO">
                            <p> ${zo.quantityFeeds}</p>
                        </div>
                        <div class="dataO">
                            <p> ${zo.userRole}</p>
                        </div>
                    </div>
                    <br>
                </c:forEach>
        </div>

        <button class="btn bg-primary" id="showOrdersUsers">Users orders</button>
        <div id="ordersUsers" class="invisible list-group">
            <c:forEach var="zo" items="${orderUsers }">
                <div class="descriptionPanel">
                    <div class="dataO">
                        <p> ${zo.orderType}</p>
                    </div>
                    <div class="dataO">
                        <p> ${zo.date}</p>
                    </div>
                    <div class="dataO">
                        <p> ${zo.price}</p>
                    </div>
                    <div class="dataO">
                        <p> ${zo.weapon}</p>
                    </div>
                    <div class="dataO">
                        <p> ${zo.animals}</p>
                    </div>

                    <div class="dataO">
                        <p> ${zo.timeOfMeeting}</p>
                    </div>
                    <div class="dataO">
                        <p> ${zo.distance}</p>
                    </div>
                </div>
                <br>
            </c:forEach>
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
        })
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
//name
        $("#animalName").change(function () {
            $("#descriptionCont").removeClass("invisible");
        });

//description
        $("#description").change(function () {
            $("#ageCont").removeClass("invisible");
        });
        $("#age").change(function () {
            $("#priceCont").removeClass("invisible");
        });

        $("#price").change(function () {
            $("#container-typeA").removeClass("invisible");
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

            <%--if(typeAString == ${"cheep"}){--%>
            <%--<c:set var="typeA" value="<%=AnimalType.CHEEP%>"/>--%>
            <%--}else if(typeAString == ${"average"}){--%>
            <%--<c:set var="typeA" value="<%=AnimalType.AVERAGE%>"/>--%>
            <%--}else if(typeAString == ${"expansive"}){--%>
            <%--<c:set var="typeA" value="<%=AnimalType.EXPANSIVE%>"/>--%>
            <%--}--%>
            if (imageA) {
                if (nameA) {
                    if (descriptionA) {
                        if ($.isNumeric(ageA)) {
                            if ($.isNumeric(priceA)) {
                                if (typeA) {

                                    $('#confirmButton').prop('disabled', true);
                                    var animal = {
                                        name: nameA,
                                        description: descriptionA,
                                        age: ageA,
                                        price: priceA,
                                        forSale: forSaleA,
                                        animalType: typeA
                                    };
                                    $.ajax({
                                        url: "addAnimal?" + $("input[name=csrf_name]").val() + "=" + $("input[name=csrf_value]").val(),
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
            } else {
                alert("Add photo!!")
            }

        });


        $("#showAddAnimal").click(function () {
            if ($("#addAnimal").hasClass("invisible")) {
                $("#addAnimal").removeClass("invisible");
                $("#showAddAnimal").removeClass("bg-primary");
                $("#showAddAnimal").addClass("bg-default");
                $("#showZooOrders").addClass("invisible");
                $("#showUsers").addClass("invisible");
                $("#showOrdersUsers").addClass("invisible");
            } else {
                $("#addAnimal").addClass("invisible");
                $("#showAddAnimal").addClass("bg-primary");
                $("#showAddAnimal").removeClass("bg-default");
                $("#showZooOrders").removeClass("invisible");
                $("#showUsers").removeClass("invisible");
                $("#showOrdersUsers").removeClass("invisible");
            }
        });
        $("#showZooOrders").click(function () {
            if ($("#zooOrders").hasClass("invisible")) {
                $("#zooOrders").removeClass("invisible");
                $("#showZooOrders").removeClass("bg-primary");
                $("#showZooOrders").addClass("bg-default");
                $("#showAddAnimal").addClass("invisible");
                $("#showUsers").addClass("invisible");
                $("#showOrdersUsers").addClass("invisible");
            } else {
                $("#zooOrders").addClass("invisible");
                $("#showZooOrders").addClass("bg-primary");
                $("#showZooOrders").removeClass("bg-default");
                $("#showAddAnimal").removeClass("invisible");
                $("#showUsers").removeClass("invisible");
                $("#showOrdersUsers").removeClass("invisible");
            }
        });
        $("#showUsers").click(function () {
            if ($("#users").hasClass("invisible")) {
                $("#users").removeClass("invisible");
                $("#showUsers").removeClass("bg-primary");
                $("#showUsers").addClass("bg-default");
                $("#showZooOrders").addClass("invisible");
                $("#showAddAnimal").addClass("invisible");
                $("#showOrdersUsers").addClass("invisible");
            } else {
                $("#users").addClass("invisible");
                $("#showUsers").addClass("bg-primary");
                $("#showUsers").removeClass("bg-default");
                $("#showZooOrders").removeClass("invisible");
                $("#showAddAnimal").removeClass("invisible");
                $("#showOrdersUsers").removeClass("invisible");
            }
        });
        $("#showOrdersUsers").click(function () {
            if ($("#ordersUsers").hasClass("invisible")) {
                $("#ordersUsers").removeClass("invisible");
                $("#showOrdersUsers").removeClass("bg-primary");
                $("#showOrdersUsers").addClass("bg-default");
                $("#showZooOrders").addClass("invisible");
                $("#showUsers").addClass("invisible");
                $("#showAddAnimal").addClass("invisible");
            } else {
                $("#ordersUsers").addClass("invisible");
                $("#showOrdersUsers").addClass("bg-primary");
                $("#showOrdersUsers").removeClass("bg-default");
                $("#showZooOrders").removeClass("invisible");
                $("#showUsers").removeClass("invisible");
                $("#showAddAnimal").removeClass("invisible");
            }
        })
    })

</script>

</body>
</html>