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
    <a class="nav-link" href="Statistiques">Statistiques</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="GeniusADev.jsp">GeniusADev</a>
  </li>
</ul>
</nav>
</nav>

<!-- Milieu de la page -->
<br>
<h3 class="text-center text-muted">
GeniusADev est une organisation au de domaine d'informatique qui a pour but
organiser des competitions en informatique afin de former les meilleurs
personnes dans ce domaine de plus en plus et les aider a developper
mieu leurs idées
</h3>
<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<h4 class="text-muted">Chronologie</h4>
			<ul class="timeline">
				<li>
				<!-- la date , nom et prenom fondateur affichés depuis l'ontologie  -->
					<a target="_blank" class="text-primary">Creation de GeniusADev</a>
					<a class="float-right text-primary"><%= request.getAttribute("datec") %></a>
					<p class="text-muted">Le jour officiel de lancement de l'organisation </p>
					<p class="text-muted">Fondateur : <%= request.getAttribute("nomf") %>&nbsp;<%= request.getAttribute("prenomf") %></p>
					<p class="text-muted">Co-Fondateur : Ahlam El Barhoumi</p>
					<p class="text-muted">Membre d'honneur : Mme Ajhoun Rachida </p>
				</li>
				<li>
					<a class="text-primary">Creation de Time2Code</a>
					<a  class="float-right text-primary">10/09/2016</a>
					<p class="text-muted">Le jour ou GeniusADev a donné naissance a Time2Code</p>
				</li>
				<li>
					<a class="text-primary">Premiere saison</a>
					<a class="float-right text-primary">10/04/2018</a>
					<p class="text-muted">La date de deroulement de la premiere edition de Time2Code</p>
				</li>
			</ul>
		</div>
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