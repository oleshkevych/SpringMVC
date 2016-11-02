<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div style="text-align: center;margin-top: 5%">User</div>
	
	<div style="text-align: center; margin-top: 5%">
		<sf:form action="newUserAdd" method="post">
			<input name="nameUser" placeholder="name"/>
			<br>
			<br>
			<input name="emailUser" placeholder="email"/>
			<br>
			<br>
			<input name="phoneUser" placeholder="phone number"/>
			<br>
			<br>
			<input name="passwordUser" placeholder="password"/>
			<br>
			<br>
			<button>save Commodity</button>
		</sf:form>
	</div>
</body>
</html>