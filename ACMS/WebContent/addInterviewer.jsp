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
      <input type="text" class="form-control" id="name" placeholder="Enter name of Interviewer">
    </div>
    <div class="form-group">
      <label for="level">Level:</label>
      <input type="text" class="form-control" id="level" placeholder="Enter level of Interviewer">
    </div>
    <div class="form-group">
      <label for="address">Phone number:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter phone number of Interviewer">
    </div>
    <div class="form-group">
      <label for="address">Email id:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email id of Interviewer">
    </div>
    <center><button type="submit" class="btn btn-danger">Submit Info</button></center>
   </form>
</div>
</div>
</div>
</div>
</body>
</html>