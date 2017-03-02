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
  <title>form fill</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body {
    background-image:url("bg.gif");
}
::-webkit-scrollbar { 
    display: none; 
}
</style>
</head>
<body>
<br>
<br>
<br>

 <% if(msg != null){
	   %> <center><h3><font color = red><%=msg%></font></h3></center> 
   <%} %>
<br>
<br>
<div class="container">
<div class = "row">
  <div class="col-sm-6 col-md-9  col-md-offset-1">
  <div class = "well">
  <center><h3>Candidate Details</h3></center>
  <br>
  <form role="form" method = "post" action = "AddCandidateController">
    <div class="form-group">
      <label for="name">Candidate name:</label>
      <input type="text" class="form-control" name = "name_c" id="name_c" placeholder="Enter name of candidate" required>
    </div>
    <div class="form-group">
      <label for="gender">Gender:</label>
      <select class="form-control" style="max-width: 300;" id = "gender" name="gender" required>
      	<option value="" disabled selected>Select</option>
  		<option value="F">Female</option>
  		<option value="M">Male</option>
	</select>      
    </div>
    <div class="form-group">
      <label for="qualification">Qualification:</label>
      <input type="text" class="form-control"  name = "qualification" id="qualification" placeholder="Enter qualification of candidate" required>
    </div>
    <div class="form-group">
      <label for="Email">Email:</label>
      <input type="text" class="form-control" name = "email" id="email" pattern ="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Enter email of candidate" required>
    </div>
    <div class="form-group">
      <label for="address">Phone number:</label>
      <input type="text" class="form-control" name = "phone" id="phone" pattern = "^[789]\d{9}$" data-error = "Please enter a correct 10 digit number" placeholder="Enter phone number of candidate" required>
    </div>
    <center><button type="submit" class="btn btn-danger">Submit Info</button></center>
   </form>
</div>
</div>
</div>
</div>
</body>
</html>
