<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
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
<br>
<br>
<br>
<br>
<br>
<div class="container">
<div class = "row">
  <div class="col-sm-6 col-md-4 col-md-offset-4">
  <div class = "well">
<form>
    <div class="form-group">
      <label for="NameofCandidate">Feedback about:</label>
      <input class="form-control" id="Cand_name" type="text">
    </div>
    <div class="form-group">
      <label for="comment">View:</label>
      <textarea class="form-control" rows="10" id="comment"></textarea>
    </div>
</form>
 <center><button type="submit" class="btn btn-danger">Submit</button></center>
</div>
</div>
</div>
</body>
</html>
