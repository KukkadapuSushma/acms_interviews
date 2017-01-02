<%@page import = "com.acms.pojo.*"%>
<%@page import = "java.util.Iterator" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.acms.dao.ScheduleDAO"%>

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
<%
 ScheduleDAO pdao = new ScheduleDAO();
 ArrayList<CandidatePojo> alc1 = pdao.getSchedule();
 Iterator<CandidatePojo> itr1 = alc1.iterator();
%>
<br>
<br>
<br>
<br>
<br>
<div class="container">
  <div class = "row">
  <div class="col-sm-6 col-md-8 col-md-offset-2">
  <div class = "well"><center><h3>Ur Schedule for today!<h3></center>  
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Time Slot</th>
        <th>Interviewer</th>
        <th>Candidate</th>
        <th>Feedback</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      
 <% while(itr1.hasNext()) {
	 			CandidatePojo cb = itr1.next();
                out.print("<tr>");
                out.print("<td>" + cb.getEmail()+ "-" + cb.getPhone());
                out.print("<td>" + cb.getGender());
                out.print("<td>" + cb.getQuali());
                %>
                <td>
      			<form action="feedbackController" method="post">
      			<input type="hidden" value="<%=cb.getLevel() %>" name="interview_id">
      			<button class = "btn btn-success">Feedback <span class="glyphicon glyphicon-envelope"></span></button>
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
