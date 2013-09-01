<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>take the pizza</title>
		<style type="text/css">
		 H1{
		 font-zie: 12pt;
		 font-weight: bold;
		 }
		 .missing{
		 	color: red;
		 }
		</style>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	</head>
	<body>
		<form action="process.jsp" method="post" accept-charset="utf-8">
		
		<p>
		Welcome to Take the Pizza Online! We're eager to take your order
      for pizza via our new web form.
		</p>
		<p>Please fill out the fields below and click on "Place Order" when you're done</p>
	<c:if test="${param.name eq 'missing' or param.address eq 'missing' }">
		<p class="missing">
		请填写你的信息！
		</p>
	</c:if>
		<h1>Your Information:</h1>
	<table>
		<tr>
			<td>
				Name:
			</td>
			<td>
				<input type="text" name="name" size="30" value="${sessionScope.name }"/>
				<c:if test="${param.name eq 'missing' }">
					<span class="missing">
						*必须的填写信息
					</span>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
			 Address:
			</td>
			<td>
				<textarea rows="4" cols="40" name="address">${sessionScope.address }</textarea>
				<c:if test="${param.address eq 'missing' }">
					<span class="missing">
						*必须填写信息
					</span>
				</c:if>
			</td>
		</tr>
	</table>	
	<h1>订单类型</h1>
	<table>
		<tr>
			<td>
			<input type="radio" name="purchaseType" value="Home Delivery"/>
			</td>
			<td>
			Home Delivery
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="purchaseType" value="Take Away" />
			</td>
			<td>
			Take Away
			</td>
		</tr>
	</table>
	<h1>Please select any additional topping:</h1>
	<table>
		<tr>
			<td>
				<input type="checkbox" name="pepers" value="yes"/>
			</td>
			<td>
			Pepers
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="dianxin" value="yes"/>
			</td>
			<td>
				点心
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="mouse" value="yes" />
			</td>
			<td>
			Mouse Innards
			</td>
		</tr>
	</table>
	
	<h1>批萨大小</h1>
		<table>
			<tr>
				<td>
				Size
				</td>
				<td>
					<select name="size">
						<option>small</option>
						<option selected="true">中</option>
						<option>大</option>
					</select>
				</td>
			</tr>
		</table>
	<input type="submit" name="purchaseType" value="Place Order" checked="true" />
		</form>
	</body>
</html>