<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/style.css">
</head>
<body>


	<div style="text-align: center; margin-top: 20%">
	
	<c:forEach var="comm" items="${commodities}">
		${comm.name}<a href="del/${comm.id}" >delete</a>
		<br>
	</c:forEach>
	${commodities}
	<br>
	<sf:form action="selectGet" method="post">
	<select name="formSelect">
	<c:forEach var="comm" items="${commodities}">
		<option>${comm.name}</option>
	</c:forEach>
	</select>
	<button>select</button>
	</sf:form>
	
		<%-- <form action="newCommodity" method="post">
			<input name="nameCommodity" placeholder="commodity name"/>
			<br>
			<br>
			<input name="priceCommodity" placeholder="commodity price"/>
			<br>
			<br>
			<button>save Commodity</button>
		</form> --%>
		
		<sf:form modelAttribute="commodity" action="newCommodity" method="post">
		    <sf:input path="name" placeholder="commodity name"/>
			<br>
			<br>
			
			<sf:input path="price" placeholder="commodity price"/>
			<br>
			<br>
			<button>save Commodity</button>
		</sf:form>
	</div>
</body>
</html>