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
<script type="text/javascript" src="chartjs/zingchart.min.js"></script> 
<script type="text/javascript" src="chartjs/Chart.js"></script> 
<title>Insert title here</title>
</head>
<body style="background-color: #18191b">
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
    <a class="nav-link" href="Statistiques.jsp">Statistiques</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="GeniusADev">GeniusADev</a>
  </li>
</ul>
</nav>
</nav>

<!-- Milieur de la page ( statistiques ) -->
<h1 class="text-left text-warning" ><dl>&nbsp;A propos Time2Code&nbsp;&nbsp;</dl></h1><
<h2 class="text-left text-muted" ><dl>&nbsp;Quleque statistiques a propos la premiere edition de Time2Code saison 2018&nbsp;&nbsp;</dl></h2><br>
<div class="row">
  <div class="col-sm-6 text-muted">&nbsp;<h2>Le nombre de personnes candidats et le nombre de personnes ayant participé a la competition</h2></div>
  <div class="col-sm-6 text-muted">
  <h2>Ce que nos participants ont choisis comme examens l'année derniere</h2>
  </div>
</div>
<div class="row">
   
  <div class="col-sm-6 text-muted">&nbsp;<canvas id="myChart2" width="400" height="400"></canvas></div>
  <div class="col-sm-6 text-muted"><canvas id="myChart" width="400" height="400"></canvas></div>
</div>
<div class="row">
  <div class="col-sm-6 text-muted"><h1></h1></div>
  <div class="col-sm-6 text-muted"><h1></h1></div>
</div>

 



<!-- Footer de la page  -->
<footer id="sticky-footer" class="py-4 bg-dark text-white-50">
    <div class="container text-center">
      <small>Copyright &copy; 2019 Application Web Semantique Time2Code by Karam & Ahlam</small>
    </div>
  </footer>
  
  
  
<!-- Configuration de ChartJS -->
<script>
  <%!
  // methode pour ajouter des virgules entre les objets de la liste ( pour ChartJS )
  public String join(ArrayList<?> arr, String del)
  {

      StringBuilder output = new StringBuilder();

      for (int i = 0; i < arr.size(); i++)
      {

          if (i > 0) output.append(del);
          
          // --- Quote strings, only, for JS syntax
          if (arr.get(i) instanceof String) output.append("\"");
          output.append(arr.get(i));
          if (arr.get(i) instanceof String) output.append("\"");
      }

      return output.toString();
  }
  
  
  %>
  
  var examens = [<%= join((ArrayList<String>) request.getAttribute("examens"), ",") %>]
  var nombres = [<%= join((ArrayList<Integer>) request.getAttribute("nombres"), ",") %>]
 

  
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: examens,
      datasets: [{
        label: '# of Tomatoes',
        data: nombres,
        backgroundColor: [
          'rgba(255, 99, 132, 0.5)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
     	cutoutPercentage: 40,
      responsive: false,

    }
  });
  
  
  
  // deuxieme chart
   var nb_participants = [<%= join((ArrayList<Integer>) request.getAttribute("nb_participants"), ",") %>]
  var nb_candidats = [<%= join((ArrayList<Integer>) request.getAttribute("nb_candidats"), ",") %>]
  
  
  var ctx2 = document.getElementById("myChart2");
  var myChart2 = new Chart(ctx2, {
  type: 'bar',
  data: {
    labels: ["Candidats", "Participants"],
    datasets: [{
      label: 'Les Candidats',
      data: [parseInt(nb_candidats,10),parseInt(nb_participants,10)],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)'
      ],
      borderWidth: 1
    }]
  },
  options: {
    responsive: false,
    scales: {
      xAxes: [{
        ticks: {
          maxRotation: 0,
          minRotation: 0
        }
      }],
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});
  
  </script>
</body>
</html>