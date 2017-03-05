<%
String user = request.getParameter("user");
String error = request.getParameter("error");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="styles/bootstrap.css" rel="stylesheet">
    <link href="styles/stylish-portfolio.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<style>
.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 80%;
      margin: auto;
  }
  body {
    background-color:dimgray;
  }
  #content{
    position: absolute;
    top: 40px;
    right: 230px;
  }
  #uu {
    position: absolute;
    top: 10px;
    right: 20px;
  }
  h3{
    color: black;
  }
</style>
</head>
<body>
    <!-- Header -->
    <header id="top" class="header">
       <div class="well well-sm">
<img src="https://images.cooltext.com/4846392.png" width="489" height="100" alt="Amazon" />
 <% if(error != null){
	   %> <center><h3><font color = red><%=error%></font></h3></center> 
   <%} %>
<div class="container">
  <div id="content">
       <button type="button" class="btn btn-danger btn-lg" title = "Login to continue" id="myBtn">Login</button>    
  </div>
</div>
<div id = "uu">
<img src="http://www.artsfon.com/pic/201510/1920x1080/artsfon.com-72885.jpg" width="200" height="100" alt="Amazon"/>
</div>
</div>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="interview4.gif" width="460" height="345">
        <div class="carousel-caption">
        </div>
      </div>
    
      <div class="item">
        <img src="interview1.gif" width="460" height="345">
        <div class="carousel-caption">
          <h3>Schedule for the day</h3>
        </div>
      </div>

      <div class="item">
        <img src="interview4.gif" width="460" height="345">
        <div class="carousel-caption">
          <h3>Check out your colleague's feedback too!!</h3>
        </div>
      </div>
    </div>
  </div>
</div>
</header>
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" method = "post" action="logincontroller">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" id="name" name="user" class="form-control" placeholder="Enter username" required name = "user">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" type="password" id="password" name="password" placeholder = "Enter Password" required>
            </div>
              <button type="submit" class="btn btn-danger btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          
        </div>
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

       
</body>

</html>