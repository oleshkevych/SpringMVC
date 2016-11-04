<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<div style="text-align: center; margin-top: 20%">

		${user.getUserName() }
		<c:forEach var="comm" items="${u.commodities }">
				${comm.name } ${comm.price}
		
				<br>
		</c:forEach>



		<sf:form action="saveImage?${_cr }" method="post"
			enctype="multipart/form-data">
			<input type="file" name="image">
			<button>add foto</button>

		</sf:form>

	</div>
</body>
</html>