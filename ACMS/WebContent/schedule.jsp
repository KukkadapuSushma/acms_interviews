<%@page import = "com.acms.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.acms.dao.ScheduleDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Interview Scheduler</title>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    <script>
    $(document).ready(function() {
        $('#keywords').DataTable( {
            columnDefs: [ {
                targets: [ 0 ],
                orderData: [ 0, 1 ]
            }, {
                targets: [ 1 ],
                orderData: [ 1, 0 ]
            }, {
                targets: [ 5 ],
                orderData: [ 5, 0 ]
            } ]
        } );
    } );
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
 ArrayList<interviewPojo> alc1 = pdao.findInterviewes();
 Iterator<interviewPojo> itr1 = alc1.iterator();
%>
<br>
<br>
<br>
<br>
<br>
<div class="container">
  <div class = "row">
  <div class="col-sm-6 col-md-8 col-md-offset-2">
  <div class = "well"><center><h3>Schedule for today!<h3></center>  
  <table id = "keywords" class="table table-striped">
    <thead>
      <tr>
        <th>Time Slot</th>
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
	 			 out.print("<td>" + usrpojo.getslot());
	                out.print("<td>" + usrpojo.getinterviewer());
	                out.print("<td>" + usrpojo.getcandidate());
	                out.print("<td>" + usrpojo.getlevel());
	                %>
   
               <td>
      			<form action="setFeedback.jsp" method="post">
      			<input type="hidden" value="<%=usrpojo.getinterviewer()%>" name="int_name">
      			<input type="hidden" value="<%=usrpojo.getid() %>" name="interview_id">
      			<button class = "btn btn-danger">Feedback <span class="glyphicon glyphicon-envelope"></span></button>
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
