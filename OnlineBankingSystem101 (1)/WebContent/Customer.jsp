<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Global Bank</title>
<style type="text/css">
#container{
	width: 80%;
	height: 450px;
	border: 1px solid black;
	margin: 0 auto;
	position: relative;
}
#container>img{
	width: 100%;
	height: 100%;
	position: absolute;
}
#container>.btn{
	position: absolute;
	width: 50px;
	height: 50px;
	border: none;
	border-radius: 25px;
	top:200px;
	background: lightgray;
	color: white;
	font-size: 20px;
}
#container>btn1:hover{
	box-shadow: -10px 0px 20 px 0px black;
}
#container>btn2:hover{
	box-shadow: -10px 0px 20 px 0px black;
}

#container>#btn2{
	position: relative;
	float: right;
}
#c{
background-color: #d3e4ff;
}
.nav{
background-color: #c0cee5;
color: black;
text align:center;
padding: 20px 0 20px 0;
}
.nav >li{
display: inline-block;
padding:0 25px 0 25px; 
}
.nav > li > a{
text-decoration: none;
color: #ffffff;
}
.nav > li >a:hover{
color: silver;
}





</style>
</head>
<body id="c">
<table  width="100%" height="50%" >
<tr><th height="50" width="50%" align="left" ><b><Font color="navy" ><font size="5"><img alt="" src="eb8.png" height="80px" width="160px"><i>...With us,You're sure</i></Font></b></th>
<th align="right" ><font color="navy" size="4px">Call Us At : 1800 3500 7896 <br><a href="Adminlogin.html">ADMIN</a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Customer.jsp">Home</a></li>
<li><a href="Check.jsp">Check Balance</a></li>
<li><a href="Transfer.jsp">Transfer</a>
<li><a href="DD.jsp">DD Request</a>
<li><a href="Status.jsp">Request Status</a>
<li><a href="C_logout">log out</a>
</ul>
<%
	
	session=request.getSession(false);
	String acc1=(String)session.getAttribute("acc");
	if(acc1==null)
	{
		 //RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
		 //rd.include(request,response);
		
		 response.sendRedirect("./Home.jsp");
	}
%>
<div id="container">
	<img class="slides" src="eb12.jpg">
	<img class="slides" src="eb10.jpg">
	<img class="slides" src="eb15.jpg">
	<img class="slides" src="eb14.jpg">
	<button class="btn" onclick="plusIndex(-1)" id="btn1">&#10094;</button>
	<button class="btn" onclick="plusIndex(1)" id="btn2">&#10094;</button>
</div>

</body>
<script>
		var index=1;
		function plusIndex(n){
			index = index + n;
			showImage(index);
		}
		showImage(1);
		function showImage(n){
			var i;
			var x=document.getElementsByClassName("slides");
			if(n > x.length){ index = 1 };
			if(n < 1){ index = x.length };
			for(i=0;i<x.length;i++)
				{
					x[i].style.display ="none";
				}
			x[index-1].style.display = "block";
		}
		autoSlide();
		function autoSlide(){
			var i;
			var x=document.getElementsByClassName("slides");
			for(i=0;i<x.length;i++)
			{
				x[i].style.display ="none";
			}
			if(index > x.length){ index = 1}
			x[index-1].style.display = "block";
			index++;		
			setTimeout(autoSlide, 4000);
		}
	</script>
</html>