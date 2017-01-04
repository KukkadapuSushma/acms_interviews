<% String id = request.getParameter("interview_id"); %>
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
<br>
<br>
<br>
<br>
<br>
<div class="container">
<div class = "row">
  <div class="col-sm-6 col-md-4 col-md-offset-4">
  <div class = "well">
<form method = "post" action = "feedbackController">
    <div class="form-group" >
      <label for="InterviewId">Interview Id:</label>
      <input class="form-control" name = "i_name" id="i_name" value = <%=id %>  type="text">
    </div>
    <div class="form-group">
      <label for="comment">Feedback:</label>
      <textarea class="form-control" rows="10" name = "feed" id="comment"></textarea>
    </div>
    
            <div class="form-group">
                 <label class="col-xs-3 control-label">Result: </label>
                <div class="col-xs-5">
                    <select class="form-control"   style="max-width: 300;" name="result" required>
                    <option value="">Select</option>
                        <option value="Selected">Selected</option>
                        <option value="Rejected">Rejected</option>
               </select>
               
               <div class = "help-block with-errors"></div>
            </div>
            </div>
            
 <center><button type="submit" class="btn btn-danger">Submit</button></center>
 </form>
</div>
</div>
</div>
</body>
</html>