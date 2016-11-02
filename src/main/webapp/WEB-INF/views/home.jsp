<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Vova


	<br>
	<sec:authentication property="name" />
	<br>
	<br>

	<!--  <a href="newUser">add user</a>-->
	<sec:authorize access="!isAuthenticated()">
		<a href="newUser">registration</a>
		<br>
		<a href="loginpage">login page</a>
	</sec:authorize>

	
<br>
	<c:forEach var="commodity" items="${commodities }">
		${commodity.name } ${commodity.price}
		<sec:authorize access="isAuthenticated()">
			<a href="buy/${commodity.id}">Buy</a>
		</sec:authorize>
		<br>
	</c:forEach>
	
	
	<sec:authorize access="isAuthenticated()">
			<a href="profile">Profile</a>
		</sec:authorize>


<sec:authorize access="isAuthenticated()">
		<sf:form action="logout" method="post">
			<a href="commodity">add commodity</a>
			<br>
			<br>
			<br>
			<button>logout</button>
		</sf:form>
	</sec:authorize>

</body>
</html>