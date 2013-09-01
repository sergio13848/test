<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var="datasource" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://127.0.0.1/pizza" 
				   user="root" password="123456" />

				   

<html>
	<head>
		<title>您的订单明细</title>
		<style stype="text/css">
			H1{
				font-size: 12pt;
				font-weight: bild;
			}
		</style>
		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
	</head>
	<body>
	 <h1>your details</h1>
	 <c:if test="${param.name eq '' or param.address eq '' }">
	 	<c:set var="name" value="${param.name }" scope="session"/>
	 	<c:set var="address" value="${param.address }" scope="session"/>
	  <c:redirect url="pizza.jsp">
	  	<c:if test="${param.name eq ''}">
	  		<c:param name="name" value="missing"/>
	  	</c:if>
	  	<c:if test="${param.address eq '' }">
	  		<c:param name="address" value="missing"/>
	  	</c:if>	
	  </c:redirect>
	 </c:if>
<sql:transaction>
	<sql:update>
	insert into customer(name, address) values(?, ?)
	<sql:param value="${param.name }"/>
	<sql:param value="${param.address }"/>
	</sql:update>
	
	<sql:query var="customer_id">
	select max(customer_id) as id from customer
	</sql:query>
	<sql:update >
		insert into pizza.order (customer_id, delivery, size)values(?, ?, ?)
		<sql:param value="${customer_id.rows[0].id }"/>
		<sql:param value="${param.purchaseType}" />
		<sql:param value="${param.size }"/>
	</sql:update>
	
	<sql:query var="oder_id">
	select max(order_id) as id from pizza.order
	</sql:query>
	<c:forEach items="${paramValue.topping }" var="topping">
	 	<sql:update>
	 	insert into topping (order_id, topping) values(?, ?)
	 	<sql:param value="${order_id.rows[0].id }"/>
	 	<sql:param value="${topping }"/>
	 	</sql:update>
	</c:forEach>
</sql:transaction>
	 <table>
	 	<tr>
	 		<td>name: </td>
	 		<td>${param.name}</td>
	 	</tr>
	 	<tr>
	 		<td>address</td>
	 		<td>${param.address }</td>
	 	</tr>
	 	<tr>
	 		<td>delivery type:</td>
	 		<td>${param.purchaseType }</td>
	 	</tr>
	 	<tr>
	 		<td>topppings</td>
	 		<td>${paramValues.topping[0]}</td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td>${paramValues.topping[1]}</td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td>${paramValues.topping[2]}</td>
	 	</tr>
	 	<tr>
	 		<td>size</td>
	 		<td>${param["size"]}</td>
	 	</tr>
	 </table>
	 
	 谢谢你的惠顾！
	</body>
</html>




















