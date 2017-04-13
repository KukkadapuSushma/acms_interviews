<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import = "com.acms.dao.ScheduleDAO"%>
<%@page import = "com.acms.pojo.*"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

     <script src="http://code.jquery.com/jquery.min.js"></script>
     <script src="https://code.jquery.com/jquery-1.12.3.js"></script>
     <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <link href="http://getbootstrap.com/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="http://getbootstrap.com/dist/js/bootstrap.js"></script>
    <script src="http://1000hz.github.io/bootstrap-validator/dist/validator.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
  <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link data-require="bootstrap-css@3.1.1" data-semver="3.1.1" rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="style.css" />
  <script src="script.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <style>
	.border{
		margin-left:250px;
		padding: 5px;
		height:370px;
		border: 1px solid black;
	}
    .well{
    	margin-top:30px;
    	margin-left:40px;
    }
    </style>
    <style>
   body {
    background-image: url("bg.gif");
   }
  </style>
    
	<script>
	$(function() {
	  
	  $(document).on('click', '#check', function() {
	  
	    if ($(this).val() == 'Check All') {
	      $('input:checkbox').prop('checked', true);
	      $(this).val('Uncheck All');
	    } else {
	      $('input:checkbox').prop('checked', false);
	      $(this).val('Check All');
	    }
	  });
	  
	});
</script>
<script>
   $(document).ready(function() {
       $('table.display').DataTable( {
       });
  }); 
</script>
 
</head>
<body>
<% if(msg != null){
	   %> <center><h3><font color = white><%=msg%></font></h3></center> 
   <%} %>

 <div class="well">
 <ul class="nav nav-tabs"  id="guide-tabs">
    <li class="active"><a href="#tabs-1" data-toggle="tab">Select Candidates<i class="fa"></i></a></li>
    <li><a href="#tabs-2" data-toggle="tab">Select Interviewers<i class="fa"></i></a></li>
 </ul>
 <div class="tab-content">
   <div class="tab-pane active" id="tabs-1">
   <form action = "CandidatesScheduled" method = "post">
   	 
      <div class = "table" align = "center">
		<table id = "" class="table table-striped display ">
		<thead>
		<tr>
		<th><input type = "button" class="btn btn-danger dropdown-toggle" id = "check" value = "Check All"></th>
		<th>Candidate Name</th>
		<th>Gender</th>
		<th>Qualification</th>
		<th>Level</th></tr>
		</thead>
    	<%
 		ScheduleDAO dDAO = new ScheduleDAO();
		try{
			ArrayList<CandidatePojo> ald = dDAO.getCandidates();
			Iterator<CandidatePojo> itr = ald.iterator();
			while(itr.hasNext()){
				CandidatePojo cb = (CandidatePojo)itr.next();
			out.print("<tr>");
			%>
			<td style = 'padding-top:20px;'><input type = "checkbox" name = "check" value = <%=cb.getName()%>></td>
			<%
			out.print("<td style = 'padding-top:35px;'>" + cb.getName() + "</td>");
			out.print("<td style = 'padding-top:35px;'>" + cb.getGender() +"</td>");
			out.print("<td style = 'padding-top:35px;'>" + cb.getQuali() +"</td>");
			out.print("<td style = 'padding-top:35px;'>" + cb.getEmail()+"</td>");
			%>
			<% 
				out.print("</tr>");
			 }
			}catch(NumberFormatException e){
				System.out.println(e);
			}
		%>
	</table></div>
	<center>
	<input type = "submit" class="btn btn-danger dropdown-toggle" value = "Select Candidates"><br></br>
    </center>
    </form></div>
<div class="tab-pane" id="tabs-2">
		<form method="post" action="SelectedInterviewersController" data-toggle="validator"  name = "f"class="form-horizontal"role = "form">
		<br>
		 <br>
		 <div class = "table" align = "center">
		<table id = "" class="display table table-striped">		
			
				<thead><tr>
					<th><input type = "button" class="btn btn-danger dropdown-toggle" id = "check" value = "Check All"></th>
					<th>Interviewer Name</th>
					<th>Level</th></tr>
					</thead>
				<%
				try{
					ArrayList<InterviewerPojo> ald = dDAO.getInterviewers();
					Iterator<InterviewerPojo> itr = ald.iterator();
					while(itr.hasNext()){
						InterviewerPojo tb = (InterviewerPojo)itr.next();
					out.print("<tr>");
			   %>
				<td><input type = "checkbox" name = "check" value = <%=tb.getName()%>></td>
			<%
				out.print("<td style = 'padding-top:35px;'>" + tb.getName() +"</td>");
				out.print("<td style = 'padding-top:35px;'>" + tb.getLevel() +"</td>");
				%>
				<% 
					out.print("</tr>");
				 }
				}catch(NumberFormatException e){
					System.out.println(e);
				}
			%></table></div>
		<h3 align="center"><button type="submit" name="add" class="btn btn-danger">Schedule <span class="glyphicon glyphicon-plus"></span></button></h3>
		</form>
	</div>
	 </div>
 </div>
<script>
  $("#test").click(function() {
    $('#guide-tabs li:eq(1) a').tab('show');
  })
  $("#test1").click(function() {
    $('#guide-tabs li:eq(2) a').tab('show');
  }) 
</script>
</body>

</html>
