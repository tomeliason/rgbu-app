<%@ page import="java.net.InetAddress" %>
<%@ page import="javax.servlet.http.Cookie" %>
<html>
<title>RGBU App Version 18.1</title>
<body bgcolor="green">
<h3>Welcome to RGBU App Version 18.1!</h3>
<%
  Object attr = session.getAttribute("counter");
  int counter = (attr != null ? ((Integer) attr) : 0);
  counter++;
  session.setAttribute("counter", counter);
  out.println("Number of application invocations: " + counter + "<br>");
%>
<hr>
<%
  out.println("Managed Server Name " + System.getProperty("weblogic.Name") + "<br>");
  
  out.println("Hostname " + InetAddress.getLocalHost().getHostName() + "<br>");
  Cookie[] cookies = request.getCookies();
  String jSessionId = null;

  if (cookies != null) {
    for (int i = 0; i < cookies.length; i++) {
      if ("JSESSIONID".equals(cookies[i].getName())) {
        jSessionId = cookies[i].getValue();
      }
    }
  }
  out.println("JSESSIONID is " + jSessionId);
  
%>
</body>
</html>
