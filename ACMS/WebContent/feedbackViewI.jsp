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
 	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src = https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css> </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src = "https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    
     <link rel="stylesheet" type="text/css" href="style.css">
 	
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
                targets: [ 4 ],
                orderData: [ 4, 0 ]
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
String name = request.getParameter("c_name");
%>
<% 
 ScheduleDAO pdao = new ScheduleDAO();
 ArrayList<CandidatePojo> alc1 = pdao.getFeedbackI(name);
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
  <div class = "well"><center><h3><font color="red">FeedBack given by <%=name %></font><h3></center>  
  <table id = "keywords" class="table table-striped">
    <thead>
      <tr>
        <th>Candidate</th>
        <th>Level</th>
        <th>Result</th>
        <th>Feedback</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      
 <% while(itr1.hasNext()) {
	 			CandidatePojo cb = itr1.next();
                out.print("<tr>");
                out.println("<td><a href=\"feedbackView.jsp?c_name="+cb.getName()+"\">"+cb.getName()+"</a></td>");
                out.print("<td>" + cb.getGender()+"</td>");
                out.print("<td>" + cb.getQuali()+"</td>");
                out.print("<td>" + cb.getEmail()+"</td>");
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
