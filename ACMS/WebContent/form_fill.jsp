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
  <center><h3>Fill it!</h3></center>
  <br>
  <form role="form">
    <div class="form-group">
      <label for="name">Interviwers:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter interviewers and their levels">
    </div>
    <div class="form-group">
      <label for="phno">Candidates:</label>
      <input type="text" class="form-control" id="phno" placeholder="Enter candidate names">
    </div>
    <div class="form-group">
      <label for="email">Slot Time:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter time for each interview">
    </div>
    <div class="form-group">
      <label for="address">Schedule Timings:</label>
      <input type="text" class="form-control" id="address" placeholder="Enter Timings for the day">
    </div>
    <center><button type="submit" class="btn btn-danger">Create Schedule</button></center>
   </form>
</div>
</div>
</div>
</div>
</body>
</html>
