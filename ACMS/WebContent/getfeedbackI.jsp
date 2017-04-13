<% String id = request.getParameter("interview_id");
%>
<%
String usern = (String)session.getAttribute("U");
if(usern == null){
	response.sendRedirect("loginView.jsp?error= Please Login");
}
%>

<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.acms.dao.*"%>
<%@page import = "com.acms.pojo.*"%>

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
   <%
 ScheduleDAO pdao = new ScheduleDAO();
 ArrayList<CandidatePojo> alcdis = pdao.getAllDistinctInterviewers();
 CandidatePojo cb;
 Iterator<CandidatePojo> itr1 = alcdis.iterator(); 
%>
   
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">
<div class = "row">
  <div class="col-sm-6 col-md-4 col-md-offset-4">
  <div class = "well">
<form method = "post" action = "feedbackView.jsp">
    <div class="form-group">
      <label for="InterviewId">Interviewer Name:</label>
        <center>
    	<div class="dropdown">
  		<button  class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown" style = "position:absolute;top:-25px;">Select<span class="glyphicon glyphicon-download-alt">
  		</span></button>
  		<ul class="dropdown-menu" style = "position:absolute;left:100px;top:5px;">
    		<% while(itr1.hasNext()) {
    	    	cb = itr1.next();
 		%>
   			<li><a href="feedbackViewI.jsp?i_name=<%= cb.getName()%>" name = i_name value = <%= cb.getName()%> ><%= cb.getName()%></a></li><%} %>
  		</ul>
	</div>
 </center>
      
    </div>
  </form>
</div>
</div>
</div>
</body>
</html>