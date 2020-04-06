<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap4/bootstrap.min.css">
<script src="bootstrap4/jquery.min.js"></script>
<script src="bootstrap4/popper.min.js"></script>
<script src="bootstrap4/bootstrap.min.js"></script> 
<script type="text/javascript" src="zingchart.min.js"></script> 
<title>Insert title here</title>
</head>
<body style="background-color: #18191b" style="font-family : Arial">

<!-- La barre de navigation -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="#"><img alt="" src="images/logot2c.png" width="150" heigth="150"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-end">
<ul class="navbar-nav " >
  <li class="nav-item">
    <a class="nav-link" href="Acceuil.jsp">Acceuil</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="Statistiques">Statistiques</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="GeniusADev">GeniusADev</a>
  </li>
</ul>
</nav>
</nav>




<!--  Milieu de la page , photos avec explication -->
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>

<div class="container mt-3">
<div id="myCarousel" class="carousel slide">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li class="item1 active"></li>
    <li class="item2"></li>
    <li class="item3"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/about_bg.png" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
    <h2>Qui sommes nous ?</h2>
    <p><h4>Time2Code by GeniusADev</h4></p>
  </div>
    </div>
    <div class="carousel-item">
      <img src="images/about_bg.png" alt="Chicago" width="1100" height="500">
       <div class="carousel-caption">
      <h2>De Quoi ?</h2>
    <p><h4>Une competition d'algorithmique et programmation</h4></p>
    </div>
    </div>
    <div class="carousel-item">
      <img src="images/about_bg.png" alt="New York" width="1100" height="500">
      <div class="carousel-caption">
      <h2>Pour qui ?</h2>
    <p><h4>Pour les etudiants passionés</h4></p>
    </div>
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#myCarousel">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#myCarousel">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>

<br><br>
<script>
$(document).ready(function(){
  // Activate Carousel
  $("#myCarousel").carousel();
    
  // Enable Carousel Indicators
  $(".item1").click(function(){
    $("#myCarousel").carousel(0);
  });
  $(".item2").click(function(){
    $("#myCarousel").carousel(1);
  });
  $(".item3").click(function(){
    $("#myCarousel").carousel(2);
  });
    
  // Enable Carousel Controls
  $(".carousel-control-prev").click(function(){
    $("#myCarousel").carousel("prev");
  });
  $(".carousel-control-next").click(function(){
    $("#myCarousel").carousel("next");
  });
});
</script>

<div class="row">
  <div class="col-sm-6">
  <h2 class="text-left text-muted">
  Temps restant pour commencer les candidatures de la saison de 2020
  </h2>
  <!-- Compte a rebours pour candidature saison 2019 -->
  <h2 class="text-left text-warning">
  <p id="demo"></p> </h2>
<script>
var countDownDate = new Date("Feb 5, 2020 15:37:25").getTime();

var x = setInterval(function() {

  var now = new Date().getTime();

  var distance = countDownDate - now;

  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  document.getElementById("demo").innerHTML = days + " Jours " + hours + " heures "
  + minutes + " minutes " + seconds + " secondes ";
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "C est bientot le temps";
  }
}, 1000);
</script>
</center></div></span>
<pre>
  
  
  
  </div>
  <div class="col-sm-6">
<p><h2 class="text-right text-muted" >&nbsp;&nbsp;</h2>
  </div>
</div>



<!-- Footer de la page  -->
<footer id="sticky-footer" class="py-4 bg-dark text-white-50">
    <div class="container text-center">
      <small>Copyright &copy; 2019 Application Web Semantique Time2Code by Karam Mohamed</small>
    </div>
  </footer>

</body>
</html>