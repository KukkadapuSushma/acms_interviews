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
</style>
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
  <center><h3>Interviewer Information</h3></center>
  <br>
  <form role="form" method = "post" action = "AddInterviewerController">
    <div class="form-group">
      <label for="name">Interviewer name:</label>
      <input type="text" class="form-control" name="name" id="name" placeholder="Enter name of Interviewer" required>
    </div>
    <div class="form-group">
      <label for="level">Level:</label>
         <select class="form-control" style="max-width: 300;" id = "level" name="level" required>
      	<option value="#">Select</option>
  		<option value="1">1</option>
  		<option value="2">2</option>
  		<option value="3">3</option>
  		<option value="4">4</option>
	</select>      
<!--       <input type="text" class="form-control" name="level" id="level" placeholder="Enter level of Interviewer" required> -->
    </div>
    <div class="form-group">
      <label for="address">Phone number:</label>
      <input type="text" data-error = "Please enter a correct 10 digit number" class="form-control" name="phone" id="phone" pattern = "^[789]\d{9}$" placeholder="Enter phone number of Interviewer" required>
    </div>
    <div class="form-group">
      <label for="address">Email id:</label>
      <input type="text" class="form-control" name="email" id="email" pattern ="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Enter email id of Interviewer" required>
    </div>
    <center><button type="submit" class="btn btn-danger">Submit Info</button></center>
   </form>
</div>
</div>
</div>
</div>
</body>
</html>