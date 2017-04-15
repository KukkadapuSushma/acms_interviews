<%
String usern = (String)session.getAttribute("U");
if(usern == null){
	response.sendRedirect("loginView.jsp?error= Please Login");
}
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
<br>
<br>
<form method = "post">
	<a href= "getFeedback.jsp">
  <button  class="btn btn-danger" type="button" style = "position:absolute;left:400px;top:200px;">On Candidate</button></a>
  <a href= "getfeedbackI.jsp">
  <button  class="btn btn-danger" type="button" style = "position:absolute;left:600px;top:200px;">By Interviewer</button></a>
  </form>
</body>
</html>