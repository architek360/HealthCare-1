<%@page import="java.sql.*,java.util.*"%>
<%
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String zip=request.getParameter("zip");
String user=request.getParameter("user");
String pass=request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:port/path", "username", "password");
Statement st=con.createStatement();

st.executeUpdate("insert into company(street_address, city, state, zip,login, password) values('"+address+"','"+city+"','"+state+"','"+zip+"','"+user+"','"+pass+"')");

response.sendRedirect("/health/index.jsp");
%>
