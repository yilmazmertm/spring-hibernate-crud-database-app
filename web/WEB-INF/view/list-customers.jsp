<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customers Page</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<h3>List Customers...</h3>

<div id="wrapper">
    <div id="header">
        <h2> Customer Relationship Manager </h2>
    </div>
</div>
<div id="container">
    <div id="content">
        <input type="button" value="Add Customer"
               onclick="window.location.href= 'showFormForAdd'; return false;"
                class="add-button" />
        <br><br>
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>E-mail</th>
                <th>Action</th>
            </tr>
            <c:forEach var="tempCustomer" items="${customers}">
                <c:url var="updateLink" value="/customer/showFormForUpdate" >
                    <c:param name="customerId" value="${tempCustomer.id}" />
                </c:url>

                <c:url var="deleteLink" value="/customer/delete" >
                    <c:param name="customerId" value="${tempCustomer.id}" />
                </c:url>
                <tr>
                    <td>${tempCustomer.firstName}</td>
                    <td>${tempCustomer.lastName}</td>
                    <td>${tempCustomer.email}</td>
                    <td> <a href="${updateLink}"> Update | <a href="${deleteLink}"
                                                            onclick="if (!(confirm('Are you sure you want to delete this ?'))) return false" >Delete</a></a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
