<html>
<%@include file="sqlBasic.jsp"%>
<%
	msg = (String) session.getAttribute("msg"); 
%>
<head>

<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<%@include file="header.jsp"%>
	Please fix the following error(s):<br>
	<div id='error'>
		<%=msg%>
	</div>
	<%@ include file="incTail.jsp"%>
</body>
</html>
