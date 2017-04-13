<%
String usern = (String)session.getAttribute("U");
if(usern == null){
	response.sendRedirect("loginView.jsp?error= Please Login");
}
String error = request.getParameter("error");
String msg = request.getParameter("msg");
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Interview Scheduler</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
   body {
    background-image: url("bg.gif");
   }
  </style>
</head>
<body>
<br>
<br>
<br>
 <% if(msg != null){
	   %> <center><h3><font color = white><%=msg%></font></h3></center> 
   <%} %>
<br>
<br>
<div class="container">
  <div class = "row">
  <div class="col-sm-6 col-md-8 col-md-offset-2">
    <div class = "well"><center><h3>WELCOME!! </h3></center>         
</div>
</div>
</div>
 </div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
