<% String id = request.getParameter("interview_id"); 
String name = request.getParameter("int_name"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Interview Scheduler</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
  <script src="https://use.fontawesome.com/c7b9d606b4.js"></script>
  <style>
  .firstLabel {
    margin-right: 50px;
	}
   body {
    background-image: url("bg.gif");
   }
   	input[type=radio]{ display: none; }
	input[type=radio]:checked + label { background-color: #ccc;}
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
  <div class="col-sm-6 col-md-9  col-md-offset-1">
  <div class = "well">
<form method = "post" action = "feedbackController">
    <div class="form-group">
      <label for="NameofCandidate">Feedback by:</label>
      <input class="form-control" id="Cand_name" value = <%=name %> type="text">
    </div>
    <div class="form-group">
      <label for="comment">Feedback:</label>
      <textarea class="form-control" rows="10" name = "feed" id="comment" required></textarea>
    </div>
    <div id="sites">
    <center>
    <input type="radio" name="result" id="s" value = "Selected" required/><label class="firstLabel" for="s" ><a><i class="fa fa-thumbs-up fa-3x" aria-hidden="true"></a></i></label>
    <input type="radio" name="result" id="r" value = "Rejected"/><label class="secondLabel" for="r"><a><i class="fa fa-thumbs-down fa-3x" aria-hidden="true"></a></i></label>
    </center>
    </div>
<br>
	<input type="hidden" value="<%=id %>" name="i_name">
<center><button type="submit" class="btn btn-danger">Submit</button></center>
</form>
</div>
</div>
</div>
</div>
</body>
</html>