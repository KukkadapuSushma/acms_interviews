<%@page import = "com.acms.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.acms.dao.ScheduleDAO"%>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
       <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
     <link rel="stylesheet" type="text/css" href="style.css">
      <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
      <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
    
     <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/result-light.css">
      <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css">
      <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">   
      <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
  <script>
  $(document).ready(function() {
      $('#example').dataTable( {
          columnDefs: [ {
              targets: [ 0 ],
              orderData: [ 0, 1 ]
          }, {
              targets: [ 2 ],
              orderData: [ 2, 0 ]
          }, {
              targets: [ 4 ],
              orderData: [ 4, 0 ]
          } ]
      } );
  } );
  
 /*  $(document).ready(function() {
	    $('#example').dataTable({"sPaginationType": "full_numbers"});
	}); */
  </script>
  <style>
   body {
    background-image: url("bg.gif");
   }
  </style>
</head>
<body>
<%
 ScheduleDAO pdao = new ScheduleDAO();
 ArrayList<interviewPojo> alc1 = pdao.findAllInterviewes();
 Iterator<interviewPojo> itr1 = alc1.iterator();
%>
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
  <div class="col-sm-6 col-md-9  col-md-offset-1">
  <div class = "well"><center><h3>Schedule for today!<h3></center>  
  <table id = "example" class="dataTable" >
    <thead>
      <tr>
        <th>Date</th>
        <th>Interviewer</th>
        <th>Candidate</th>
        <th>Level</th>
        <th>Feedback</th>
      </tr>
    </thead>
    <tbody>       
   <tr>
   <% while(itr1.hasNext()) {
	 			interviewPojo usrpojo = itr1.next();
	 			 out.print("<tr>");
	 			 out.print("<td style = 'padding-top:35px;'>" + usrpojo.getslots());
	                out.print("<td style = 'padding-top:35px;'>" + usrpojo.getinterviewer());
	                out.print("<td style = 'padding-top:35px;'>" + usrpojo.getcandidate());
	                out.print("<td style = 'padding-top:35px;'>" + usrpojo.getlevel());
	                %>
               	<td>
      			<form action="setFeedback.jsp" method="post">
      			<input type="hidden" value="<%=usrpojo.getinterviewer()%>" name="int_name">
      			<input type="hidden" value="<%=usrpojo.getcandidate()%>" name="can_name">
      			<input type="hidden" value="<%=usrpojo.getid() %>" name="interview_id">
      			<input type="hidden" value="<%=usrpojo.getlevel() %>" name="level">
      			<button class = "btn btn-danger" id="myBtn" >Feedback <span class="glyphicon glyphicon-envelope"></span></button>
      			</form>
      			</td>
                <%
                out.print("</tr>");
   }
%>   
      </tr>
    </tbody>
  </table>
</div>
</div>
</div>
</body>     
</html>