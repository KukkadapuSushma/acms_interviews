<%
String usern = (String)session.getAttribute("U");
if(usern == null){
	response.sendRedirect("loginView.jsp?error= Please Login");
}
String error = request.getParameter("error");
String msg = request.getParameter("msg");
%>

<html>
<head>
<title>Amazon</title>
<frameset cols = "20%,80%" frameborder = "0">
    <frame src = "frame_a.jsp" frameborder = "0" noresize = "noresize" name = "frame_a">
    <frame src = "homeView.jsp" frameborder = "0" noresize = "noresize" name = "frame_b">
</frameset>  
</head>
</html>