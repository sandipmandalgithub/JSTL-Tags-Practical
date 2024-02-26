<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<hr>
	<h1 style="text-align: center;">WELCOME TO JSTL CORE TAG DEMO</h1>
	<hr>
	<hr>

	<c:out value="Sandip Mandal"></c:out>
	<br>
	<br>

	<c:import url="navbar.jsp" var="data"></c:import>
	<c:out value="${data}"></c:out>

	<br>
	<br>

	<c:set var="result" value="${100*2}" scope="application"></c:set>
	Before:
	<c:out value="${result}"></c:out>

	<br>
	<br>

	<c:remove var="result" />
	After:
	<c:out value="${result}"></c:out>

	<br>
	<br>

	<c:catch var="exception">
		<%
		String s = null;
		s.toLowerCase();
		%>

	</c:catch>

	<c:if test="${exception!=null }">
		<p>${exception }</p>
		<p>${exception.message}</p>
	</c:if>
	<br>
	<br>

	<c:set value="25" var="age"></c:set>

	<c:if test="${age>20}">
		<p>You are Adult</p>
	</c:if>

	<br>
	<br>

	<c:set var="age" value="${bgl8 }"></c:set>
	<c:choose>
		<c:when test="${age>10 }">
			<p>You are Adult</p>
		</c:when>
		<c:when test="${age<10}">
			<p>You are not Adult</p>
		</c:when>
		<c:otherwise>
			<p>Invalid age</p>
		</c:otherwise>
	</c:choose>

	<br>
	<br>

	<c:forEach var="number" begin="0" end="10">
		<c:out value="${number }"></c:out>

	</c:forEach>

	<br>
	<br>
	<c:forTokens items="I,AM,SANDIP,MANDAL" delims="," var="string">
		<c:out value="${string}"></c:out>

	</c:forTokens>

	<br>
	<br>

	<%-- <c:url value="/index.jsp" var="pageUrl">

		<c:param name="em" value="sandip@gmail.com"></c:param>
		<c:param name="ps" value="Sandip"></c:param>
	</c:url>
	<c:out value="${pageUrl}"></c:out> --%>

	<br>
	<br>

	<%-- 	<c:redirect url="https://www.google.com"></c:redirect> --%>

	<hr>
	<hr>
	<h1 style="text-align: center;">WELCOME TO JSTL SQL TAG DEMO</h1>
	<hr>
	<hr>

	          <!--HOW TO ACCESS DATABASE USING JSTL SQL TAGS-->

	<h1>View All Users :</h1>

	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/userdb" user="root"
		password="Sandip@2001"></sql:setDataSource>

	<sql:query dataSource="${db}" var="rs">  
           select * from user;  
       </sql:query>

	<table border="2" width="100%">
		<tr>
			<th>User ID</th>
			<th>User Name</th>
			<th>User Email</th>
			<th>User Address</th>
		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>
				<td><c:out value="${table.userId}" /></td>
				<td><c:out value="${table.userName}" /></td>
				<td><c:out value="${table.userEmail}" /></td>
				<td><c:out value="${table.userAddress}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>