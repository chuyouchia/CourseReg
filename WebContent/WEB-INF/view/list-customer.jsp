<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>List of Customers</title>
 <!-- reference the css style sheet -->
 <link type = "text/css"
 		rel = "stylesheet"
 		href = "${pageContext.request.contextPath}/resources/style.css"/>
</head>
<body>

 	<div>
 		<div>
 			<h2>Customer Status list</h2>
 		</div>
 		<input type = "button" value ="Add customer"
 		onClick = "window.location.href = 'showFormForAdd'; return false;"
 		class = "add-button" 
 		/> <!-- add-button class is for the CSS style sheet to target it -->
 		<div>
 			<table>
 				<tr>
 					<th>First Name</th>
 					<th>Last Name</th>
 					<th>Email</th>
 					<th>Action</th>
 					
 				</tr>
 				<!-- For each customer, loop over and print -->
 				<c:forEach var = "tempCustomer" items = "${customers}">
 					<c:url var = "updateLink" value = "showFormForUpdate">
 						<c:param name="customerId" value = "${tempCustomer.id}"></c:param>
 					</c:url>
 					<c:url var = "deleteLink" value = "delete">
 						<c:param name="customerId" value = "${tempCustomer.id}"></c:param>
 					</c:url>
 					<tr>
 					<td>${tempCustomer.firstName}</td>
 					<td>${tempCustomer.lastName}</td>
 					<td>${tempCustomer.email}</td>
 					<td>
 					<a href = "${updateLink}">Update</a>
 					| 
 					<a href = "${deleteLink}"
 					onclick="if(!(confirm('Are you sure you want to delete ${tempCustomer.firstName}?'))) return false">Delete</a>
 					</td>
 					
 					</tr>
 				</c:forEach>
 			</table>
 		</div>
 	</div>
</body>
</html>