<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <body>
    Good
    <%
      Calendar calendar = Calendar.getInstance();
      if (calendar.get(Calendar.AM_PM) == Calendar.AM) {
        out.print("Morning");
      } else {
        out.print("Afternoon");
      }
    %>
    ${header["user-agent"]}
    ${my }
  </body>
</html>
