<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <body>
    you sent the following request headers:
    <br/>
    <table border="1">
    	<tr>
    		<th>
    		header
    		</th>
    		<th>
    		value
    		</th>
    	</tr>
    	<c:forEach var="entry" items="${header }">
    		<tr>
    			<td>
    				${entry.key}
    			</td>
    			<td>
    				${entry.value}
    			</td>
    		</tr>
    	</c:forEach>
    </table>
  </body>
</html>
