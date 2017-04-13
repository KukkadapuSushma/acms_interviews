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
<title>Interview Scheduler</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
::-webkit-scrollbar { 
    display: none; 
}
body {
    background-image:url("frame_a_wp.gif");
}
ul#menu {
    top: 170px;
    right: 20px;
    position:absolute;
}
ul#menu li a {
    background-color: transparent;
    color: white;
    text-decoration: none;
}

ul#menu li a:hover {
    color: orange;
}
li {
    list-style-type: none;
}
</style>
</head>
<body>
<br>
<br>
<center>
<a href="homeView.jsp" target="frame_b">
<img src="https://images.cooltext.com/4846392.png" width="280" height="70" alt="Sched Amazon" /></a>
</center>
<br>
<br>
<br>
<br>
<br>
<h4>
<ul id="menu">
	<%
	if(usern == null){ %>
		<li><a href="addInterviewer.jsp" target="_top">Add Interviewer</a></li><br>
  		<li><a href="addCandidate.jsp" target="_top">Add Candidate</a></li><br>
		<li><a href="scheduleView.jsp" target="frame_b">Create Schedule</a></li><br>
  		<li><a href="schedule.jsp" target = "_top">Schedule for today</a></li><br>
  		<li><a href="feedbackSet.jsp" target = "_top">Give Feedback</a></li><br>
  		<li><a href="getFeedback.jsp" target = "_top">Get Feedback On Candidate</a></li><br>
  		<li><a href="getfeedbackI.jsp" target = "_top">Get Feedback Given by Interviewer</a></li><br>
	<%}else{ %>
  <li><a href="addInterviewer.jsp" target="frame_b">Add Interviewer</a></li><br>
  <li><a href="addCandidate.jsp" target="frame_b">Add Candidate</a></li><br>
  <li><a href="scheduleView.jsp" target="frame_b">Create Schedule</a></li><br>
  <li><a href="schedule.jsp" target = "frame_b">Schedule for today</a></li><br>
  <li><a href="feedbackSet.jsp" target = "frame_b">Give Feedback</a></li><br>
  <li><a href="getFeedback.jsp" target = "frame_b">Get Feedback On Candidate</a></li><br>
  <li><a href="getfeedbackI.jsp" target = "frame_b">Get Feedback Given by Interviewer</a></li><br>
  <%} %>
  <li><button class = "btn btn-danger" ><a href="LogoutController" target = "_top">Logout</a></button></li><br>
</ul>  
</h4>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
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